package {
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;

	/**
	 * ...
	 * @author Crossin
	 */
	public class Shield extends FlxSprite {
		[Embed(source="res/shield.png")]
		private var ImgShield:Class;

		public function Shield(){
			super(0, 0);
			loadGraphic(ImgShield, true);
			addAnimation("active", [0, 1, 2, 3], 18);
			play("active");
			
			health = 5;
		}

		override public function hurt(Damage:Number):void {
			super.hurt(1);
		}
	}
}