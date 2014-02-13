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
class WinMenu extends Sprite
{
	public var menuOn:Bool;
	public var winMenuOn:Bool;
	public var gameOn:Bool;
	
	public function new() 
	{
		super();
		
		winMenuOn = false;
		menuOn = false;
		
		
		this.x = 0;
		this.y = 0;
		var logo = new Bitmap(Assets.getBitmapData("img/YouWon.png"));
		var background = new Bitmap(Assets.getBitmapData("img/background.png"));
		var playButton = new Bitmap(Assets.getBitmapData("img/play2.png"));
		var LevelSelect = new Bitmap(Assets.getBitmapData("img/LevelSelect.png"));
		
		var menu = new Sprite();
		var play = new Sprite();
		var title = new Sprite();
		var Levels = new Sprite();
		
		title.addChild(logo);
		menu.addChild(background);
		play.addChild(playButton);
		Levels.addChild(LevelSelect);
		
		
		//Levels.addEventListener(MouseEvent.MOUSE_DOWN, BackToMenu);
		play.addEventListener(MouseEvent.MOUSE_DOWN, playGame_mouse);
		
		this.addChild(menu);
		this.addChild(title);
		this.addChild(play);
		this.addChild(Levels);
		
		title.x = 245;
		title.y = 50;
		play.x = 358.25;
		play.y = 160; 
		Levels.x = 322;
		Levels.y = 220;
		
	}	
	public function playGame_mouse(e)
	{
		winMenuOn = false; 
		menuOn = false;
	}
	public function BackToMenu(e)
	{
		winMenuOn = false; 
		menuOn = true;
		
	}
	
}
			
		

	

