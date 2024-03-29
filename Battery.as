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
		[Embed(source="res/battery_three.png")]
		protected var ImgBatteryThree:Class;
		[Embed(source="res/battery_four.png")]
		protected var ImgBatteryFour:Class;


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
				case 3:
					loadGraphic(ImgBatteryThree, true);
					break;
				case 4:
					loadGraphic(ImgBatteryFour, true);
					break;
			}
		}
	}

}