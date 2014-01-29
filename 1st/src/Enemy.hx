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
class Enemy extends Sprite
{
	var refx:Int;
	var counter:Int;
	var period:Float;

	public function new(x:Int, y:Int, lvl:Int) 
	{
		super();
		var img = new Bitmap(Assets.getBitmapData("img/sprenemy1.png"));
		if (lvl == 2)
		{
			var img = new Bitmap(Assets.getBitmapData("img/spaceship128.png"));
		}
		
		var sprite = new Sprite();
		sprite.addChild(img);
		sprite.x = -img.width / 2;
		sprite.y = -img.height / 2;
		this.addChild(sprite);
		this.rotation = 180;
		this.refx = x;
		this.x = x;
		this.y = y;
		this.counter = Std.int(Math.random() * 1000);
		this.period = Math.random() * 3 + 1;
	}
	public function kill()
	{
		Main.game.removeChild(this);
		Main.game.enemies.remove(this);
	}
	public function shoot()
	{
		var b:Bullet = new Bullet(Std.int(this.x), Std.int(this.y + this.height/2), false);
		Main.game.bullets.add(b);
		Main.game.addChild(b);
	}
	
	public function act()
	{
        if (this.counter % 180 == 0) this.shoot();
		this.counter += 1;
		this.x = this.refx + 30 * Math.sin(2 * Math.PI * this.counter / 60.0 / this.period);
	}
	
	
	
}