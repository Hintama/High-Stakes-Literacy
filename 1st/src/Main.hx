package ;

import flash.display.Sprite;
import flash.events.Event;
import flash.Lib;
import src.Ship;
import flash.events.KeyboardEvent;
import flash.display.Bitmap;
import flash.display.BitmapData;
import openfl.Assets;

/**
 * ...
 * @author Johnnyappseed
 */

class Main extends Sprite 
{
	var ship:Ship;
	var leftArrowDown:Bool;
	var rightArrowDown:Bool;
	var inited:Bool;
	public static var game:Main;
	public var bullets:List<Bullet>;

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
		addEventListener(Event.ADDED_TO_STAGE, added);
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
		Lib.current.stage.addEventListener(Event.ENTER_FRAME, atRefresh);
		ship = new Ship(50, 50);
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
		if (e.keyCode == 39) rightArrowDown=true; 
	}
	
	function keyUp(e:KeyboardEvent)
	{
		if (e.keyCode == 37) leftArrowDown=false; 
		if (e.keyCode == 39) rightArrowDown=false; 
	}

	function atRefresh(e)
	{
		
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
