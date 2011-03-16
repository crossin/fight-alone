package {
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;

	/**
	 * ...
	 * @author Crossin
	 */
	public class BonusTwo extends Bonus {
		[Embed(source="res/bonus_two.png")]
		private var ImgBonus:Class;

		public function BonusTwo(iX:int, iY:int){
			super(iX, iY, ImgBonus);
		}
		
		override public function doEffect():void {
			(FlxG.state as PlayState)._tank.setType(2);
		}
	}
}