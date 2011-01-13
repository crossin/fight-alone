package {
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;

	/**
	 * ...
	 * @author Crossin
	 */
	public class Bullet extends FlxSprite {
		[Embed(source="res/bullet.png")]
		private var ImgBullet:Class;
		
		public var owner:FlxObject;
		
		public function Bullet(){
			super(0, 0, ImgBullet);
			exists = false;
			owner = null;
		}

	}

}