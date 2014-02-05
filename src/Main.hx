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
	var gameOn:Bool;
	var menuOn:Bool;
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
		menuOn = true;
		game = new Game();
		gameOn = true;
		this.addChild(menu);
		this.addChild(game);
		this.addChild(menu);
		addEventListener(Event.ADDED_TO_STAGE, added);
		Lib.current.stage.addEventListener(Event.ENTER_FRAME, atRefresh);
	}

	function atRefresh(e)
	{
		if (game.health == 0)
		{
			menuOn = true;
		}
		if (game.missingLetters == 0)
		{
			menuOn = true;
		}
		if (menuOn)
		{
			menu.y = 0;
		}
		if (gameOn)
		{
			game.y = 0;
		}
		if (!menuOn)
		{
			menu.y = 500;
		}
		if (!gameOn)
		{
			game.y = 500;
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
