package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class EnemyPlain extends Enemy {
		[Embed(source="res/enemy_plain.png")]
		private var ImgEnemy:Class;

		private var _bullets:Array;

		public function EnemyPlain(from:int, pgs:Number){
			super(from, pgs);
			loadGraphic(ImgEnemy, true);
			_maxHealth = 50;
			health = _maxHealth;
			unitVelocity = 20;
			unitVelocityAngle = 100;
			angleRange = 60;
			score = 50;
			damage = 5;
			intervalShoot = 3;
			intervalCheck = 1;
			defence = 0.3;

			_bullets = PlayState._enemyBullets.members;
		}
	}
}