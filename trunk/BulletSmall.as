package {
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;

	/**
	 * ...
	 * @author Crossin
	 */
	public class BulletSmall extends Bullet {
		[Embed(source="res/bullet_small.png")]
		private var ImgBullet:Class;
		
		public function BulletSmall(){
			super();
			loadGraphic(ImgBullet);
			damage = 1;
		}
	}
}