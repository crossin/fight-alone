package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class EnemyBossCharge extends EnemyBoss {
		[Embed(source="res/charge.png")]
		private var ImgEnemy:Class;

		private var ship:Ship;
		private var _timer:Number;
		private var _timerInterval:Number;

		public function EnemyBossCharge(){
			super(null);
			gibs = PlayState.gibsCharge;
			score = 5;
			health = 200;

			loadGraphic(ImgEnemy, true, false, 96, 64);
			addAnimation("action", [0, 1, 2], 15);
			play("action");

			ship = (FlxG.state as PlayState).ship;

			//if (level == 0) {
			PlayState.lifeBoss.start(health, 2);
			//}

			_timerInterval = 5;
			_timer = _timerInterval;
		}

		override protected function start():void {
			color = 0xcda332;
		}

		override public function update():void {
			_timerInterval = (health < 100) ? 3 : _timerInterval;
			if (solid){
				_timer -= FlxG.elapsed;
				_timer = (_timer < 0) ? _timerInterval : _timer;
				if (_timer > _timerInterval * 0.7) {
					thrust = 0;
					velocity.x = 0;
					velocity.y = 0;
					var angle_dest:Number = FlxU.getAngle((ship.x + ship.width / 2) - (x + width / 2), (ship.y + ship.height / 2) - (y + height / 2));
					if (FlxU.abs(angle - angle_dest) < 5 || FlxU.abs(angle - angle_dest) > 355){
						angle = angle_dest;
					} else {
						if (angle_dest < 180){
							if (angle > angle_dest && angle - angle_dest < 180){
								angularVelocity = -1000/_timerInterval;
							} else {
								angularVelocity = 1000/_timerInterval;
							}
						} else {
							if (angle_dest > angle && angle_dest - angle < 180){
								angularVelocity = 1000/_timerInterval;
							} else {
								angularVelocity = -1000/_timerInterval;
							}
						}
					}
				}else {
					thrust = -1000/_timerInterval;
					angularVelocity = 0;
				}
			}
			super.update();
		}

		override public function hurt(Damage:Number):void {
			super.hurt(Damage);
			PlayState.lifeBoss.decrease(Damage);
		}
		
		override public function kill():void {
			super.kill();
			gibs.at(this);
			gibs.start(true, 0.5, 50);
		}
	}
}