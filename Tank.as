package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class Tank extends FlxSprite {
		protected var type:int;
		protected var speed:Number;
		protected var direct:FlxPoint;
		protected var angle_dest:Number;
		protected var battery:Battery;
		protected var bullets:Array;
		protected var bullet_index:int;
		protected var shotClock:Number;
		protected var shotSpeed:Number;
		protected var shoot:Function;
		protected var lifeBar:FlxSprite;
		protected var maxHealth:Number;

		[Embed(source="res/tank_plain.png")]
		protected var ImgTankPlain:Class;
		[Embed(source="res/tank_double.png")]
		protected var ImgTankDouble:Class;

		public function Tank(){
			super(FlxG.width / 2 - 8, FlxG.height / 2 - 8);
			loadGraphic(ImgTankPlain, true);
			type = 0;
			maxHealth = 10;
			health = maxHealth;
			battery = PlayState._battery;
			bullets = PlayState._bullets.members;
			bullet_index = 0;
			lifeBar = PlayState._lifeBar;
			maxVelocity.x = 50;
			maxVelocity.y = 50;
			drag.x = maxVelocity.x * 4;
			drag.y = maxVelocity.y * 4;
			antialiasing = true;
			restartClock();
			shoot = shootPlain;
			shotSpeed = 250;

			addAnimation("stop", [0]);
			addAnimation("move", [0, 1], 12);

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

			if (FlxG.mouse.pressed() && shotClock < 0){
				restartClock();
				battery.play("idle");
				battery.play("shot");
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
			x = (x + width > 400) ? 400 - width : x;
			y = (y < 0) ? 0 : y;
			y = (y + height > 300) ? 300 - height : y;

			if (direct.x != 0 || direct.y != 0){
				angle_dest = (FlxU.getAngle(direct.x, direct.y) + 450) % 360;
				if (FlxU.abs(angle - angle_dest) < 5 || FlxU.abs(angle - angle_dest) > 355){
					angle = angle_dest;
				} else {
					if (angle_dest < 180){
						if (angle > angle_dest && angle - angle_dest < 180){
							angularVelocity -= 240;
						} else {
							angularVelocity += 240;
						}
					} else {
						if (angle_dest > angle && angle_dest - angle < 180){
							angularVelocity += 240;
						} else {
							angularVelocity -= 240;
						}
					}
				}
			}
			super.update();
			battery.reset(x, y);
		}

		override public function hurt(Damage:Number):void {
			//FlxG.play(SndHit);
			super.hurt(Damage);
			flicker(0.2);
			battery.flicker(0.2);
			var w:int = health / maxHealth * 50;
			if (w > 0){
				lifeBar.createGraphic(w, 4, 0xfff29a7d)
			} else {
				lifeBar.fill(0);
			}
			//FlxG.score += 10;

		}

		override public function kill():void {
			if (dead)
				return;

			battery.kill();
			super.kill();
			flicker(-1);
		}

		public function setType(t:int):void {
			if (type != t){
				switch (t){
					case 1:
						loadGraphic(ImgTankPlain, true);
						shoot = shootPlain;
						break;
					case 2:
						loadGraphic(ImgTankDouble, true);

						shoot = shootDouble;
						break;
				}
				type = t;
				battery.setType(type);
			}
		}

		protected function restartClock():void {
			shotClock = 0.3;
		}

		protected function shootPlain():void {

			var b:FlxSprite = bullets[bullet_index];
			b.reset(x + (width - b.width) / 2, y + (height - b.height) / 2);
			//b.angle = battery.angle; //FlxU.getAngle(FlxG.mouse.x - x, FlxG.mouse.x - y);
			b.velocity = FlxU.rotatePoint(shotSpeed, 0, 0, 0, battery.angle);
			//b.velocity.x += velocity.x;
			//b.velocity.y += velocity.y;
			bullet_index++;
			if (bullet_index >= bullets.length)
				bullet_index = 0;

		}

		protected function shootDouble():void {
			var b:FlxSprite = bullets[bullet_index];
			var dist:FlxPoint = FlxU.rotatePoint(0, 5, 0, 0, b.angle);
			//b = bullets[bullet_index];
			b.reset(x + (width - b.width) / 2, y + (height - b.height) / 2);
			//b.angle = battery.angle;
			dist = FlxU.rotatePoint(0, height / 4, 0, 0, battery.angle);
			b.x -= dist.x;
			b.y -= dist.y;
			b.velocity = FlxU.rotatePoint(shotSpeed, 0, 0, 0, battery.angle);
			bullet_index++;
			if (bullet_index >= bullets.length)
				bullet_index = 0;
			b = bullets[bullet_index];
			b.reset(x + (width - b.width) / 2, y + (height - b.height) / 2);
			//b.angle = battery.angle;
			dist = FlxU.rotatePoint(0, -height / 4, 0, 0, battery.angle);
			b.x -= dist.x;
			b.y -= dist.y;
			b.velocity = FlxU.rotatePoint(shotSpeed, 0, 0, 0, battery.angle);
			bullet_index++;
			if (bullet_index >= bullets.length)
				bullet_index = 0;
		}
	}
}