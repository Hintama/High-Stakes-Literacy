package src;

import flash.display.Bitmap;
import flash.display.Sprite;
import flash.display.BitmapData;
import openfl.Assets;
import flash.Lib;

/**
 * ...
 * @author Johnnyappseed
 */
class Ship extends Sprite
{
	var v:Float;

	public function new(x:Int, y:Int) 
	{
		super();
		var main_ship = new Bitmap(Assets.getBitmapData("img/WhiteShip.png"));
		addChild(main_ship);
		this.x = x;
		this.y = y;
		this.v = 0;
	}
	
	public function left()
	{
		this.v -= 1;
	}
	
	public function right()
	{
		this.v += 1;
	}
	
        public function shoot()
        {
            var b:Bullet = new Bullet(Std.int(this.x + this.width / 2), Std.int(this.y), true);
            Main.game.bullets.add(b);
            Main.game.addChild(b);
        }
	
	public function act()
	{
        if (this.x < 0 && this.v<0) this.v = 0;
        if (this.x > 800 - this.width && this.v>0) this.v = 0;
		v *= .95; 
		this.x += this.v;
	}
	
	
	
}