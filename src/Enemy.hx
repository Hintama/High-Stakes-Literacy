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
		var zom = new Bitmap(Assets.getBitmapData("img/zombie.png"));
		var pitchfork = new Bitmap(Assets.getBitmapData("img/pitchfork.png"));
		var sprite = new Sprite();
		sprite.addChild(pitchfork);
		sprite.addChild(zom);
		this.addChild(sprite);
		this.v = -2.0;
	}
	
	
	public function move()
	{
		v = v + (-x * 0.2);
		this.x = x + v;
	}
	
}