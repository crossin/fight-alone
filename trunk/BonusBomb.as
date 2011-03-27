package {
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;

	/**
	 * ...
	 * @author Crossin
	 */
	public class BonusBomb extends Bonus {
		[Embed(source="res/bonus_bomb.png")]
		private var ImgBonus:Class;

		public function BonusBomb(iX:int, iY:int){
			super(iX, iY, ImgBonus);
		}
		
		override public function doEffect():void {
			(FlxG.state as PlayState).bomb();
		}
	}
}