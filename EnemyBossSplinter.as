package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class EnemyBossSplinter extends EnemyBoss {
		[Embed(source="res/splinter.png")]
		private var ImgEnemy:Class;

		//private var ship:Ship;
		//private var _timer:Number;
		private var level:int;

		public function EnemyBossSplinter(lvl:int = 0, ix:int = 0, iy:int = 0){
			super(ImgEnemy, ix, iy);
			level = lvl;
			gibs = PlayState.gibsSplinter;
			score = 5;
			health = 15 - level * 2;
			scale.x = 1 - level * 0.1;
			scale.y = scale.x;
			alpha = (level > 0) ? 0.96 : 0;
			angle = FlxU.random() * 360;
			
			if (level == 0) {
				PlayState.lifeBoss.start(127, 2);
			}
			//_timer = 0;
			//ship = (FlxG.state as PlayState).ship;

		}

		override protected function start():void {
			color = 0xbaff00;
			var vtemp:int = 40 + level * 10;
			velocity.x = -vtemp + 2 * vtemp * FlxU.random();
			velocity.y = Math.sqrt(vtemp * vtemp - velocity.x * velocity.x);
			velocity.y = (FlxU.random() < 0.5) ? -velocity.y : velocity.y;
			angularVelocity = (FlxU.random() < 0.5) ? -vtemp : vtemp;
		}

		//override public function update():void {
		//if (color != 0xffffff){
		//_timer -= FlxG.elapsed;
		//}
		//if (_timer < 0){
		//if (velocity.x == 0 && velocity.y == 0){
		//var moveAngle:Number = FlxU.getAngle(ship.x - x, ship.y - y) - 90 + 180 * FlxU.random();
		//velocity = FlxU.rotatePoint(200, 0, 0, 0, moveAngle);
		//} else {
		//velocity.x = 0;
		//velocity.y = 0;
		//}
		//_timer = 0.3 + 0.4 * FlxU.random();
		//}
		//super.update();
		//}
		override public function kill():void {
			super.kill();
			if (level < 6){
				var offset:int = FlxU.random() * 20;
				(FlxG.state as PlayState)._enemies.add(new EnemyBossSplinter(level + 1, x + offset, y + 20 - offset));
				(FlxG.state as PlayState)._enemies.add(new EnemyBossSplinter(level + 1, x - offset, y - 20 + offset));
			}
			PlayState.lifeBoss.decrease(1);
		}


		override public function hitLeft(Contact:FlxObject, Velocity:Number):void {
			velocity.x = -velocity.x;
		}

		override public function hitRight(Contact:FlxObject, Velocity:Number):void {
			velocity.x = -velocity.x;
		}

		override public function hitTop(Contact:FlxObject, Velocity:Number):void {
			velocity.y = -velocity.y;
		}

		override public function hitBottom(Contact:FlxObject, Velocity:Number):void {
			velocity.y = -velocity.y;
		}

	}
}