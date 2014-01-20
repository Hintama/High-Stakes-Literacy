package ;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.events.KeyboardEvent;
import flash.Lib;
import flash.display.BitmapData;
import flash.display.Bitmap;
import openfl.Assets;
import src.Ship;

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
	var counter:Int;
	

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
        counter = 0;
		addEventListener(Event.ADDED_TO_STAGE, added);
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
		Lib.current.stage.addEventListener(Event.ENTER_FRAME, atRefresh);
		ship = new Ship(400,400);
		this.addChild(ship);
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
		
	}
	public static function main() 
	{
		// static entry point
		Lib.current.stage.align = flash.display.StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = flash.display.StageScaleMode.NO_SCALE;
		Lib.current.addChild(new Main());
	}
}
