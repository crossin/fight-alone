package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class EnemyBoss extends Enemy {
		[Embed(source="res/sound/hit.mp3")]
		private var SndHit:Class;

		public function EnemyBoss(img:Class, ix:int = 0, iy:int = 0){
			super(img, ix, iy);
		}

		override public function hurt(Damage:Number):void {
			super.hurt(Damage);
			FlxG.play(SndHit, 0.5);
		}
	}
}