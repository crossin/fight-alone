package {
	import flash.geom.Point;
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class EnemyCircle extends Enemy {
		[Embed(source="res/circle.png")]
		private var ImgEnemy:Class;

		private var ship:Ship;
		private var _timer:Number;

		public function EnemyCircle(){
			super(ImgEnemy);
			gibs = PlayState.gibsCircle;
			score = 50;
			_timer = 0;
			ship = (FlxG.state as PlayState).ship;
		}

		override protected function start():void {
			color = 0xf38417;
		}

		override public function update():void {
			if (color != 0xffffff){
				_timer -= FlxG.elapsed;
			}
			if (_timer < 0){
				if (velocity.x == 0 && velocity.y == 0){
					var moveAngle:Number = FlxU.getAngle(ship.x - x, ship.y - y) - 90 + 180 * FlxU.random();
					velocity = FlxU.rotatePoint(200, 0, 0, 0, moveAngle);
				} else {
					velocity.x = 0;
					velocity.y = 0;
				}
				_timer = 0.3 + 0.4 * FlxU.random();
			}
			super.update();
		}

		//override public function hitLeft(Contact:FlxObject, Velocity:Number):void {
		//var moveAngle:Number = FlxU.getAngle(ship.x - x, ship.y - y);
		//velocity = FlxU.rotatePoint(200, 0, 0, 0, moveAngle);
		//}
//
		//override public function hitRight(Contact:FlxObject, Velocity:Number):void {
		//var moveAngle:Number = FlxU.getAngle(ship.x - x, ship.y - y);
		//velocity = FlxU.rotatePoint(200, 0, 0, 0, moveAngle);
		//}
//
		//override public function hitTop(Contact:FlxObject, Velocity:Number):void {
		//var moveAngle:Number = FlxU.getAngle(ship.x - x, ship.y - y);
		//velocity = FlxU.rotatePoint(200, 0, 0, 0, moveAngle);
		//}
//
		//override public function hitBottom(Contact:FlxObject, Velocity:Number):void {
		//var moveAngle:Number = FlxU.getAngle(ship.x - x, ship.y - y);
		//velocity = FlxU.rotatePoint(200, 0, 0, 0, moveAngle);
		//}

	}
}