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
import flash.text.TextField;
import flash.text.TextFormat;


/**
 * ...
 * @author Hendrixt
 */
class LoseMenu extends Sprite
{
	public var loseMenuOn:Bool;
	public var menuOn:Bool;
	public var zombDont:Bool;
	var wordBox:TextField;
	var ts:TextFormat;
	
	public function new() 
	{
		super();
		
		menuOn = false;
		loseMenuOn = false;
		zombDont = false;
		
		
		this.x = 0;
		this.y = -480;
		var logo = new Bitmap(Assets.getBitmapData("img/YouLose.png"));
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
		
		
		Levels.addEventListener(MouseEvent.MOUSE_DOWN, BackToMenu);
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
		
		ts = new TextFormat();
        ts.font = "Chiller";
        ts.size = 35;               
        ts.color=0xFFFFFF;
        wordBox = new TextField();
        wordBox.text = "Hint: the zombies are clickable!";
        wordBox.setTextFormat(ts);
        this.addChild(wordBox);
		wordBox.width = 400;
		wordBox.x = 300;
		wordBox.y = 300;
		
	}	
	public function playGame_mouse(e)
	{
		loseMenuOn = true;
		zombDont = false;
	}
	public function BackToMenu(e)
	{
	    menuOn = true; 
		zombDont = false;
	}
	
			
}
	

