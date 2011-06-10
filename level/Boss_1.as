package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class Boss_1 extends FlxGroup {
		[Embed(source="res/boss_1.png")]
		private var ImgBase:Class;
		[Embed(source="res/boss_1_cannon.png")]
		private var ImgCannon:Class;

		public var base:FlxSprite;
		public var cannon:FlxSprite;

		private var _tank:Tank;
		private var _timer:Number;
		private var _angleDest:Number;
		private var intervalCheck:Number;
		private var intervalShoot:Number;
		private var angleRange:Number;
		private var unitVelocity:Number;
		private var unitVelocityAngle:Number;
		private var shotClock:Number;
		private var _bullets:Array;
		private var _explosions:Array;
		private var damage:int;
		private var defence:Number;
		private var _maxHealth:Number;
		private var _lifeBar:FlxSprite;
		private var _lifeBarBack:FlxSprite;
		private var timeDead:Number;
		private var timeExplode:Number;

		public function Boss_1(){
			super();

			_tank = (FlxG.state as PlayState)._tank;

			_timer = 0;
			_angleDest = 0;
			angleRange = 0;
			intervalCheck = 1;
			intervalShoot = 0.5;
			unitVelocity = 20;
			unitVelocityAngle = 100;
			damage = 5;
			_maxHealth = 50;
			defence = 0.5;
			health = _maxHealth;
			restartClock();
			_bullets = PlayState._enemyBullets.members;
			_explosions = PlayState._explosions.members;

			base = new FlxSprite(200, 200);
			base.loadGraphic(ImgBase, true);
			base.addAnimation("idle", [0]);
			base.addAnimation("move", [0, 1], 12);
			add(base);

			cannon = new FlxSprite(base.x, base.y);
			cannon.loadGraphic(ImgCannon);
			add(cannon)
			
			_lifeBar = PlayState._enemyLifeBar;
			_lifeBarBack = PlayState._enemyLifeBarBack;
			
			timeDead = 3;
			timeExplode = 0;
		}

		override public function update():void {
			if (dead){
				timeDead -= FlxG.elapsed;
				timeExplode -= FlxG.elapsed;
				if (timeExplode < 0){
					explode();
					timeExplode = 0.3 + 0.2 * FlxU.random();
				}
				if (timeDead < 0){
					exists = false;
					(FlxG.state as PlayState).updateProgress(50, 0);
				}
				return;
			}
			
			_timer += FlxG.elapsed;
			if ((_timer > intervalCheck * FlxU.random() + 1) || (base.x < 0) || (base.x > PlayState.maxWidth) || (base.y < 0) || (base.y > PlayState.maxHeight)){
				_timer = 0;
				_angleDest = FlxU.getAngle(_tank.x - base.x, _tank.y - base.y) + angleRange - FlxU.random() * angleRange * 2;
				_angleDest = (_angleDest + 360) % 360;
			}

			if (FlxU.abs(base.angle - _angleDest) < 1 || FlxU.abs(base.angle - _angleDest) > 359){
				base.angle = _angleDest;
				base.angularVelocity = 0;
			} else {
				if (_angleDest < 180){
					if (base.angle > _angleDest && base.angle - _angleDest < 180){
						base.angularVelocity = -unitVelocityAngle;
					} else {
						base.angularVelocity = unitVelocityAngle;
					}
				} else {
					if (_angleDest > base.angle && _angleDest - base.angle < 180){
						base.angularVelocity = unitVelocityAngle;
					} else {
						base.angularVelocity = -unitVelocityAngle;
					}
				}
			}

			base.velocity = FlxU.rotatePoint(unitVelocity, 0, 0, 0, base.angle);

			if (base.velocity.x != 0 || base.velocity.y != 0){
				base.play("move");
			} else {
				base.play("idle");
			}

//angularVelocity = 5;
//base.angle = angle;
//velocity.x = 5;
//base.velocity.y = -5;
//
			cannon.angularVelocity = 90;

			//shoot
			shotClock -= FlxG.elapsed;
			if (shotClock < 0){
				restartClock();
				shoot();
			}

			super.update();

			cannon.x = base.x;
			cannon.y = base.y;
			
			//life bar
			var mouseX:Number = FlxG.mouse.x + 4.5;
			var mouseY:Number = FlxG.mouse.y + 4.5;
			if ((mouseX > base.x && mouseX < base.x + base.width) && (mouseY > base.y && mouseY < base.y + base.height)){
				_lifeBar.x = base.x;
				_lifeBar.y = base.y - 2;
				_lifeBarBack.x = base.x - 1;
				_lifeBarBack.y = base.y - 3;
				_lifeBarBack.visible = true;
				_lifeBar.visible = true;
				_lifeBarBack.createGraphic(base.width + 2, 3);
				_lifeBarBack.fill(0xff000000);
				var c:uint;
				if (health > _maxHealth * 0.75){
					c = 0xff00ff00 | uint(255 * 4 * (1 - health / _maxHealth)) << 16;
				} else {
					c = 0xffff0000 | uint(255 * 4 / 3 * health / _maxHealth) << 8;
				}
				var w:int = health / _maxHealth * base.width;
				if (w > 0){
					_lifeBar.createGraphic(w, 1, c);
					_lifeBar.fill(c);
				} else {
					_lifeBar.fill(0);
				}
			}
		}

		private function shoot():void {
			var b:EnemyBullet = _bullets[EnemyBullet.bulletIndex];
			b.owner = this.base;
			b.damage = damage;
			b.reset(base.x + (base.width - b.width) / 2 + Math.cos(cannon.angle * Math.PI / 180) * 32, base.y + (base.height - b.height) / 2 + Math.sin(cannon.angle * Math.PI / 180) * 32);
			b.angle = cannon.angle; //FlxU.getAngle(FlxG.mouse.x - x, FlxG.mouse.x - y);
			b.velocity = FlxU.rotatePoint(150, 0, 0, 0, b.angle + 15);
			//b.velocity.x += velocity.x;
			//b.velocity.y += velocity.y;
			EnemyBullet.bulletIndex++;
			if (EnemyBullet.bulletIndex >= _bullets.length)
				EnemyBullet.bulletIndex = 0;
		}

		private function restartClock():void {
			shotClock = intervalShoot; // * (0.5 + FlxU.random());
		}
		
		override public function kill():void {
			if (dead)
				return;
			dead = true;
			_fixed = true;
			flicker(-1);
		}
		
		private function explode():void {
			var e:Explosion = _explosions[Explosion.explosionIndex];
			e.reset(base.x - e.width / 2 + base.width * FlxU.random(), base.y - e.height / 2 + base.height * FlxU.random());
			e.play("explode", true);
			Explosion.explosionIndex++;
			if (Explosion.explosionIndex >= _explosions.length)
				Explosion.explosionIndex = 0;
		}
		
		override public function hurt(Damage:Number):void {
			//FlxG.play(SndHit);
			super.hurt(Damage * (1 - defence));
			flicker(0.2);
		}
	}
}