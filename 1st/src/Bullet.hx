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
		addChild(img);
		this.x = x;
		this.y = y;
		CDTDestruction = -1;
	}
	
	public function explode()
	{
		CDTDestruction = 60;
		this.removeChildAt(0);
        var img = new Bitmap(Assets.getBitmapData("img/sprenemy1.png"));
        addChild(img);
	}
	
	public function act()
	{
		if (CDTDestruction < 0)
		{
			if (goingUp) this.y -= 3;
			else this.y += 3;
		}
		else 
		{
			this.alpha = CDTDestruction / 60.0;
			CDTDestruction -= 1;
		}
		if (CDTDestruction == 0 || this.y <-this.height)
		{
			Main.game.bullets.remove(this);
			Main.game.removeChild(this);
		}
	}
	
}