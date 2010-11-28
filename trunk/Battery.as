package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class Battery extends FlxSprite {
		[Embed(source="battery.png")]
		private var ImgBattery:Class;

		public function Battery(){
			//super(FlxG.width / 2 - 8, FlxG.height / 2 - 8);
			loadGraphic(ImgBattery, true);

			addAnimation("idle", [0]);
			addAnimation("shot", [1, 0], 6, false);
		}

		override public function update():void {
			angle = FlxU.getAngle(FlxG.mouse.x - x, FlxG.mouse.y - y);
			super.update();
		}
	}

}