package ;

import flash.display.Sprite;
import flash.Lib;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.display.Bitmap;
import flash.display.BitmapData;
import openfl.Assets;

/**
 * ...
 * @author Johnnyappseed
 */
class Game extends Sprite
{
	var word:String;
	var wordBox:TextField;
	var ts:TextFormat;

	public function new() 
	{
		super();
		setUp();
		this.x = 0;
		this.y = 0;
		word= randomWord();
		ts = new TextFormat();
        ts.font = "Ubuntu";
        ts.size = 20;               
        ts.color=0xFFFFFF;
        wordBox = new TextField();
        wordBox.text = word;
        wordBox.setTextFormat(ts);
        this.addChild(wordBox);
		wordBox.y = 200;
		wordBox.x = 200;
		
	}
	function randomWord()
	{
		return "squirrel";
	}
	
	function setUp()
	{
		var board = new Bitmap(Assets.getBitmapData("img/keyboard.png"));
		var sprite = new Sprite();
		sprite.addChild(board);
		this.addChild(sprite);
		//sprite.scaleX = 120;
		//sprite.scaleY = 120;
	}
	
}