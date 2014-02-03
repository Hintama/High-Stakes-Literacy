package src;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.KeyboardEvent;
import src.input;
import src.key;
import flash.display.Bitmap;
import flash.display.BitmapData;

/**
 * ...
 * @author Hintama
 */

 var input:Int;
 var key:String;
 
class gameKeyboard extends Sprite
{

	public function new() 
	{
		super();
		var img = new Bitmap(Assets.getBitmapData("keyboard.png");
		var sprite = new Sprite;
		Sprite.addChild(img);
		sprite.x = 120;
		sprite.y = 600;	
	}
	
	public function traceKeyboard(e : KeyboardEvent)
	{
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
	}
	
}