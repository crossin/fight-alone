package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class Enemy extends FlxSprite {

		[Embed(source="enemy.png")]
		private var ImgEnemy:Class;


		protected var _gibs:FlxEmitter;
		protected var _timer:Number;
		protected var _tank:Tank;
		protected var _xDest:Number;
		protected var _yDest:Number;
		protected var _maxHealth:Number;
		protected var _lifeBar:FlxSprite;
		protected var _lifeBarBack:FlxSprite;


		public function Enemy(tank:Tank, gibs:FlxEmitter){
			super(100, 100);
			loadGraphic(ImgEnemy, true);
			//height = height - 1; //draw the crate 1 pixel into the floor
			//acceleration.y = 400;
			_tank = tank;
			_gibs = gibs;
			_timer = 0;
			_xDest = FlxG.width / 2;
			_yDest = FlxG.height / 2;
			_maxHealth = 20;

			drag.x = 200;
			drag.y = 200;
			health = _maxHealth;
			//maxAngular = 5;
			//angularDrag = 20;
			maxVelocity.x = 10;
			maxVelocity.y = 10;

			addAnimation("idle", [0]);
			addAnimation("move", [0, 1], 12);

			_lifeBar = new FlxSprite(x, y - 2);
			_lifeBarBack = new FlxSprite(x - 1, y - 3);
			_lifeBar.createGraphic(width, 1);
			_lifeBarBack.createGraphic(width + 2, 3);
			_lifeBar.fill(0xff00ff00);
			_lifeBarBack.fill(0xff000000);
		}

		override public function update():void {
			_timer += FlxG.elapsed;
			if (_timer > 1){
				_timer = 0;
				_xDest = _tank.x;
				_yDest = _tank.y;
			}
			var dx:Number = _xDest - x;
			var dy:Number = _yDest - y;
			var angle_dest:Number = FlxU.getAngle(dx, dy);
			angle_dest = (angle_dest + 360) % 360;
			angle = (angle + 360) % 360;


			//thrust = 0;
			//if (_timer > 1){
			//	_timer = 0;
			//} else if (_timer < 0.2){
			//	thrust = 40;
			//} else {
			//if (FlxU.abs(angle - angle_dest) < 1 || FlxU.abs(angle - angle_dest) > 359){
			//angle = angle_dest;
			//angularVelocity = 0;

			//} else {
			if (angle_dest < 180){
				if (angle > angle_dest && angle - angle_dest < 180){
					angularVelocity = -100;
				} else {
					angularVelocity = 100;
				}
			} else {
				if (angle_dest > angle && angle_dest - angle < 180){
					angularVelocity = 100;
				} else {
					angularVelocity = -100;
				}
			}
			//}

			acceleration = FlxU.rotatePoint(200, 0, 0, 0, angle_dest);
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

			_lifeBar.x = x;
			_lifeBar.y = y - 2;
			_lifeBarBack.x = x - 1;
			_lifeBarBack.y = y - 3;

			//var c:uint = 0xff00ff00 * (health / _maxHealth) + 0xffffff00 * (1 - health / _maxHealth)
			//_lifeBar.fill(c);
			//_lifeBar.visible = false;


			_lifeBar.update();
			_lifeBarBack.update();
			super.update();
		}

		override public function render():void {
			super.render();
			var mouseX:Number = FlxG.mouse.x + 4.5;
			var mouseY:Number = FlxG.mouse.y + 4.5;
			if ((mouseX > x && mouseX < x + width) && (mouseY > y && mouseY < y + height)){
				_lifeBarBack.render();
				_lifeBar.render();
			}
		}

		override public function hurt(Damage:Number):void {
			//FlxG.play(SndHit);
			flicker(0.2);
			var w:int = health / _maxHealth * width;
			w = w > 1 ? w : 1;
			_lifeBar.createGraphic(w, 1)
			var c:uint;
			if (health > _maxHealth * 0.75){
				c = 0xff00ff00 | uint(255 * 4 * (1 - health / _maxHealth)) << 16;
			} else {
				c = 0xffff0000 | uint(255 * 4 / 3 * health / _maxHealth) << 8;
			}
			_lifeBar.fill(c);
			//FlxG.score += 10;
			super.hurt(Damage);
		}

		override public function kill():void {
			if (dead)
				return;
			//FlxG.play(SndExplode);
			_lifeBar.kill();
			super.kill();
			flicker(-1);
			//FlxG.quake.start(0.005, 0.35);
			//FlxG.flash.start(0xffd8eba2, 0.35);
			//_jets.kill();
			_gibs.at(this);
			_gibs.start(true, 1, 8);
			//FlxG.score += 200;
		}
	}
}