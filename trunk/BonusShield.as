package {
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;

	/**
	 * ...
	 * @author Crossin
	 */
	public class BonusShield extends Bonus {
		[Embed(source="res/bonus_shield.png")]
		private var ImgBonus:Class;

		public function BonusShield(iX:int, iY:int){
			super(iX, iY, ImgBonus);
		}
		
		override public function doEffect():void {
			(FlxG.state as PlayState).shield.exists = true;
			(FlxG.state as PlayState).shield.health = 5;
		}
	}
}