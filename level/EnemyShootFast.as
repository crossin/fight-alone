package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class EnemyShootFast extends Enemy {
		[Embed(source="res/enemy_shootfast.png")]
		private var ImgEnemy:Class;

		private var _bullets:Array;

		public function EnemyShootFast(from:int, pgs:Number){
			super(from, pgs);
			loadGraphic(ImgEnemy, true);
			_maxHealth = 50;
			health = _maxHealth;
			unitVelocity = 20;
			damage = 4;
			intervalShoot = 1;
			defence = 0.3;
			angleRange = 60;
			unitVelocityAngle = 100;
			intervalCheck = 1;
			score = 80;

			_bullets = PlayState._enemyBullets.members;
		}
	}
}