package {
	import org.flixel.FlxEmitter;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;

	/**
	 * ...
	 * @author Crossin
	 */
	public class Scrap extends FlxSprite {
		[Embed(source="res/star.png")]
		private var ImgScrap:Class;

		public static var scrapIndex:uint;

		public function Scrap(){
			super(0, 0, ImgScrap);
			angularVelocity = 90;
			color = 0xea1a1a;
			exists = false;
		}
		
		//public function start(ix:int, iy:int, index:int):void {
			//
		//}

		//override public function kill():void {
			//super.kill();
			//var gibs:FlxEmitter = PlayState._gibs;
			//gibs.at(this);
			//gibs.start(true, 0.5, 10);
		//}
	}
}