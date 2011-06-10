package {
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;

	/**
	 * ...
	 * @author Crossin
	 */
	public class BonusFour extends Bonus {
		[Embed(source="res/bonus_four.png")]
		private var ImgBonus:Class;

		public function BonusFour(iX:int, iY:int){
			super(iX, iY, ImgBonus);
		}
		
		override public function doEffect():void {
			(FlxG.state as PlayState)._tank.setType(4);
		}
	}
}