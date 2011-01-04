package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class Battery extends FlxSprite {
		[Embed(source="res/battery_plain.png")]
		protected var ImgBatteryPlain:Class;
		[Embed(source="res/battery_double.png")]
		protected var ImgBatteryDouble:Class;

		public function Battery(){
			loadGraphic(ImgBatteryPlain, true);
			addAnimation("idle", [0]);
			addAnimation("shot", [1, 0], 6, false);

		}

		override public function update():void {
			angle = FlxU.getAngle((FlxG.mouse.x + FlxG.mouse.cursor.width / 2) - (x + width / 2), (FlxG.mouse.y + FlxG.mouse.cursor.height / 2) - (y + height / 2));
			super.update();
		}

		public function setType(t:int):void {
			switch (t){
				case 1:
					loadGraphic(ImgBatteryPlain, true);
					break;
				case 2:
					loadGraphic(ImgBatteryDouble, true);
					break;
			}
		}
	}

}