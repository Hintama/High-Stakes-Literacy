package ;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;
import flash.Lib;
import flash.text.TextField;
import flash.text.TextFormat;
import String;
import openfl.Assets;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;

/**
 * ...
 * @author Johnnyappseed
 */
class Game extends Sprite
{
	var word:String;
	var wordBox:TextField;
	var ts:TextFormat;
	public var health:Int;
	var key:String;
	var input:Int;
	var hiddenWord:Array<String>;
	var guessedLetters:Array<String>;
	var maskedWord:String;

	public function new() 
	{
		super();
		//setUp();
		health = 6;
		this.x = 0;
		this.y = 0;
		hiddenWord = new Array<String>();
		guessedLetters = [];
		word = randomWord();
		for (x in 0...word.length)
		{
			hiddenWord[x] = word.charAt(x);
		}
		maskedWord=guessingWord(hiddenWord, guessedLetters);
		textBoxSetup(maskedWord);
		//Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, traceKey);
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, traceKeyboard);
		
	}
	
	function traceKey(e : KeyboardEvent)
	{
		trace(e.keyCode);
	}	
	
	function traceKeyboard(e : KeyboardEvent)
	{
		var contains:Bool;
		contains = false;
		input = e.keyCode;
		
		if (input == 65)
			key = 'a';
		if (input == 66)
			key = 'b';
		if (input == 67)
			key = 'c';
		if (input == 68)
			key = 'd';
		if (input == 69)
			key = 'e';
		if (input == 70)
			key = 'f';
		if (input == 71)
			key = 'g';
		if (input == 72)
			key = 'h';
		if (input == 73)
			key = 'i';
		if (input == 74)
			key = 'j';
		if (input == 75)
			key = 'k';
		if (input == 76)
			key = 'l';
		if (input == 77)
			key = 'm';
		if (input == 78)
			key = 'n';
		if (input == 79)
			key = 'o';
		if (input == 80)
			key = 'p';
		if (input == 81)
			key = 'q';
		if (input == 82)
			key = 'r';
		if (input == 83)
			key = 's';
		if (input == 84)
			key = 't';
		if (input == 85)
			key = 'u';
		if (input == 86)
			key = 'v';
		if (input == 87)
			key = 'w';
		if (input == 88)
			key = 'x';
		if (input == 89)
			key = 'y';
		if (input == 90)
			key = 'z';
		
		for (char in guessedLetters)
		{
			if (char == key)
			{
				contains = true;
			}
		}
		if (!contains) 
		{
			guessedLetters.push(key);
			maskedWord = guessingWord(hiddenWord, guessedLetters);
			wordBox.text = maskedWord;
			wordBox.setTextFormat(ts);
			trace(guessedLetters);
		}
	}
	function guessingWord(word:Array<String>, guessed:Array<String>)
	{
		var contains:Bool;
		contains = false;
		var guessedLetter:String;
		guessedLetter = guessed[guessed.length - 1];
		var output:String;
		output = "";
		var counter:Int;
		counter = 0;
		for (char in word)
		{
			if (char == guessedLetter)
			{
				contains = true;
			}
		}
		if (!contains)
		{
			health -= 1;
		}
		for (char in word)
		{
			counter += 1;
			for (g in guessed)
			{
				if (g == char)
				{
					output += g;
				}
			}
			if (counter > output.length)
			{
				output += "_";
			}
		}
		return output;
	}
	
	function textBoxSetup(word:String)
	{
		ts = new TextFormat();
        ts.font = "Ubuntu";
        ts.size = 45;               
        ts.color=0xFFFFFF;
        wordBox = new TextField();
        wordBox.text = word;
        wordBox.setTextFormat(ts);
        this.addChild(wordBox);
		wordBox.y = 20;
		wordBox.x = 400;
		wordBox.width=400;
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