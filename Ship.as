package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class Ship extends FlxSprite {
		protected var type:int;
		protected var speed:Number;
		protected var direct:FlxPoint;
		protected var angle_dest:Number;
		//protected var battery:Battery;
		protected var bullets:Array;
		private var explosions:Array;
		//protected var bullet_index:int;
		protected var shotClock:Number;
		protected var shotSpeed:Number;
		protected var shoot:Function;
		protected var lifeBar:FlxSprite;
		protected var maxHealth:Number;
		//protected var _shadow:FlxSprite;
		//protected var damage:int;
		protected var defence:int;
		protected var shootInterval:Number;

		[Embed(source="res/ship.png")]
		protected var ImgTankPlain:Class;
		[Embed(source="res/tank_double.png")]
		protected var ImgTankDouble:Class;
		[Embed(source="res/tank_small.png")]
		protected var ImgTankSmall:Class;
		[Embed(source="res/tank_big.png")]
		protected var ImgTankBig:Class;
		//[Embed(source="res/tank_shadow.png")]
		//protected var ImgTankShadow:Class;
		//[Embed(source="res/tank_shadow_small.png")]
		//protected var ImgTankShadowSmall:Class;
		//[Embed(source="res/tank_shadow_big.png")]
		//protected var ImgTankShadowBig:Class;
		[Embed(source = "res/sound/shoot.mp3")]
		private var SndShoot:Class;
		
		public function Ship(startX:int, startY:int){
			super(startX, startY);
			loadGraphic(ImgTankPlain, true);
			type = 0;
			maxHealth = 50;
			health = maxHealth;
			//battery = PlayState._battery;
			bullets = PlayState._bullets.members;
			explosions = PlayState._explosions.members;
			//bulletIndex = (FlxG.state as PlayState)._bulletIndex;
			//_explosionIndex = (FlxG.state as PlayState)._explosionIndex; = 0;
			lifeBar = PlayState._lifeBar;
			maxVelocity.x = 170;
			maxVelocity.y = 170;
			drag.x = 500;
			drag.y = 500;
			antialiasing = true;
			shootInterval = 0.15;
			restartClock();
			shoot = shoot2;
			shotSpeed = 400;
			//damage = 10;
			defence = 0.3;

			addAnimation("stop", [0]);
			addAnimation("move", [0, 1], 12);

			//_shadow = new FlxSprite(x + 1, y + 1, ImgTankShadow);
		}

		override public function update():void {
			acceleration.x = 0;
			acceleration.y = 0;
			angularVelocity = 0;
			angle = (angle + 360) % 360;
			direct = new FlxPoint();
			shotClock -= FlxG.elapsed;


			if (FlxG.keys.LEFT || FlxG.keys.A){
				acceleration.x -= drag.x;
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
				acceleration.x += drag.x;
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
				acceleration.y -= drag.y;
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
				acceleration.y += drag.y;
				//if (angle >= 0 && angle < 175){
				//angularVelocity += 240;
				//} else if (angle > 185 && angle < 360){
				//angularVelocity -= 240;
				//} else {
				//angle = 180;
				//}
				direct.y = 1;
			}

			//if (FlxG.mouse.pressed() && shotClock < 0){
			if (shotClock < 0){
				restartClock();
				//battery.play("idle");
				//battery.play("shot");
				//FlxG.play(SndShoot);
				shoot();
			}
			speed = Math.sqrt(velocity.x * velocity.x + velocity.y * velocity.y)
			if (speed > maxVelocity.x){
				velocity.x *= (maxVelocity.x / speed);
				velocity.y *= (maxVelocity.y / speed);
			}

			if (velocity.x != 0 || velocity.y != 0){
				play("move");
			} else {
				play("stop");
			}

			x = (x < 0) ? 0 : x;
			x = (x + width > PlayState.maxWidth) ? PlayState.maxWidth - width : x;
			y = (y < 0) ? 0 : y;
			y = (y + height > PlayState.maxHeight) ? PlayState.maxHeight - height : y;

			if (direct.x != 0 || direct.y != 0){
				angle_dest = (FlxU.getAngle(direct.x, direct.y) + 450) % 360;
				if (FlxU.abs(angle - angle_dest) < 5 || FlxU.abs(angle - angle_dest) > 355){
					angle = angle_dest;
				} else {
					if (angle_dest < 180){
						if (angle > angle_dest && angle - angle_dest < 180){
							angularVelocity -= 500;
						} else {
							angularVelocity += 500;
						}
					} else {
						if (angle_dest > angle && angle_dest - angle < 180){
							angularVelocity += 500;
						} else {
							angularVelocity -= 500;
						}
					}
				}
			}
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
			//FlxG.play(SndHit);
			//if (Damage >= defence){
			super.hurt(Damage * (1 - defence));
			var w:int = health / maxHealth * 50;
			if (w > 0){
				lifeBar.createGraphic(w, 4, 0xfff29a7d);
				lifeBar.fill(0xfff29a7d);
			} else {
				lifeBar.fill(0);
			}
			//}
			flicker(0.2);
			//battery.flicker(0.2);

			//FlxG.score += 10;

		}

		override public function kill():void {
			if (dead)
				return;

			//battery.kill();
			//_shadow.kill();
			super.kill();
			flicker(-1);
			explode();
		}

		public function setType(t:int):void {
			if (type != t){
				switch (t){
					case 1:
						//loadGraphic(ImgTankPlain, true);
						//battery.setType(1);
						shoot = shootPlain;
						break;
					case 2:
						//loadGraphic(ImgTankDouble, true);
						//battery.setType(2);
						//shoot = shootDouble;
						break;
					case 3:
						//battery.setType(3);
						shoot = shootThree;
						break;
					case 4:
						//battery.setType(4);
						shoot = shootFour;
						break;
					case 5:
						loadGraphic(ImgTankSmall, true);
						//_shadow.loadGraphic(ImgTankShadowSmall, true);
						defence = 0.2;
						maxVelocity.x = 70;
						maxVelocity.y = 70;
						break;
					case 6:
						loadGraphic(ImgTankBig, true);
						//_shadow.loadGraphic(ImgTankShadowBig, true);
						defence = 0.5;
						maxVelocity.x = 30;
						maxVelocity.y = 30;
						break;
				}
				type = t;
			}
		}

		public function addLife(h:Number):void {
			health = (health + h > maxHealth) ? maxHealth : (health + h);
			var w:int = health / maxHealth * 50;
			if (w > 0){
				lifeBar.createGraphic(w, 4, 0xfff29a7d);
				lifeBar.fill(0xfff29a7d);
			} else {
				lifeBar.fill(0);
			}
		}

		public function changeBullet(t:int):void {
			switch (t){
				case 0:
					bullets = PlayState._bullets.members;
					shootInterval = 0.5;
					shotSpeed = 250;
					break;
				case 1:
					bullets = PlayState._bulletsSmall.members;
					shootInterval = 0.1;
					shotSpeed = 400;
					break;
			}
		}

		protected function restartClock():void {
			shotClock = shootInterval;
		}

		protected function shootPlain():void {
			var b:Bullet = bullets[Bullet.bulletIndex];
			b.owner = this;
			//b.damage = damage;
			b.reset(x + (width - b.width) / 2, y + (height - b.height) / 2);
			//b.angle = battery.angle; //FlxU.getAngle(FlxG.mouse.x - x, FlxG.mouse.x - y);
			//b.velocity = FlxU.rotatePoint(shotSpeed, 0, 0, 0, battery.angle);
			//b.angle = battery.angle;
			//b.velocity.x += velocity.x;
			//b.velocity.y += velocity.y;
			Bullet.bulletIndex++;
			if (Bullet.bulletIndex >= bullets.length)
				Bullet.bulletIndex = 0;
		}

		protected function shoot2():void {
			var b:Bullet = bullets[Bullet.bulletIndex];
			var dist:FlxPoint = FlxU.rotatePoint(0, 5, 0, 0, b.angle);
			//b.owner = this;
			//b.damage = damage;
			var shootAngle:Number = FlxU.getAngle((FlxG.mouse.x + FlxG.mouse.cursor.width / 2) - (x + width / 2), (FlxG.mouse.y + FlxG.mouse.cursor.height / 2) - (y + height / 2));
			b.reset(x + (width - b.width) / 2, y + (height - b.height) / 2);
			dist = FlxU.rotatePoint(0, height / 4, 0, 0, shootAngle);
			b.x -= dist.x;
			b.y -= dist.y;
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
			dist = FlxU.rotatePoint(0, -height / 4, 0, 0, shootAngle);
			b.x -= dist.x;
			b.y -= dist.y;
			b.angle = shootAngle;
			b.velocity = FlxU.rotatePoint(shotSpeed, 0, 0, 0, shootAngle);
			b.velocity.x += velocity.x;
			b.velocity.y += velocity.y;
			Bullet.bulletIndex++;
			if (Bullet.bulletIndex >= bullets.length)
				Bullet.bulletIndex = 0;

		}

		protected function shootThree():void {
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
		}

		protected function shootFour():void {
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
		}

		private function explode():void {
			var e:Explosion = explosions[Explosion.explosionIndex];
			e.reset(x, y);
			e.play("explode");
			Explosion.explosionIndex++;
			if (Explosion.explosionIndex >= explosions.length)
				Explosion.explosionIndex = 0;
		}

		public function flash():void {

		}
	}
}