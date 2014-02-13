package;

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
import motion.Actuate;


/**
 * ...
 * @author Hendrixt
 */
class Menu extends Sprite
{
	public var lvl1:Bool;
	public var lvl2:Bool;
	public var lvl3:Bool;
	
	public function new() 
	{
		super();
		
		lvl1 = false;
		lvl2 = false;
		lvl3 = false;
		
		this.x = 0;
		this.y = 0;
		var logo = new Bitmap(Assets.getBitmapData("img/logo2.png"));
		var background = new Bitmap(Assets.getBitmapData("img/background.png"));
		var playButton = new Bitmap(Assets.getBitmapData("img/play2.png"));
		var L1button = new Bitmap(Assets.getBitmapData("img/easy.png"));
		var L2button = new Bitmap(Assets.getBitmapData("img/normal.png"));
		var L3button = new Bitmap(Assets.getBitmapData("img/hard.png"));
		
		var menu = new Sprite();
		var title = new Sprite();
		var play = new Sprite();
		var L1b = new Sprite();
		var L2b = new Sprite();
		var L3b = new Sprite();
		
		title.addChild(logo);
		menu.addChild(background);
		play.addChild(playButton);
		L1b.addChild(L1button);
		L2b.addChild(L2button);
		L3b.addChild(L3button);
		
		
		play.addEventListener(MouseEvent.MOUSE_DOWN, playGame_mouse );
		L1b.addEventListener(MouseEvent.MOUSE_DOWN, playL1_mouse);
		L2b.addEventListener(MouseEvent.MOUSE_DOWN, playL2_mouse );
		L3b.addEventListener(MouseEvent.MOUSE_DOWN, playL3_mouse );
		
		this.addChild(menu);
		this.addChild(title);
		this.addChild(play);
		this.addChild(L1b);
		this.addChild(L2b);
		this.addChild(L3b);
		
		title.x = 100;
		title.y = 50; 
		play.x = 358.25;
		play.y = 160; 
		L1b.x = 358.25;
		L1b.y = 220;
		L2b.x = 342 ;
		L2b.y = 280;
		L3b.x = 358.25;
		L3b.y = 340;
		
	}	
	public function playGame_mouse(e)
	{
		
	}
	public function playL1_mouse(e)
	{
		lvl1 = true;
	}
	public function playL2_mouse(e)
	{
		lvl2 = true;
	}
	public function playL3_mouse(e)
	{
		lvl3 = true;
	}
			
		
}
	

