package {
	import flash.geom.Point;
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class EnemyShuttle extends Enemy {
		[Embed(source="res/shuttle.png")]
		private var ImgEnemy:Class;

		private var _timer:Number;

		public function EnemyShuttle(){
			super(ImgEnemy);
			gibs = PlayState.gibsShuttle;
			score = 50;
			_timer = 0;// 2 + 4 * FlxU.random();
		}

		override protected function start():void {
			color = 0x1dcbea;
			//var moveAngle:Number = FlxU.getAngle(ship.x - x, ship.y - y);
			//velocity = FlxU.rotatePoint(200, 0, 0, 0, moveAngle);
			//thrust = 100;
			angularVelocity = (FlxU.random() < 0.5) ? -90 : 90;
		}

		override public function update():void {
			if (color != 0xffffff){
				//var moveAngle:Number = FlxU.getAngle(ship.x - x, ship.y - y);
				_timer -= FlxG.elapsed;
				velocity = FlxU.rotatePoint(100, 0, 0, 0, angle);
			}
			if (_timer < 0){
				angularVelocity = -angularVelocity;
				_timer = 2 + 4 * FlxU.random();
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