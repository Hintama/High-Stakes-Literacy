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
	
	public function new() 
	{
		super();
		this.x = 0;
		this.y = 0;
		var playButton = new Bitmap(Assets.getBitmapData("img/Playbutton.png"));
		var menuBase = new Sprite();
		menuBase.graphics.drawRect(400, 240, 800, 480);
		menuBase.graphics.beginFill(0xFFFFFF);
        this.addChild(menuBase);
		var play = new Bitmap(Assets.getBitmapData("img/Playbutton.png"));
        this.addChild(play);
		var L1button = new Bitmap(Assets.getBitmapData("img/L1button.png"));
		//var L2button = new Bitmap(Assets.getBitmapData("img/L2button.png"));
		//var L3button = new Bitmap(Assets.getBitmapData("img/L3button.png"));

		var L3button = new Bitmap(Assets.getBitmapData("img/L3button.png"));
		play.addEventListener(MouseEvent.MOUSE_DOWN, playGame_mouse );
		L1b.addEventListener(MouseEvent.MOUSE_DOWN, playL2_mouse);
		//L2b.addEventListener(MouseEvent.MOUSE_DOWN, playL2_mouse );
		//L3b.addEventListener(MouseEvent.MOUSE_DOWN, playL3_mouse );
		
		var play = new Sprite();
		var L1b = new Sprite();
		//var L2b = new Sprite();
		//var L3b = new Sprite();
		play.addChild(playButton);
		L1b.addChild(L1button);
		//L2b.addChild(L2button);
		//L3b.addChild(L3button);
		
		this.addChild(play);
		this.addChild(L1b);
		//this.addChild(L2b);
		//this.addChild(L3b);
		play.x = 400;
		play.y = 60; 
		L1b.x = 400;
		L1b.y = 120;
		//L2b.x = 400 ;
		//L2b.y = 180;
		//L3b.x = 400 ;
		//L3b.y = 240;
		
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
	

