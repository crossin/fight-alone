package {
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;

	/**
	 * ...
	 * @author ...
	 */
	public class EnemyBullet extends Bullet {
		[Embed(source="res/bullet.png")]
		private var ImgBullet:Class;
		
		public function EnemyBullet(){
			super();
			loadGraphic(ImgBullet, true);
		}

	}

}