package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class EnemyBossBarrage extends EnemyBoss {
		[Embed(source="res/barrage.png")]
		private var ImgEnemy:Class;

		private var ship:Ship;
		private var _timer:Number;
		private var _timerLast:Number;
		private var _timerInterval:Number;
		private var timerShoot:Number;

		private var cannons:Array;
		private var invincible:Boolean;
		private var numGun:int;
		private var phase:int;
		private var count:int;
		private var clockwise:Boolean;

		public function EnemyBossBarrage(){
			super(ImgEnemy, 550, 400);
			gibs = PlayState.gibsBarrage;
			score = 5;
			health = 200;

			ship = (FlxG.state as PlayState).ship;

			cannons = new Array(8);


			//if (level == 0) {
			PlayState.lifeBoss.start(health + 200);
			//}
			phase = 0;
			numGun = 0;
			invincible = true;
			_timerInterval = 5;
			_timer = 0;
			_timerLast = 0;
			count = 0;
			clockwise = true;
			timerShoot = 1;
			maxVelocity.x = 200;
			maxVelocity.y = 200;
		}

		override protected function start():void {
			//color = 0xd90395;
			//for (var i:int = 0; i < 8; i++){
			//}

		}

		override public function update():void {
			if (solid){
				_timer += FlxG.elapsed;
				if (phase == 0){
					if (_timer > numGun * 0.3 && _timerLast <= numGun * 0.3){
						cannons[numGun] = new EnemyBossCannon(this, numGun);
						//cannons[numGun].x = x + origin.x + 96 * Math.sin(numGun * Math.PI / 4) - cannons[numGun].origin.x;
						//cannons[numGun].y = y + origin.y + 96 * Math.cos(numGun * Math.PI / 4) - cannons[numGun].origin.y;
						//cannons[numGun].angle = angle - numGun * 45 + 180;
						(FlxG.state as PlayState)._enemies.add(cannons[numGun]);
						numGun++;
						if (numGun >= 8){
							phase = 1;
							angularVelocity = 1;
							angularAcceleration = 20;
						}
					}
				}
				if (phase == 1){
					angularAcceleration = (angularVelocity > 200) ? -20 : angularAcceleration;
					angularAcceleration = (angularVelocity < -200) ? 20 : angularAcceleration;
					if (_timer % timerShoot < _timerLast % timerShoot){
						if (cannons[count % 8].exists){
							cannons[count % 8].action(timerShoot);
						}
						count++;
					}
					if (FlxU.abs(angularVelocity) < 1){
						phase = 2;
						angularVelocity = 0;
						angularAcceleration = 0;
						_timer = 0;
						_timerLast = 0;
					}
				}
				if (phase == 2){
					//angularAcceleration = (angularVelocity > 200) ? -20 : angularAcceleration;
					if (_timer > 3){
						phase = 1;
						clockwise = !clockwise;
						angularAcceleration = clockwise ? 20 : -20;
						angularVelocity = clockwise ? 1 : -1;
					}
					if (_timer % timerShoot < _timerLast % timerShoot){
						for (var i:int = 0; i < 8; i++){
							if (cannons[i].exists){
								cannons[i].shoot();
							}
						}
					}
				}
				_timerLast = _timer;
			}


			//_timerInterval = (health < 100) ? 3 : _timerInterval;
			//if (solid){
			//_timer -= FlxG.elapsed;
			//_timer = (_timer < 0) ? _timerInterval : _timer;
			//if (_timer > _timerInterval * 0.7) {
			//thrust = 0;
			//velocity.x = 0;
			//velocity.y = 0;
			//var angle_dest:Number = FlxU.getAngle((ship.x + ship.width / 2) - (x + width / 2), (ship.y + ship.height / 2) - (y + height / 2));
			//if (FlxU.abs(angle - angle_dest) < 5 || FlxU.abs(angle - angle_dest) > 355){
			//angle = angle_dest;
			//} else {
			//if (angle_dest < 180){
			//if (angle > angle_dest && angle - angle_dest < 180){
			//angularVelocity = -1000/_timerInterval;
			//} else {
			//angularVelocity = 1000/_timerInterval;
			//}
			//} else {
			//if (angle_dest > angle && angle_dest - angle < 180){
			//angularVelocity = 1000/_timerInterval;
			//} else {
			//angularVelocity = -1000/_timerInterval;
			//}
			//}
			//}
			//}else {
			//thrust = -1000/_timerInterval;
			//angularVelocity = 0;
			//}
			//}
			super.update();
		}

		override public function hurt(Damage:Number):void {
			if (!invincible){
				super.hurt(Damage);
				PlayState.lifeBoss.decrease(Damage);
			}
		}

		public function loseGun():void {
			numGun--;
			timerShoot -= 0.1;
			PlayState.lifeBoss.decrease(25);
			if (numGun <= 0){
				color = 0xd90395;
				invincible = false;
				velocity.x = 100;
				velocity.y = 100;
				angularVelocity = 200;
				angularAcceleration = 0;
				phase = 3;
			}
		}

		override public function hitLeft(Contact:FlxObject, Velocity:Number):void {
			velocity.x = -1.1 * velocity.x;
		}

		override public function hitRight(Contact:FlxObject, Velocity:Number):void {
			velocity.x = -1.1 * velocity.x;
		}

		override public function hitTop(Contact:FlxObject, Velocity:Number):void {
			velocity.y = -1.1 * velocity.y;
		}

		override public function hitBottom(Contact:FlxObject, Velocity:Number):void {
			velocity.y = -1.1 * velocity.y;
		}
	}
}