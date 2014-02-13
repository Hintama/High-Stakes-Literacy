package ;

import flash.display.Sprite;
import flash.events.Event;
import flash.Lib;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;
import flash.display.Bitmap;
import flash.display.BitmapData;
import openfl.Assets;
import motion.Actuate;

/**
 * ... */

class Main extends Sprite 
{

	var inited:Bool;
	var game:Game;
	var menu:Menu;
	//var loseMenu:LoseMenu;
	//var winMenu:WinMenu;
	//var loseMenu:LoseMenu;
	//var winMenu:WinMenu;
	var frame_count:Int;
	public var zombies:List<Enemy>;
	
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
		frame_count = 0;
		menu = new Menu();
		//loseMenu = new LoseMenu();
		//winMenu = new WinMenu();
		game = new Game();
		zombies = new List<Enemy>();
		this.addChild(game);
		//this.addChild(winMenu);
		//this.addChild(loseMenu);
		this.addChild(menu);
		//this.addChild(WinMenu);
		//this.
		addEventListener(Event.ADDED_TO_STAGE, added);
		Lib.current.stage.addEventListener(Event.ENTER_FRAME, atRefresh);
	}
	

	function atRefresh(e)
	{
		frame_count += 1;
		if (frame_count % 60==0)
		{
			game.act();
		}
		if (menu.lvl1)
		{
			Actuate.tween(menu, 3, { x:0, y:600 } );
			game.lvl = 1;
			game.restart();
			menu.lvl1 = false;
		}
		if (menu.lvl2)
		{
			Actuate.tween(menu, 3, { x:0, y:600 } );
			game.lvl = 2;
			game.restart();
			menu.lvl2 = false;
		}
		if (menu.lvl3)
		{
			Actuate.tween(menu, 3, { x:0, y:600 } );
			game.lvl = 3;
			game.restart();
			menu.lvl3 = false;
		}
		//if (winMenu.winMenuOn == false)
		//{
			//Actuate.tween(winMenu, 3, { x:0, y:600 } );
			//game.restart();
			//winMenu.menuOn = true;
			//
		//}
		//if (loseMenu.loseMenuOn == false)
		//{
			//Actuate.tween(loseMenu, 3, { x:0, y:600 } );
			//game.restart();
			//winMenu.menuOn = true;
			//
		//}
		
		if (game.health == 0)
		{
			Actuate.tween(menu, 4, { x:0, y:0 } );
			game.restart();
		}
		if (game.missingLetters == 0)
		{
			Actuate.tween(menu, 4, { x:0, y:0 } );
			game.restart();
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
