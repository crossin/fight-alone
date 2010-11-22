package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class Tank extends FlxSprite {
		private var speed:Number;
		private var direct:FlxPoint;
		private var angle_dest:Number;
		private var battery:Battery;
		private var bullets:Array;
		private var bullet_index:int;

		[Embed(source="tank.png")]
		private var ImgTank:Class;

		public function Tank(bty:Battery, blts:Array){
			super(FlxG.width / 2 - 8, FlxG.height / 2 - 8, ImgTank);
			battery = bty;
			bullets = blts;
			bullet_index = 0;
			maxVelocity.x = 100;
			maxVelocity.y = 100;
			drag.x = maxVelocity.x * 4;
			drag.y = maxVelocity.y * 4;
			antialiasing = true;
		}

		override public function update():void {
			battery.reset(x, y);
			acceleration.x = 0;
			acceleration.y = 0;
			angularVelocity = 0;
			angle = (angle + 360) % 360;
			direct = new FlxPoint();
			if (FlxG.keys.LEFT){
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
			if (FlxG.keys.RIGHT){
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
			if (FlxG.keys.UP){
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
			if (FlxG.keys.DOWN){
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
			speed = Math.sqrt(velocity.x * velocity.x + velocity.y * velocity.y)
			if (speed > maxVelocity.x){
				velocity.x *= (maxVelocity.x / speed);
				velocity.y *= (maxVelocity.y / speed);
			}


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

			if (FlxG.mouse.justPressed()){
				var b:FlxSprite = bullets[bullet_index];
				b.reset(x + (width - b.width) / 2, y + (height - b.height) / 2);
				b.angle = battery.angle; //FlxU.getAngle(FlxG.mouse.x - x, FlxG.mouse.x - y);
				b.velocity = FlxU.rotatePoint(150, 0, 0, 0, b.angle);
				//b.velocity.x += velocity.x;
				//b.velocity.y += velocity.y;
				bullet_index++;
				if (bullet_index >= bullets.length)
					bullet_index = 0;
			}
		}
	}

}