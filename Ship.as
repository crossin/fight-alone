package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class Ship extends FlxSprite {
		//protected var type:int;
		protected var speed_temp:Number;
		protected var direct:FlxPoint;
		protected var angle_dest:Number;
		//protected var battery:Battery;
		protected var bullets:Array;
		//private var explosions:Array;
		//protected var bullet_index:int;
		protected var shotClock:Number;
		protected var shotSpeed:Number;
		protected var shoot:Function;
		//protected var lifeBar:FlxSprite;
		//protected var maxHealth:Number;
		//protected var _shadow:FlxSprite;
		//protected var damage:int;
		//protected var defence:int;
		protected var shootInterval:Number;
		protected var rebornTime:Number;

		[Embed(source="res/ship.png")]
		protected var ImgShip:Class;
		//[Embed(source="res/tank_double.png")]
		//protected var ImgTankDouble:Class;
		//[Embed(source="res/tank_small.png")]
		//protected var ImgTankSmall:Class;
		//[Embed(source="res/tank_big.png")]
		//protected var ImgTankBig:Class;
		//[Embed(source="res/tank_shadow.png")]
		//protected var ImgTankShadow:Class;
		//[Embed(source="res/tank_shadow_small.png")]
		//protected var ImgTankShadowSmall:Class;
		//[Embed(source="res/tank_shadow_big.png")]
		//protected var ImgTankShadowBig:Class;
		[Embed(source="res/sound/shoot.mp3")]
		private var SndShoot:Class;
		[Embed(source="res/sound/dead.mp3")]
		private var SndDead:Class;
		[Embed(source="res/sound/bomb.mp3")]
		private var SndBomb:Class;

		public static var speed:int;
		public static var rate:int;
		public static var power:int;
		public static var bombs:int;
		public static var lives:int;

		public function Ship(startX:int, startY:int){
			super(startX, startY);
			loadGraphic(ImgShip, true);
			//type = 0;
			//maxHealth = 50;
			//health = maxHealth;
			//battery = PlayState._battery;
			bullets = PlayState._bullets.members;
			//explosions = PlayState._explosions.members;
			//bulletIndex = (FlxG.state as PlayState)._bulletIndex;
			//_explosionIndex = (FlxG.state as PlayState)._explosionIndex; = 0;
			//lifeBar = PlayState._lifeBar;
			drag.x = 500;
			drag.y = 500;
			antialiasing = true;
			shootInterval = 1.1 - rate * 0.2;
			restartClock();
			shoot = this["shoot".concat(power)];
			shotSpeed = 500;
			direct = new FlxPoint();

			maxVelocity.x = 50 + speed * 30;
			maxVelocity.y = maxVelocity.x;

			health = lives + 1;
			rebornTime = 0;
			//damage = 10;
			//defence = 0.3;

			//addAnimation("stop", [0]);
			//addAnimation("move", [0, 1], 12);

			//_shadow = new FlxSprite(x + 1, y + 1, ImgTankShadow);
		}

		override public function update():void {
			acceleration.x = 0;
			acceleration.y = 0;
			angularVelocity = 0;
			angle = (angle + 360) % 360;
			direct.x = 0;
			direct.y = 0;
			shotClock -= FlxG.elapsed;
			rebornTime -= FlxG.elapsed;

			if (FlxG.keys.LEFT || FlxG.keys.A){
				acceleration.x = -drag.x;
				//if (angle > 90 && angle < 265){
				//angularVelocity += 240;
				//} else if (angle <= 90 || angle > 275){
				//angularVelocity -= 240;
				//} else {
				//angle = 270;
				//}
				direct.x = -1;
			}
			if (FlxG.keys.RIGHT || FlxG.keys.D){
				acceleration.x = drag.x;
				//if (angle > 95 && angle < 270){
				//angularVelocity -= 240;
				//} else if (angle < 85 || angle >= 270){
				//angularVelocity += 240;
				//} else {
				//angle = 90;
				//}
				direct.x = 1;
			}
			if (FlxG.keys.UP || FlxG.keys.W){
				acceleration.y = -drag.y;
				//if (angle > 5 && angle < 180){
				//angularVelocity -= 240;
				//} else if (angle >= 180 && angle < 355){
				//angularVelocity += 240;
				//} else {
				//angle = 0;
				//}
				direct.y = -1;
			}
			if (FlxG.keys.DOWN || FlxG.keys.S){
				acceleration.y = drag.y;
				//if (angle >= 0 && angle < 175){
				//angularVelocity += 240;
				//} else if (angle > 185 && angle < 360){
				//angularVelocity -= 240;
				//} else {
				//angle = 180;
				//}
				direct.y = 1;
			}
			if (FlxG.keys.justPressed("SPACE")){
				explode();
			}

			//if (FlxG.mouse.pressed() && shotClock < 0){
			if (shotClock < 0){
				restartClock();
				//battery.play("idle");
				//battery.play("shot");
				FlxG.play(SndShoot);
				shoot();
			}
			speed_temp = Math.sqrt(velocity.x * velocity.x + velocity.y * velocity.y)
			if (speed_temp > maxVelocity.x){
				velocity.x *= (maxVelocity.x / speed_temp);
				velocity.y *= (maxVelocity.y / speed_temp);
			}

			//if (velocity.x != 0 || velocity.y != 0){
			//play("move");
			//} else {
			//play("stop");
			//}

			//x = (x < 0) ? 0 : x;
			//x = (x + width > PlayState.maxWidth) ? PlayState.maxWidth - width : x;
			//y = (y < 0) ? 0 : y;
			//y = (y + height > PlayState.maxHeight) ? PlayState.maxHeight - height : y;

			if (direct.x != 0 || direct.y != 0){
				angle_dest = (FlxU.getAngle(direct.x, direct.y) + 450) % 360;
				if (FlxU.abs(angle - angle_dest) < 5 || FlxU.abs(angle - angle_dest) > 355){
					angle = angle_dest;
				} else {
					if (angle_dest < 180){
						if (angle > angle_dest && angle - angle_dest < 180){
							angularVelocity = -500;
						} else {
							angularVelocity = 500;
						}
					} else {
						if (angle_dest > angle && angle_dest - angle < 180){
							angularVelocity = 500;
						} else {
							angularVelocity = -500;
						}
					}
				}
			}
			//color = 0x00ff0000;
			//alpha = (alpha * 100 + 1) % 100 / 100;
			super.update();
			//battery.reset(x + (width - battery.width) / 2, y + (height - battery.height) / 2);
			//_shadow.reset(x + 1, y + 1);
			//_shadow.angle = angle;
		}

		//override public function render():void {
		//_shadow.render();
		//super.render();
		//}

		override public function hurt(Damage:Number):void {
			if (rebornTime < 0){
				super.hurt(Damage);
				rebornTime = 1;
				if (health > 0){
					lives--;
					(FlxG.state as PlayState).lives[lives].visible = false;
					FlxG.quake.start();
					FlxG.play(SndDead);
				}
			}

		}

		//FlxG.play(SndHit);
		//if (Damage >= defence){
		//super.hurt(Damage * (1 - defence));
		//var w:int = health / maxHealth * 50;
		//if (w > 0){
		//lifeBar.createGraphic(w, 4, 0xfff29a7d);
		//lifeBar.fill(0xfff29a7d);
		//} else {
		//lifeBar.fill(0);
		//}
		//}
		//flicker(0.2);
		//battery.flicker(0.2);
//
		//EndState.score += 10;
//
		//}

		override public function kill():void {
			super.kill();
			FlxG.play(SndDead);
			FlxG.quake.start();
			//FlxG.flash.start(0xff000000, 0.35);
			var gibs:FlxEmitter = PlayState.gibsShip;
			gibs.at(this);
			gibs.start(true, 1, 50);
		}

		//public function setType(t:int):void {
		//if (type != t){
		//switch (t){
		//case 1:
		//loadGraphic(ImgTankPlain, true);
		//battery.setType(1);
		//shoot = shootPlain;
		//break;
		//case 2:
		//loadGraphic(ImgTankDouble, true);
		//battery.setType(2);
		//shoot = shootDouble;
		//break;
		//case 3:
		//battery.setType(3);
		//shoot = shootThree;
		//break;
		//case 4:
		//battery.setType(4);
		//shoot = shootFour;
		//break;
		//case 5:
		//loadGraphic(ImgTankSmall, true);
		//_shadow.loadGraphic(ImgTankShadowSmall, true);
		//defence = 0.2;
		//maxVelocity.x = 70;
		//maxVelocity.y = 70;
		//break;
		//case 6:
		//loadGraphic(ImgTankBig, true);
		//_shadow.loadGraphic(ImgTankShadowBig, true);
		//defence = 0.5;
		//maxVelocity.x = 30;
		//maxVelocity.y = 30;
		//break;
		//}
		//type = t;
		//}
		//}

		//public function addLife(h:Number):void {
		//health = (health + h > maxHealth) ? maxHealth : (health + h);
		//var w:int = health / maxHealth * 50;
		//if (w > 0){
		//lifeBar.createGraphic(w, 4, 0xfff29a7d);
		//lifeBar.fill(0xfff29a7d);
		//} else {
		//lifeBar.fill(0);
		//}
		//}

		//public function changeBullet(t:int):void {
		//switch (t){
		//case 0:
		//bullets = PlayState._bullets.members;
		//shootInterval = 0.5;
		//shotSpeed = 250;
		//break;
		//case 1:
		//bullets = PlayState._bulletsSmall.members;
		//shootInterval = 0.1;
		//shotSpeed = 400;
		//break;
		//}
		//}

		protected function restartClock():void {
			shotClock = shootInterval;
		}

		//protected function shootPlain():void {
		//var b:Bullet = bullets[Bullet.bulletIndex];
		//b.owner = this;
		//b.damage = damage;
		//b.reset(x + (width - b.width) / 2, y + (height - b.height) / 2);
		//b.angle = battery.angle; //FlxU.getAngle(FlxG.mouse.x - x, FlxG.mouse.x - y);
		//b.velocity = FlxU.rotatePoint(shotSpeed, 0, 0, 0, battery.angle);
		//b.angle = battery.angle;
		//b.velocity.x += velocity.x;
		//b.velocity.y += velocity.y;
		//Bullet.bulletIndex++;
		//if (Bullet.bulletIndex >= bullets.length)
		//Bullet.bulletIndex = 0;
		//}
		protected function shoot0():void {
			var b:Bullet = bullets[Bullet.bulletIndex];
			var shootAngle:Number = FlxU.getAngle((FlxG.mouse.x + FlxG.mouse.cursor.width / 2) - (x + width / 2), (FlxG.mouse.y + FlxG.mouse.cursor.height / 2) - (y + height / 2));
			b.reset(x + (width - b.width) / 2, y + (height - b.height) / 2);
			b.angle = shootAngle;
			b.velocity = FlxU.rotatePoint(shotSpeed, 0, 0, 0, shootAngle);
			b.velocity.x += velocity.x;
			b.velocity.y += velocity.y;
			Bullet.bulletIndex++;
			if (Bullet.bulletIndex >= bullets.length)
				Bullet.bulletIndex = 0;
		}

		protected function shoot1():void {
			var b:Bullet = bullets[Bullet.bulletIndex];
			var dist:FlxPoint;
			//b.owner = this;
			//b.damage = damage;
			var shootAngle:Number = FlxU.getAngle((FlxG.mouse.x + FlxG.mouse.cursor.width / 2) - (x + width / 2), (FlxG.mouse.y + FlxG.mouse.cursor.height / 2) - (y + height / 2));
			b.reset(x + (width - b.width) / 2, y + (height - b.height) / 2);
			dist = FlxU.rotatePoint(width / 2, height / 2, 0, 0, shootAngle);
			b.x += dist.x;
			b.y += dist.y;
			b.angle = shootAngle;
			b.velocity = FlxU.rotatePoint(shotSpeed, 0, 0, 0, shootAngle);
			b.velocity.x += velocity.x;
			b.velocity.y += velocity.y;
			Bullet.bulletIndex++;
			if (Bullet.bulletIndex >= bullets.length)
				Bullet.bulletIndex = 0;

			b = bullets[Bullet.bulletIndex];
			b.reset(x + (width - b.width) / 2, y + (height - b.height) / 2);
			//b.owner = this;
			//b.damage = damage;
			dist = FlxU.rotatePoint(width / 2, -height / 2, 0, 0, shootAngle);
			b.x += dist.x;
			b.y += dist.y;
			b.angle = shootAngle;
			b.velocity = FlxU.rotatePoint(shotSpeed, 0, 0, 0, shootAngle);
			b.velocity.x += velocity.x;
			b.velocity.y += velocity.y;
			Bullet.bulletIndex++;
			if (Bullet.bulletIndex >= bullets.length)
				Bullet.bulletIndex = 0;

		}

		protected function shoot2():void {
			shoot1();
			var b:Bullet = bullets[Bullet.bulletIndex];
			var shootAngle:Number = FlxU.getAngle((FlxG.mouse.x + FlxG.mouse.cursor.width / 2) - (x + width / 2), (FlxG.mouse.y + FlxG.mouse.cursor.height / 2) - (y + height / 2));
			b.reset(x + (width - b.width) / 2, y + (height - b.height) / 2);
			var dist:FlxPoint = FlxU.rotatePoint(width, 0, 0, 0, shootAngle);
			b.x += dist.x;
			b.y += dist.y;
			b.angle = shootAngle;
			b.velocity = FlxU.rotatePoint(shotSpeed, 0, 0, 0, shootAngle);
			b.velocity.x += velocity.x;
			b.velocity.y += velocity.y;
			Bullet.bulletIndex++;
			if (Bullet.bulletIndex >= bullets.length)
				Bullet.bulletIndex = 0;
		}

		protected function shoot3():void {
			shoot0();
			shoot2();
		}

		protected function shoot4():void {
			shoot2();
			var b:Bullet = bullets[Bullet.bulletIndex];
			var dist:FlxPoint;
			var shootAngle:Number = FlxU.getAngle((FlxG.mouse.x + FlxG.mouse.cursor.width / 2) - (x + width / 2), (FlxG.mouse.y + FlxG.mouse.cursor.height / 2) - (y + height / 2));
			b.reset(x + (width - b.width) / 2, y + (height - b.height) / 2);
			dist = FlxU.rotatePoint(-width / 2, height, 0, 0, shootAngle);
			b.x += dist.x;
			b.y += dist.y;
			b.angle = shootAngle;
			b.velocity = FlxU.rotatePoint(shotSpeed, 0, 0, 0, shootAngle);
			b.velocity.x += velocity.x;
			b.velocity.y += velocity.y;
			Bullet.bulletIndex++;
			if (Bullet.bulletIndex >= bullets.length)
				Bullet.bulletIndex = 0;

			b = bullets[Bullet.bulletIndex];
			b.reset(x + (width - b.width) / 2, y + (height - b.height) / 2);
			dist = FlxU.rotatePoint(-width / 2, -height, 0, 0, shootAngle);
			b.x += dist.x;
			b.y += dist.y;
			b.angle = shootAngle;
			b.velocity = FlxU.rotatePoint(shotSpeed, 0, 0, 0, shootAngle);
			b.velocity.x += velocity.x;
			b.velocity.y += velocity.y;
			Bullet.bulletIndex++;
			if (Bullet.bulletIndex >= bullets.length)
				Bullet.bulletIndex = 0;
		}

		protected function shoot5():void {
			shoot0();
			shoot4();
		}

		protected function explode():void {
			if (bombs > 0){
				FlxG.play(SndBomb);
				FlxG.quake.start();
				FlxG.flash.start();
				var enyList:Array = (FlxG.state as PlayState)._enemies.members;
				for each (var eny:Enemy in enyList){
					if (eny.exists && eny.solid){
						if (eny is EnemyBoss){
							eny.hurt(30);
						} else {
							eny.kill();
						}
					}
				}
				bombs--;
				(FlxG.state as PlayState).bombs[bombs].visible = false;
			}
		}

		//protected function shootThree():void {
		//var b:Bullet = bullets[Bullet.bulletIndex];
		//b.owner = this;
		//b.damage = damage;
		//b.reset(x + (width - b.width) / 2, y + (height - b.height) / 2);
		//b.velocity = FlxU.rotatePoint(shotSpeed, 0, 0, 0, battery.angle);
		//b.angle = battery.angle;
		//Bullet.bulletIndex++;
		//if (Bullet.bulletIndex >= bullets.length)
		//Bullet.bulletIndex = 0;
//
		//b = bullets[Bullet.bulletIndex];
		//b.owner = this;
		//b.damage = damage;
		//b.reset(x + (width - b.width) / 2, y + (height - b.height) / 2);
		//b.velocity = FlxU.rotatePoint(shotSpeed, 0, 0, 0, battery.angle - 45);
		//b.angle = battery.angle - 45;
		//Bullet.bulletIndex++;
		//if (Bullet.bulletIndex >= bullets.length)
		//Bullet.bulletIndex = 0;
//
		//b = bullets[Bullet.bulletIndex];
		//b.owner = this;
		//b.damage = damage;
		//b.reset(x + (width - b.width) / 2, y + (height - b.height) / 2);
		//b.velocity = FlxU.rotatePoint(shotSpeed, 0, 0, 0, battery.angle + 45);
		//b.angle = battery.angle + 45;
		//Bullet.bulletIndex++;
		//if (Bullet.bulletIndex >= bullets.length)
		//Bullet.bulletIndex = 0;
		//}

		//protected function shootFour():void {
		//var b:Bullet = bullets[Bullet.bulletIndex];
		//b.owner = this;
		//b.damage = damage;
		//b.reset(x + (width - b.width) / 2, y + (height - b.height) / 2);
		//b.velocity = FlxU.rotatePoint(shotSpeed, 0, 0, 0, battery.angle);
		//b.angle = battery.angle;
		//Bullet.bulletIndex++;
		//if (Bullet.bulletIndex >= bullets.length)
		//Bullet.bulletIndex = 0;
//
		//b = bullets[Bullet.bulletIndex];
		//b.owner = this;
		//b.damage = damage;
		//b.reset(x + (width - b.width) / 2, y + (height - b.height) / 2);
		//b.velocity = FlxU.rotatePoint(shotSpeed, 0, 0, 0, battery.angle - 90);
		//b.angle = battery.angle - 90;
		//Bullet.bulletIndex++;
		//if (Bullet.bulletIndex >= bullets.length)
		//Bullet.bulletIndex = 0;
//
		//b = bullets[Bullet.bulletIndex];
		//b.owner = this;
		//b.damage = damage;
		//b.reset(x + (width - b.width) / 2, y + (height - b.height) / 2);
		//b.velocity = FlxU.rotatePoint(shotSpeed, 0, 0, 0, battery.angle + 90);
		//b.angle = battery.angle + 90;
		//Bullet.bulletIndex++;
		//if (Bullet.bulletIndex >= bullets.length)
		//Bullet.bulletIndex = 0;
//
		//b = bullets[Bullet.bulletIndex];
		//b.owner = this;
		//b.damage = damage;
		//b.reset(x + (width - b.width) / 2, y + (height - b.height) / 2);
		//b.velocity = FlxU.rotatePoint(shotSpeed, 0, 0, 0, battery.angle + 180);
		//b.angle = battery.angle + 180;
		//Bullet.bulletIndex++;
		//if (Bullet.bulletIndex >= bullets.length)
		//Bullet.bulletIndex = 0;
		//}

		//private function explode():void {
		//var e:Explosion = explosions[Explosion.explosionIndex];
		//e.reset(x, y);
		//e.play("explode");
		//Explosion.explosionIndex++;
		//if (Explosion.explosionIndex >= explosions.length)
		//Explosion.explosionIndex = 0;
		//}
	}
}