package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class BatteryPlain extends Battery {


		public function BatteryPlain(blts:Array){
			//super(FlxG.width / 2 - 8, FlxG.height / 2 - 8);
			super(blts);
			[Embed(source="battery.png")]
			var ImgBattery:Class;
			loadGraphic(ImgBattery, true);

			//addAnimation("idle", [0]);
			//addAnimation("shot", [1, 0], 6, false);
			//super();
		}

		//override public function update():void {
		//angle = FlxU.getAngle(FlxG.mouse.x - x, FlxG.mouse.y - y);
		//super.update();
		//}
		override protected function shoot():void {
			super.shoot();
			var b:FlxSprite = bullets[bullet_index];
			b.reset(x + (width - b.width) / 2, y + (height - b.height) / 2);
			b.angle = angle; //FlxU.getAngle(FlxG.mouse.x - x, FlxG.mouse.x - y);
			b.velocity = FlxU.rotatePoint(150, 0, 0, 0, b.angle);
			//b.velocity.x += velocity.x;
			//b.velocity.y += velocity.y;
			bullet_index++;
			if (bullet_index >= bullets.length)
				bullet_index = 0;

		}
		
		override protected function restartClock():void {
			shotClock = 0.3;
		}
	}

}