package {
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;

	/**
	 * ...
	 * @author Crossin
	 */
	public class Bonus extends FlxSprite {
		private var time:Number;

		public function Bonus(iX:int,iY:int){
			super(iX, iY);
			time = 5;
		}
		
		override public function update():void {
			time -= FlxG.elapsed;
			if (time<0) {
				kill();
			}
			else if (time<1 && !flickering()) {
				flicker();
			}
			super.update();
		}
	}
}