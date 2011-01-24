package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class EnemyFast extends Enemy {
		[Embed(source="res/enemy_fast.png")]
		private var ImgEnemy:Class;

		private var _bullets:Array;

		public function EnemyFast(from:int, pgs:Number){
			super(from, pgs);
			loadGraphic(ImgEnemy, true);
			_maxHealth = 2;
			unitVelocity = 70;
			angleRange = 3;
			score = 150;
			health = _maxHealth;

			_bullets = PlayState._enemyBullets.members;
		}
	}
}