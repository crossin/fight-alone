package {
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;

	/**
	 * ...
	 * @author Crossin
	 */
	public class BonusShootfast extends Bonus {
		[Embed(source="res/bonus_shootfast.png")]
		private var ImgBonus:Class;

		public function BonusShootfast(iX:int, iY:int){
			super(iX, iY, ImgBonus);
		}
		
		override public function doEffect():void {
			(FlxG.state as PlayState)._tank.changeBullet(1);
		}
	}
}