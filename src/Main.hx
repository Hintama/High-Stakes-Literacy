package ;

import flash.display.Sprite;
import flash.events.Event;
import flash.Lib;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;
import flash.display.Bitmap;
import flash.display.BitmapData;
import openfl.Assets;

/**
 * ... */

class Main extends Sprite 
{

	var inited:Bool;
	var game:Game;
	var menu:Menu;
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
		
	}

	/* SETUP */

	public function new() 
	{
		super();
		menu = new Menu();
		game = new Game();
		this.addChild(menu);
		this.addChild(game);
		game.y=500;
		addEventListener(Event.ADDED_TO_STAGE, added);
		Lib.current.stage.addEventListener(Event.ENTER_FRAME, atRefresh);
	}

	function atRefresh(e)
	{
		if (game.health == 0)
		{
			trace("fuck");
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
	
	public static function main() 
	{
		// static entry point
		Lib.current.stage.align = flash.display.StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = flash.display.StageScaleMode.NO_SCALE;
		Lib.current.addChild(new Main());
	}
}
