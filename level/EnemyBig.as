package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class EnemyBig extends Enemy {
		[Embed(source="res/enemy_big.png")]
		private var ImgEnemy:Class;
		[Embed(source="res/shadow_big.png")]
		private var ImgShadow:Class;

		private var _bullets:Array;

		public function EnemyBig(from:int, pgs:Number){
			super(from, pgs);
			loadGraphic(ImgEnemy, true);
			_maxHealth = 100;
			health = _maxHealth;
			unitVelocity = 10;
			unitVelocityAngle = 50;
			angleRange = 15;
			damage = 5;
			defence = 0.3;
			intervalShoot = 3;
			intervalCheck = 1.5;
			score = 100;
			shadow.loadGraphic(ImgShadow);
			_bullets = PlayState._enemyBullets.members;
		}
	}
}