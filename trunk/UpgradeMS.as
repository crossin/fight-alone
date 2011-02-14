package {
	import org.flixel.FlxPoint;
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Crossin
	 */
	public class UpgradeMS extends Upgrade {

		public function UpgradeMS(){
			name = "MS";
			price = 100;
			increment = 50;
			colorName = 0xffcc0000;
			colorPrice = 0xffffcccc;
			gold = 5;
		}

		override public function doEffect():void {
			var speed:FlxPoint = (FlxG.state as PlayState)._tank.maxVelocity;
			speed.x += 10;
			speed.y += 10;
		}
	}
}