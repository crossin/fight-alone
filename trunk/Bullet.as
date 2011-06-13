package {
	import org.flixel.FlxEmitter;
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
		public var damage:int;
		
		public static var bulletIndex:uint;
		
		public function Bullet(){
			super(0, 0, ImgBullet);
			exists = false;
			owner = null;
			damage = 10;
		}
		
		override public function kill():void {
			super.kill();
			var gibs:FlxEmitter = PlayState._gibs;
			gibs.at(this);
			gibs.start(true, 0.4, 25);
		}
	}
}