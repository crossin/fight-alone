package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class Battery extends FlxSprite {
		[Embed(source="bot.png")]
		private var ImgBattery:Class;

		public function Battery() {
			//super(FlxG.width / 2 - 8, FlxG.height / 2 - 8, ImgBattery);
			loadGraphic(ImgBattery);
		}
		
		override public function update():void 
		{
			angle = FlxU.getAngle(FlxG.mouse.x - x, FlxG.mouse.y - y);
			super.update();
		}
	}

}