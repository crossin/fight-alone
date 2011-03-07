package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class EnemyFast extends Enemy {
		[Embed(source="res/enemy_fast.png")]
		private var ImgEnemy:Class;
		[Embed(source="res/shadow_fast.png")]
		private var ImgShadow:Class;

		private var _bullets:Array;

		public function EnemyFast(from:int, pgs:Number){
			super(from, pgs);
			loadGraphic(ImgEnemy, true);
			_maxHealth = 40;
			health = _maxHealth;
			unitVelocity = 70;
			unitVelocityAngle = 150;
			angleRange = 45;
			damage = 5;
			defence = 2;
			intervalShoot = 3;
			intervalCheck = 0.5;
			score = 70;
			shadow.loadGraphic(ImgShadow);
			_bullets = PlayState._enemyBullets.members;
		}
	}
}