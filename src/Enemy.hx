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
	
	public function new() 
	{
		super();
		var zom = new Bitmap(Assets.getBitmapData("img/zombie.png"));
		var pitchfork = new Bitmap(Assets.getBitmapData("img/pitchfork.png"));
		var sprite = new Sprite();
		sprite.addChild(pitchfork);
		sprite.addChild(zom);
		this.addChild(sprite);
<<<<<<< HEAD
		this.v = -2.0;
		sprite.addEventListener(MouseEvent.MOUSE_DOWN, onClick);
=======
		this.v = -0.5;
>>>>>>> 3f4e2c3af786618d4069c4c5222352f39dd8ca61
	}
	
	
	public function move()
	{
		v = x + (-x * 1.005);
		this.x = x + v;
	}
	
	function onClick(e:MouseEvent)
	{
		//Actuate.tween(this, 0.5, { x:(this.x - 10), y:this.y } );
	}
	
}