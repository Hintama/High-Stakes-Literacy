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
    public var ship:Ship;
	public static var game:Main;
	public var bullets:List<Bullet>;
	public var enemies:List<Enemy>;
	var counter:Int;
	var menu:Sprite;
	var text:TextField;
	

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
		game = this;
        bullets = new List<Bullet>();
        enemies = new List<Enemy>();
        counter = 0;
		menu = new Sprite();
		menu.graphics.beginFill(0xFFFFFF, .30);
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
		if (e.keyCode == 32) ship.shoot();
	}
	
	function keyUp(e:KeyboardEvent)
	{
		if (e.keyCode == 37) leftArrowDown=false; 
		if (e.keyCode == 39) rightArrowDown=false; 
	}

	function atRefresh(e)
	{
		counter += 1;
		if (leftArrowDown) ship.left();
		if (rightArrowDown) ship.right();
		ship.act();
		for (bullet in bullets) bullet.act();
		for (enemy in enemies) enemy.act();
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
