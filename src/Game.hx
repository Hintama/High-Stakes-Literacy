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
	var guessedLettersBoard:TextField;
	public var health:Int;
	public var missingLetters:Int;
	var input:Int;
	var hiddenWord:Array<String>;
	var guessedLetters:Array<String>;
	var maskedWord:String;
	var hangman:Bitmap;
	var hangmanBoard:Sprite;
	var score:Score;
	public var zombies:List<Enemy>;
	public var bitchimhere:Bool;
	public var lvl:Int;
	

	public function new() 
	{
		super();
		lvl = 1;
		health = 6;
		hiddenWord = [];
		guessedLetters = [];
		word = randomWord();
		missingLetters = word.length;
		score = new Score();
		score.x = 600;
		score.y = 400;
		setUp();
		for (x in 0...word.length)
		{
			hiddenWord[x] = word.charAt(x);
		}
		maskedWord=guessingWord(hiddenWord, guessedLetters);
		wordBoxSetup(maskedWord);
		guessedLettersBoard = new TextField();
		guessedLettersBoard.text = "Letters Guessed: "+guessedLettersToWord(guessedLetters);
		guessedLettersBoard.setTextFormat(ts);
		this.addChild(guessedLettersBoard);
		guessedLettersBoard.y = 430;
		guessedLettersBoard.x = 50;
		guessedLettersBoard.width = 800;
		//Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, traceKey);
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, traceKeyboard);
	}
	
	public function act()
	{
		for (zombie in zombies)
		{
			zombie.move();
			if (zombie.x < 175)
			{
				zomwin();
			}
		}
	}
	
	public function restart()
	{
		for (zombie in zombies)
		{
			zombie.die();
		}
		health = 6;
		word = randomWord();
		guessedLetters = [];
		hiddenWord = [];
		missingLetters = word.length;
		for (x in 0...word.length)
		{
			hiddenWord[x] = word.charAt(x);
		}
		hangmanBoard.removeChild(hangman);
		hangman = new Bitmap(Assets.getBitmapData("img/Hangman_" + Std.string(health) + ".png"));
		hangmanBoard.addChild(hangman);
		maskedWord=guessingWord(hiddenWord, guessedLetters);
        wordBox.text = maskedWord;
        wordBox.setTextFormat(ts);
		guessedLettersBoard.text = "Letters Guessed: "+guessedLettersToWord(guessedLetters);
		guessedLettersBoard.setTextFormat(ts);
		if (lvl >= 2)
		{
			horde();
		}
	}
	
	function updateMissingLetters(word:String)
	{
		missingLetters = 0;
		for (x in 0...word.length)
		{
			if (word.charAt(x) == "_") missingLetters += 1;
		}
	}
	
	function guessedLettersToWord(letters:Array<String>)
	{
		var outPut:String;
		outPut = "";
		for (x in letters)
		{
			outPut += x;
		}
		return outPut;
	}
	function traceKey(e : KeyboardEvent)
	{
		trace(e.keyCode);
	}	
	
	function traceKeyboard(e : KeyboardEvent)
	{
		var key:String;
		key = "";
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
		if (key.length != 0)
		{
			
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
				guessedLettersBoard.text = "Guessed Letters: "+guessedLettersToWord(guessedLetters);
				guessedLettersBoard.setTextFormat(ts);
				wordBox.text = maskedWord;
				wordBox.setTextFormat(ts);
			}
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
		if (guessedLetter != null)
		{
			if (!contains)
			{
				if (health > 0)
				{
					/*
					 * here is where things happen if you guess a letter wrong
					 * */
					health -= 1;
					hangmanBoard.removeChild(hangman);
					hangman = new Bitmap(Assets.getBitmapData("img/Hangman_" + Std.string(health) + ".png"));
					hangmanBoard.addChild(hangman);
				}
			}
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
		updateMissingLetters(output);
		return output;
	}
	
	function wordBoxSetup(word:String)
	{
		ts = new TextFormat();
        ts.font = "Chiller";
        ts.size = 35;               
        ts.color=0xFFCCCC;
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
		var line:String;
		line = Assets.getText("txt/load1.txt");
		var words:Array<String> = line.split(",");
		return words[Std.random(25)];
	}
	
	function setUp()
	{
		/*var board = new Bitmap(Assets.getBitmapData("img/keyboard.png"));
		var sprite = new Sprite();
		sprite.addChild(board);
		this.addChild(sprite);
		sprite.x = 325;
		sprite.y = 200;*/
		//sprite.scaleX = 120;
		//sprite.scaleY = 120;
		bitchimhere = false;
		zombies = new List<Enemy>();
		hangman = new Bitmap(Assets.getBitmapData("img/Hangman_" + Std.string(health) + ".png"));
		hangmanBoard = new Sprite();
		hangmanBoard.addChild(hangman);
		hangmanBoard.x = 100;
		hangmanBoard.y = 100;
		hangmanBoard.width = 200;
		hangmanBoard.height = 300;
		this.addChild(hangmanBoard);
		this.horde();
	}
	
	public function horde()
	{
		for ( x in 0 ... 1)
		{
			var zombie = new Enemy();
			this.addChild(zombie);
			zombies.add(zombie);
			zombie.move();
			
		}
	}
	
	function zomwin()
	{
		health = 0;
		bitchimhere = true;
	}
	
	
}