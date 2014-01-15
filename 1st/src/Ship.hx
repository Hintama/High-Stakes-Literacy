package src;

import flash.display.Bitmap;
import flash.display.Sprite;
import openfl.Assets;

/**
 * ...
 * @author Johnnyappseed
 */
class Ship extends Sprite
{

	public function new(x:Int, y:Int) 
	{
		super();
		var main_ship = new Bitmap(Assets.getBitmapData("img/WhiteShip.png"));
		addChild(main_ship);
		this.x = x;
		this.y = y;
	}
	
	
}