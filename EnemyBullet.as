package {
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;

	/**
	 * ...
	 * @author Crossin
	 */
	public class EnemyBullet extends Bullet {
		[Embed(source="res/bullet.png")]
		private var ImgBullet:Class;
		
		public static var bulletIndex:uint;
		
		public function EnemyBullet(){
			super();
			loadGraphic(ImgBullet, true);
		}

	}

}