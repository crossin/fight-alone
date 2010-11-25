package {
	import org.flixel.FlxSprite;

	/**
	 * ...
	 * @author Crossin
	 */
	public class Enemy extends FlxSprite {

		[Embed(source="crate.png")]
		private var ImgCrate:Class;

		public function Enemy(){
			super(100, 100, ImgCrate);
			//height = height - 1; //draw the crate 1 pixel into the floor
			//acceleration.y = 400;
			drag.x = 200;
			drag.y = 200;
		}
	}
}