package;

import flash.display.Sprite;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.events.Event;
import openfl.Assets;


/**
 * ...
 * @author Trey Clark
 */
class Enemy extends Sprite
{

	var v:Float;
	
	public function new() 
	{
		super();
		var img = new Bitmap(Assets.getBitmapData("img/zombie.png"));
		var sprite = new Sprite();
		sprite.addChild(img);
		this.addChild(sprite);
		sprite.width = 50;
		sprite.height = 75;
		this.v = -0.5;
	}
	
	
	
	
	
	public function move()
	{
		v = v + (v * 0.2);
		this.x = v + x;
	}
	
}