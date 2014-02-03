package src;

import flash.display.Sprite;
import flash.display.Bitmap;
import flash.display.BitmapData;
import openfl.Assets;

/**
 * ...
 * @author Johnnyappseed
 */
class Game extends Sprite
{

	public function new() 
	{
		super();
		setUp();
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