package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class Enemy extends FlxSprite {

		[Embed(source="res/enemy.png")]
		private var ImgEnemy:Class;

		//private var _gibs:FlxEmitter;
		private var _timer:Number;
		private var _tank:Tank;
		private var _angleDest:Number;
		protected var _maxHealth:Number;
		protected var unitVelocity:Number;
		protected var angleRange:Number;
		private var _lifeBar:FlxSprite;
		private var _lifeBarBack:FlxSprite;
		private var shotClock:Number;
		private var _bullets:Array;
		private var _explosions:Array;
		private var progress:Number;
		//private var _bulletIndex:uint;
		//private var _explosionIndex:uint;


		public function Enemy(from:int, pgs:Number){
			//super();
			switch (from){
				case 0:
					reset(FlxU.random() * PlayState.maxWidth, -20);
					break;
				case 1:
					reset(-20, FlxU.random() * PlayState.maxHeight);
					break;
				case 2:
					reset(PlayState.maxWidth + 20, FlxU.random() * PlayState.maxHeight);
					break;
				case 3:
				default:
					reset(FlxU.random() * PlayState.maxWidth, PlayState.maxHeight + 20);
					break;
			}
			loadGraphic(ImgEnemy, true);
			//height = height - 1; //draw the crate 1 pixel into the floor
			//acceleration.y = 400;
			_tank = PlayState._tank;
			progress = pgs;
			//_gibs = gibs;
			_timer = 0;
			_angleDest = 0;
			_maxHealth = 20;
			unitVelocity = 20;
			angleRange = 90;
			//origin.x=0
			drag.x = 10;
			drag.y = 10;
			health = _maxHealth;
			//maxAngular = 5;
			//angularDrag = 20;
			//maxVelocity.x = 10;
			//maxVelocity.y = 10;

			_bullets = PlayState._enemyBullets.members;
			_explosions = PlayState._explosions.members;
			//_bulletIndex = (FlxG.state as PlayState)._bulletIndex;
			//_explosionIndex = (FlxG.state as PlayState)._explosionIndex;
			restartClock();
			antialiasing = true;
			addAnimation("idle", [0]);
			addAnimation("move", [0, 1], 12);

			_lifeBar = PlayState._enemyLifeBar;
			_lifeBarBack = PlayState._enemyLifeBarBack;
			//_lifeBar.reset(x, y - 2);
			//_lifeBarBack.reset(x - 1, y - 3);
			//_lifeBar.createGraphic(width, 1);
			//_lifeBarBack.createGraphic(width + 2, 3);
			//_lifeBar.fill(0xff00ff00);
			//_lifeBarBack.fill(0xff000000);
		}

		override public function update():void {
			_timer += FlxG.elapsed;
			if (_timer > 4 * FlxU.random() + 1){
				_timer = 0;
				_angleDest = FlxU.getAngle(_tank.x - x, _tank.y - y) + angleRange - FlxU.random() * angleRange * 2;
				_angleDest = (_angleDest + 360) % 360;
			}


			//thrust = 0;
			//if (_timer > 1){
			//	_timer = 0;
			//} else if (_timer < 0.2){
			//	thrust = 40;
			//} else {
			if (FlxU.abs(angle - _angleDest) < 1 || FlxU.abs(angle - _angleDest) > 359){
				//angle = _angleDest;
				angularVelocity = 0;

			} else {
				if (_angleDest < 180){
					if (angle > _angleDest && angle - _angleDest < 180){
						angularVelocity = -100;
					} else {
						angularVelocity = 100;
					}
				} else {
					if (_angleDest > angle && _angleDest - angle < 180){
						angularVelocity = 100;
					} else {
						angularVelocity = -100;
					}
				}
			}

			velocity = FlxU.rotatePoint(unitVelocity, 0, 0, 0, angle);
			//}

			//if (da < angle)
			//angularAcceleration = -angularDrag;
			//else if (da > angle)
			//angularAcceleration = angularDrag;
			//else
			//angularAcceleration = 0;
			if (velocity.x != 0 || velocity.y != 0){
				play("move");
			} else {
				play("idle");
			}
			//trace(_lifeBar. - _lifeBar.x)
			//trace(_lifeBar.origin.y - _lifeBar.y)
			//_lifeBar.scale.x = health / _maxHealth;
			//_lifeBar.width = 16 * scale.x;



			//var c:uint = 0xff00ff00 * (health / _maxHealth) + 0xffffff00 * (1 - health / _maxHealth)
			//_lifeBar.fill(c);
			//_lifeBar.visible = false;

			//shoot
			shotClock -= FlxG.elapsed;
			if (shotClock < 0){
				restartClock();
				shoot();
			}

			//_lifeBar.update();
			//_lifeBarBack.update();
			super.update();
			var mouseX:Number = FlxG.mouse.x + 4.5;
			var mouseY:Number = FlxG.mouse.y + 4.5;
			if ((mouseX > x && mouseX < x + width) && (mouseY > y && mouseY < y + height)){
				_lifeBar.x = x;
				_lifeBar.y = y - 2;
				_lifeBarBack.x = x - 1;
				_lifeBarBack.y = y - 3;
				_lifeBar.visible = true;
				_lifeBarBack.visible = true;
				_lifeBarBack.createGraphic(width + 2, 3);
				_lifeBarBack.fill(0xff000000);

				var c:uint;
				if (health > _maxHealth * 0.75){
					c = 0xff00ff00 | uint(255 * 4 * (1 - health / _maxHealth)) << 16;
				} else {
					c = 0xffff0000 | uint(255 * 4 / 3 * health / _maxHealth) << 8;
				}
				var w:int = health / _maxHealth * width;
				if (w > 0){
					_lifeBar.createGraphic(w, 1, c)
				} else {
					_lifeBar.fill(0);
				}
			}
		}

		override public function render():void {
			super.render();

		}

		override public function hurt(Damage:Number):void {
			//FlxG.play(SndHit);
			super.hurt(Damage);
			flicker(0.2);
			//FlxG.score += 10;

		}

		override public function kill():void {
			if (dead)
				return;
			//FlxG.play(SndExplode);
			//_lifeBar.kill();
			super.kill();
			flicker(-1);
			//FlxG.quake.start(0.005, 0.35);
			//FlxG.flash.start(0xffd8eba2, 0.35);
			//_jets.kill();
			explode();
			(FlxG.state as PlayState).updateProgress(progress);
			//_gibs.at(this);
			//_gibs.start(true, 1, 8);
			//FlxG.score += 200;
		}

		private function shoot():void {
			if (x < 0 || x > PlayState.maxWidth || y < 0 || y > PlayState.maxHeight){
				return;
			}
			var b:EnemyBullet = _bullets[EnemyBullet.bulletIndex];
			b.owner = this;
			b.reset(x + (width - b.width) / 2, y + (height - b.height) / 2);
			b.angle = angle; //FlxU.getAngle(FlxG.mouse.x - x, FlxG.mouse.x - y);
			b.velocity = FlxU.rotatePoint(150, 0, 0, 0, b.angle);
			//b.velocity.x += velocity.x;
			//b.velocity.y += velocity.y;
			EnemyBullet.bulletIndex++;
			if (EnemyBullet.bulletIndex >= _bullets.length)
				EnemyBullet.bulletIndex = 0;
		}


		private function explode():void {
			var e:Explosion = _explosions[Explosion.explosionIndex];
			e.reset(x, y);
			e.play("explode");
			Explosion.explosionIndex++;
			if (Explosion.explosionIndex >= _explosions.length)
				Explosion.explosionIndex = 0;
		}

		private function restartClock():void {
			shotClock = 1 + FlxU.random() * 3;
			_angleDest = angle;
			_timer = 0;
		}
	}
}