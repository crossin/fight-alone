package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class Battery extends FlxSprite {
		protected var bullets:Array;
		protected var bullet_index:int;
		protected var shotClock:Number;

		public function Battery(blts:Array){
			bullets = blts;
			bullet_index = 0;
			addAnimation("idle", [0]);
			addAnimation("shot", [1, 0], 6, false);
			restartClock();
		}

		protected function shoot():void {
			restartClock();
			play("idle");
			play("shot");
		}

		protected function restartClock():void {
			// to be override
		}

		override public function update():void {
			angle = FlxU.getAngle((FlxG.mouse.x + FlxG.mouse.cursor.width / 2) - (x + width / 2), (FlxG.mouse.y + FlxG.mouse.cursor.height / 2) - (y + height / 2));
			super.update();
			shotClock -= FlxG.elapsed;
			if (FlxG.mouse.pressed()){
				if (shotClock < 0){
					shoot();
				}
			}
		}
	}

}