package {
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;

	/**
	 * ...
	 * @author Crossin
	 */
	public class BonusBig extends Bonus {
		[Embed(source="res/bonus_big.png")]
		private var ImgBonus:Class;

		public function BonusBig(iX:int, iY:int){
			super(iX, iY, ImgBonus);
		}
		
		override public function doEffect():void {
			(FlxG.state as PlayState)._tank.setType(6);
		}
	}
}