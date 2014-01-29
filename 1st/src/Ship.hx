package ;

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
	public var isAlive:Bool;
	var health:Int;
	var MAX_HEALTH = 5;

	public function new(x:Int, y:Int, lvl:Int) 
	{
		health = MAX_HEALTH;
		super();
		isAlive = true;
		var main_ship = new Bitmap(Assets.getBitmapData("img/WhiteShip.png"));
		var sprite = new Sprite();
		sprite.addChild(main_ship);
		sprite.x = -main_ship.width / 2;
		sprite.y = -main_ship.height / 2;
		this.addChild(sprite);
		this.x = x;
		this.y = y;
		this.v = 0;
	}
	
	public function reanimate()
	{
		isAlive = true; 
		health = MAX_HEALTH;
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
		if (isAlive)
		{
			var b:Bullet = new Bullet(Std.int(this.x), Std.int(this.y-this.height/2), true);
			Main.game.bullets.add(b);
			Main.game.addChild(b);
		}
	}
	
	public function kill()
	{
		this.health -= 1;
		if (health <= 0)
		{
				Main.game.displayMenu();
				Main.game.removeChild(this);
				isAlive = false;
		}
	}
	
	public function act()
	{
        if (this.x < this.width / 2 && this.v < 0) 
		{
			this.v = 0;
			this.x = this.width / 2;
		}
        if (this.x > 800 - this.width/2 && this.v > 0) 
		{
			this.v = 0;
			this.x = 800 -this.width / 2;
		}
		this.v *= .80; 
		this.x += this.v;
	}
	
	
	
}