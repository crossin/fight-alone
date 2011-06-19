package {
	import flash.geom.Point;
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class EnemyDart extends Enemy {
		[Embed(source="res/dart.png")]
		private var ImgEnemy:Class;

		private var ship:Ship;

		public function EnemyDart(pos:int){
			var ix:int;
			var iy:int;
			switch (pos){
				case 0:
					ix = 50;
					iy = 50;
					break;
				case 1:
					ix = 1125;
					iy = 50;
					break;
				case 2:
					ix = 1125;
					iy = 825;
					break;
				case 3:
					ix = 50;
					iy = 825;
					break;
			}
			super(ImgEnemy, ix, iy);
			gibs = PlayState.gibsDart;
			score = 50;
			ship = (FlxG.state as PlayState).ship;

		}

		override protected function start():void {
			color = 0x9b1dea;
			angularVelocity = (FlxU.random() < 0.5) ? -180 : 180;
		}


		override public function update():void {
			if (color != 0xffffff){
				var moveAngle:Number = FlxU.getAngle(ship.x - x, ship.y - y);
				velocity = FlxU.rotatePoint(100, 0, 0, 0, moveAngle);
			}
			super.update();
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