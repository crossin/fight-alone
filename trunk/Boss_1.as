package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class Boss_1 extends FlxGroup {
		[Embed(source="res/boss_1.png")]
		private var ImgBase:Class;

		public var base:FlxSprite;

		private var _tank:Tank;
		private var _timer:Number;
		private var _angleDest:Number;
		private var intervalCheck:Number;
		private var angleRange:Number;
		private var unitVelocity:Number;
		private var unitVelocityAngle:Number;

		public function Boss_1(){
			super();

			_tank = (FlxG.state as PlayState)._tank;
			
			_timer = 0;
			_angleDest = 0;
			angleRange = 0;
			intervalCheck = 1;
			unitVelocity = 20;
			unitVelocityAngle = 100;
			
			base = new FlxSprite(200,200);
			base.loadGraphic(ImgBase, true);
			base.addAnimation("idle", [0]);
			base.addAnimation("move", [0, 1], 12);
			add(base);
			
		}

		override public function update():void {
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
			super.update();
		}
	}

}