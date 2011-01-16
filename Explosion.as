package {
	import org.flixel.FlxSprite;

	/**
	 * ...
	 * @author Crossin
	 */
	public class Explosion extends FlxSprite {
		[Embed(source="res/explosion.png")]
		private var ImgExplosion:Class;

		public static var explosionIndex:uint;
		
		public function Explosion(){
			loadGraphic(ImgExplosion, true);
			//antialiasing = true;
			addAnimation("explode", [0, 1, 2, 3, 4, 5, 6, 7], 24, false);
		}

		override public function update():void {
			super.update();
			if (finished){
				exists = false;
			}
		}
	}

}