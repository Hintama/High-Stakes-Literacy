package ;

import flash.display.Bitmap;
import flash.display.Sprite;
import flash.display.BitmapData;
import openfl.Assets;
import flash.Lib;

/**
 * ...
 * @author ...
 */
class Bullet extends Sprite
{
	var goingUp:Bool;
	var CDTDestruction:Int;

	public function new(x:Int, y:Int, goingUp:Bool) 
	{
		super();
		this.goingUp = goingUp;
		var img = new Bitmap(Assets.getBitmapData("img/rocket.png"));
		var sprite = new Sprite();
		sprite.addChild(img);
		sprite.x = -img.width / 2;
		sprite.y = -img.height / 2;
		this.addChild(sprite);
		this.x = x;
		this.y = y;
		if (!goingUp) this.rotation = 180;
		CDTDestruction = -1;
	}
	
	public function explode()
	{
		CDTDestruction = 60;
		this.removeChildAt(0);
        var img = new Bitmap(Assets.getBitmapData("img/explosion1.png"));
		img.height = 100;
		img.width = 100; 
		var sprite = new Sprite();
		sprite.addChild(img);
		sprite.x = -img.width / 2;
		sprite.y = -img.height / 2;
        this.addChild(sprite);
	}
	
	public function act()
	{
		if (CDTDestruction < 0)
		{
			for (bullet in Main.game.bullets)
			{
				var d = Math.sqrt((this.x - bullet.x) * (this.x - bullet.x) + (this.y - bullet.y) * (this.y - bullet.y));
				if (this.goingUp != bullet.goingUp && d < 3)
				{
					this.explode();
					bullet.explode();
					return;
				}
			}
			if (goingUp) 
			{
				this.y -= 3;
				for (enemy in Main.game.enemies)
				{
					var d = Math.sqrt((this.x - enemy.x) * (this.x - enemy.x) + (this.y - enemy.y) * (this.y - enemy.y));
					if (d < 30)
					{
						this.explode();
						enemy.kill();
					}
				}
			}
			else 
			{
				this.y += 3;
				var ship = Main.game.ship;
				if (ship.isAlive)
				{
					var d = Math.sqrt((this.x - ship.x) * (this.x - ship.x) + (this.y - ship.y) * (this.y - ship.y));
					if (d < 30)
					{
						this.explode();
						ship.kill();
					}
				}
			}
			
		}
		else 
		{
			this.alpha = CDTDestruction / 60.0;
			CDTDestruction -= 1;
		}
		if (CDTDestruction == 0 || this.y <-this.height || this.y>480+this.height)
		{
			Main.game.bullets.remove(this);
			Main.game.removeChild(this);
		}
	}
	
}