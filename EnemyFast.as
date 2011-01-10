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

		public function EnemyFast(from:int){
			super(from);
			loadGraphic(ImgEnemy, true);
			_maxHealth = 20;
			unitVelocity = 70;
			angleRange = 3;
			
			health = _maxHealth;

			_bullets = PlayState._enemyBullets.members;
		}
	}
}