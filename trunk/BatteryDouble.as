package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class BatteryDouble extends Battery {


		public function BatteryDouble(blts:Array){
			super(blts);
			[Embed(source="battery.png")]
			var ImgBattery:Class;
			loadGraphic(ImgBattery, true);
		}

		override protected function shoot():void {
			super.shoot();
			var b:FlxSprite = bullets[bullet_index];
			var dist:FlxPoint = FlxU.rotatePoint(0, 5, 0, 0, b.angle);
			b = bullets[bullet_index];
			b.reset(x + (width - b.width) / 2, y + (height - b.height) / 2);
			b.angle = angle;
			dist = FlxU.rotatePoint(0, height/4, 0, 0, b.angle);
			b.x -= dist.x;
			b.y -= dist.y;
			b.velocity = FlxU.rotatePoint(150, 0, 0, 0, b.angle);
			bullet_index++;
			b = bullets[bullet_index];
			b.reset(x + (width - b.width) / 2, y + (height - b.height) / 2);
			b.angle = angle;
			dist = FlxU.rotatePoint(0, -height/4, 0, 0, b.angle);
			b.x -= dist.x;
			b.y -= dist.y;
			b.velocity = FlxU.rotatePoint(150, 0, 0, 0, b.angle);
			bullet_index++;

			if (bullet_index >= bullets.length)
				bullet_index = 0;

		}

		override protected function restartClock():void {
			shotClock = 0.3;
		}
	}

}