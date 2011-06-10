package {
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;

	/**
	 * ...
	 * @author Crossin
	 */
	public class BonusLife extends Bonus {
		[Embed(source="res/bonus_life.png")]
		private var ImgBonus:Class;

		public function BonusLife(iX:int, iY:int){
			super(iX, iY, ImgBonus);
		}
		
		override public function doEffect():void {
			(FlxG.state as PlayState)._tank.addLife(10);
		}
	}
}