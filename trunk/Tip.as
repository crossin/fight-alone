package {
	import org.flixel.FlxText;
	import org.flixel.FlxG;

	/**
	 * ...
	 * @author Crossin
	 */
	public class Tip extends FlxText {
		private var timer:Number;

		public function Tip(){
			super(0, 440, 640, "NEW ACHIEVEMENT");
			size = 16;
			alignment = "center";
			timer = 0;
			exists = false;
		}

		override public function update():void {
			if (exists) {
				timer -= FlxG.elapsed;
				if (timer > 0){
					alpha += FlxG.elapsed * 2;
					velocity.y = (y > 420) ? -100 : 0;
				} else {
					alpha -= FlxG.elapsed * 2;
					velocity.y = -100;
				}
			}
			if (alpha <= 0){
				kill();
			}
			super.update();
		}

		public function show():void {
			reset(0, 460);
			alpha = 0;
			timer = 2;
		}
	}

}