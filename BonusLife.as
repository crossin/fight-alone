package {
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;

	/**
	 * ...
	 * @author Crossin
	 */
	public class BonusLife extends Bonus {
		[Embed(source="res/bonus_life.png")]
		private var ImgBonus:Class;
		
		public function BonusLife(iX:int,iY:int){
			super(iX, iY);
			loadGraphic(ImgBonus);
		}

	}

}