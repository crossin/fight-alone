package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class Battery extends FlxSprite {
		[Embed(source="battery.png")]
		protected var ImgBattery:Class;

		public function Battery(){
			loadGraphic(ImgBattery, true);
			addAnimation("idle", [0]);
			addAnimation("shot", [1, 0], 6, false);
			
		}

		override public function update():void {
			angle = FlxU.getAngle((FlxG.mouse.x + FlxG.mouse.cursor.width / 2) - (x + width / 2), (FlxG.mouse.y + FlxG.mouse.cursor.height / 2) - (y + height / 2));
			super.update();
		}
	}

}