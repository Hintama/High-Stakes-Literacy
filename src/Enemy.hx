package;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.events.Event;
import openfl.Assets;
import motion.Actuate;

/**
 * ...
 * @author Trey Clark
 */
class Enemy extends Sprite
{

	var v:Float;
	var counter:Int;
	var period:Float;
	public var sprite:Sprite;
	
	public function new() 
	{
		super();
		var zom = new Bitmap(Assets.getBitmapData("img/zombie.png"));
		var pitchfork = new Bitmap(Assets.getBitmapData("img/pitchfork.png"));
		sprite = new Sprite();
		sprite.addChild(pitchfork);
		pitchfork.width = pitchfork.width - 35;
		pitchfork.x = this.x - 41;
		sprite.addChild(zom);
		this.addChild(sprite);
		sprite.addEventListener(MouseEvent.MOUSE_DOWN, onClick);
		this.v = -0.5;
		this.x = 900;
		this.y = 220;
		this.height = 160;
		this.width = 115;
		//counter = Std.int(Math.random() * 10);
		period = Math.random() ;
	}

	public function die()
	{
		this.removeChild(sprite);
	}
	
	public function move()
	{
		
		this.y = this.y + 15 * Math.sin(this.x / period);
		if (this.x > 175)
		{
			Actuate.tween(this, 0.03, { x:(this.x - 1), y:this.y } );
		}
	}
	
	function onClick(e:MouseEvent)
	{
		Actuate.tween(this, .4, { x:(this.x + 10), y:this.y } );
	}
	
}