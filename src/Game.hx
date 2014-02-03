package ;

import flash.display.Bitmap;
import flash.display.Sprite;
import openfl.Assets;
import flash.Lib;
import flash.text.TextField;
import flash.text.TextFormat;
import String;

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
		var hiddenWord:Array<String> = new Array<String>();
		word = randomWord();
		for (x in 0...word.length)
		{
			hiddenWord[x] = word.charAt(x);
		}
		trace(hiddenWord);
		textBoxSetup(word);
		
	}
	function textBoxSetup(word:String)
	{
		ts = new TextFormat();
        ts.font = "Ubuntu";
        ts.size = 20;               
        ts.color=0xFFFFFF;
        wordBox = new TextField();
        wordBox.text = word;
        wordBox.setTextFormat(ts);
        this.addChild(wordBox);
		wordBox.y = 20;
		wordBox.x = 400;
	}
	function randomWord()
	{
		return "squirrel";
	}
	
}