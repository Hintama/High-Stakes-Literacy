package ;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.events.KeyboardEvent;
import flash.Lib;
import flash.display.BitmapData;
import flash.display.Bitmap;
import flash.text.TextField;
import flash.text.TextFormat;
import openfl.Assets;

/**
 * ...
 * @author Johnnyappseed
 */

class Main extends Sprite 
{
	var inited:Bool;
	var leftArrowDown:Bool;
	var rightArrowDown:Bool;
	var shoot:Bool;
	var shootcd:Int;
	var Max_shootcd:Int;
    public var ship:Ship;
	public static var game:Main;
	public var bullets:List<Bullet>;
	public var enemies:List<Enemy>;
	var counter:Int;
	var menu:Sprite;
	var text:TextField;
	var score_board:Sprite;
	var board:TextField;
	public var score:Int;
	

	/* ENTRY POINT */
	
	function resize(e) 
	{
		if (!inited) init();
		// else (resize or orientation change)
	}
	
	function init() 
	{
		if (inited) return;
		inited = true;

		// (your code here)
		
		// Stage:
		// stage.stageWidth x stage.stageHeight @ stage.dpiScale
		
		// Assets:
		// nme.Assets.getBitmapData("img/assetname.jpg");
	}

	/* SETUP */

	public function new() 
	{
		super();
		shootcd = 0;
		Max_shootcd = 20;
		game = this;
        bullets = new List<Bullet>();
        enemies = new List<Enemy>();
        counter = 0;
		score = 0;
		score_board = new Sprite();
		score_board.graphics.drawRect(700, 0, 100, 100);
		var formate = new TextFormat();
		formate.font = "Ubuntu";
		formate.size = 30;
		formate.color = 0xFFFFFF;
		board = new TextField();
		board.text = Std.string(score);
		board.width = 50;
		board.setTextFormat(formate);
		score_board.addChild(board);
		board.y = 50;
		board.x = 700;
		this.addChild(score_board);
		menu = new Sprite();
		menu.graphics.beginFill(0xFFFFFF, .10);
		menu.graphics.drawRect(0, 0, 800, 480);
		var txt = new TextFormat();
		txt.font = "Ubuntu";
		txt.size = 40;
		txt.color = 0xFFFFFF;
		text = new TextField();
		text.text = 'Play Again';
		text.width = 400;
		text.setTextFormat(txt);
		menu.addChild(text);
		text.y = 100;
		text.x = 50;	
		addEventListener(Event.ADDED_TO_STAGE, added);
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
		Lib.current.stage.addEventListener(Event.ENTER_FRAME, atRefresh);
		text.addEventListener(MouseEvent.MOUSE_DOWN, playAgain_click);
		ship = new Ship(400,400,1);
		this.addChild(ship);
		makeEnemies();
	}
	
	public function displayMenu()
	{
		this.addChild(menu);
	}
	
	public function playAgain()
	{
		while (this.numChildren > 0) this.removeChildAt(0);
		this.addChild(ship);
		bullets = new List<Bullet>();
		enemies = new List<Enemy>();
		ship.reanimate();
		makeEnemies();
		Lib.current.stage.focus = this.stage;
	}
	
	public function playAgain_click(e:MouseEvent)
	{
		playAgain();
	}
	
	public function makeEnemies()
	{
		for (i in 0...6)
		{
			var enemy = new Enemy(Std.int(100 + 600 / 5 * i), 100, 1);
			this.addChild(enemy);
			enemies.add(enemy);
		}
	}
	
	function added(e) 
	{
		removeEventListener(Event.ADDED_TO_STAGE, added);
		stage.addEventListener(Event.RESIZE, resize);
		#if ios
		haxe.Timer.delay(init, 100); // iOS 6
		#else
		init();
		#end
	}
	
	function keyDown(e:KeyboardEvent)
	{
		if (e.keyCode == 37) leftArrowDown=true; 
		if (e.keyCode == 39) rightArrowDown = true; 
        if (e.keyCode == 77) displayMenu();
		if (e.keyCode == 32) shoot=true;
	}
	
	function keyUp(e:KeyboardEvent)
	{
		if (e.keyCode == 37) leftArrowDown=false; 
		if (e.keyCode == 39) rightArrowDown=false; 
		if (e.keyCode == 32) shoot=false;
	}

	function atRefresh(e)
	{
		counter += 1;
		this.score += 1;
		if (shootcd > 0) shootcd -= 1;
		if (leftArrowDown) ship.left();
		if (rightArrowDown) ship.right();
		if (shoot && shootcd == 0) 
		{
			ship.shoot();
			shootcd = Max_shootcd;
		}
		ship.act();
		for (bullet in bullets) bullet.act();
		for (enemy in enemies) enemy.act();
		if (enemies.length<5 && counter % 150 == 0)
		{
				var enemy = new Enemy(Std.int(Math.random()*600+100), 100,2);
				this.addChild(enemy);
				enemies.add(enemy);
		}
		if (enemies.length<10 && counter % 150 == 0)
		{
				var enemy = new Enemy(Std.int(Math.random()*600+100), 100,1);
				this.addChild(enemy);
				enemies.add(enemy);
		}
		
	}
	public static function main() 
	{
		// static entry point
		Lib.current.stage.align = flash.display.StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = flash.display.StageScaleMode.NO_SCALE;
		Lib.current.addChild(new Main());
	}
}
