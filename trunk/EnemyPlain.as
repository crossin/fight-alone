package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class EnemyPlain extends Enemy {
		[Embed(source="res/enemy.png")]
		private var ImgEnemy:Class;

		private var _bullets:Array;

		public function EnemyPlain(from:int){
			super(from);
			loadGraphic(ImgEnemy, true);
			_maxHealth = 20;
			health = _maxHealth;

			_bullets = PlayState._enemyBullets.members;
		}
	}
}