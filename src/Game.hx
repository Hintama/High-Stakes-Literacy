package ;

import flash.display.Bitmap;
import flash.display.Sprite;
import openfl.Assets;
import flash.Lib;
import flash.text.TextField;
import flash.text.TextFormat;

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
	
}