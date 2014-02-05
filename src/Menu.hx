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


/**
 * ...
 * @author Hendrixt
 */
class Menu extends Sprite
{
		public var menu:Sprite;
	
	public function new() 
	{
		super();
		var menuBase = new Sprite();
		menuBase.graphics.drawRect(400, 240, 800, 480);
		menuBase.graphics.beginFill(0xFFFFFF);
        this.addChild(menuBase);
		var play = new Bitmap(Assets.getBitmapData("img/Playbutton.png"));
        this.addChild(play);
		var L1button = new Bitmap(Assets.getBitmapData("img/L1button.png"));
        this.addChild(L1button);
		var L2button = new Bitmap(Assets.getBitmapData("img/L2button.png"));
        this.addChild(L2button);
		var L3button = new Bitmap(Assets.getBitmapData("img/L3button.png"));
        this.addChild(L3button);
		play.addEventListener(MouseEvent.MOUSE_DOWN, playGame_mouse );
		L1button.addEventListener(MouseEvent.MOUSE_DOWN, playL2_mouse);
		L2button.addEventListener(MouseEvent.MOUSE_DOWN, playL2_mouse);
		L3button.addEventListener(MouseEvent.MOUSE_DOWN, playL3_mouse);
	
	}	
	public function playGame_mouse(e)
	 {
	 
	 
	}
	
	public function playL1_mouse(e)
	 {
	 
		 
	 
	}
	public function playL2_mouse(e)
	 {
	
	 
	}
	public function playL3_mouse(e)
	 {
	 
		 
		 
	}
		
		
		
}
	