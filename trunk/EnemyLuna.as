package {
	import flash.geom.Point;
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class EnemyLuna extends Enemy {
		[Embed(source="res/luna.png")]
		private var ImgEnemy:Class;

		private var ship:Ship;

		public function EnemyLuna(){
			super(ImgEnemy);
			gibs = PlayState.gibsLuna;
			score = 50;
			ship = (FlxG.state as PlayState).ship;
		}

		override protected function start():void {
			color = 0xf9e31c;
			var moveAngle:Number = FlxU.getAngle(ship.x - x, ship.y - y);
			velocity = FlxU.rotatePoint(200, 0, 0, 0, moveAngle);
			angularVelocity = (FlxU.random() < 0.5) ? -270 : 270;
		}

		override public function hitLeft(Contact:FlxObject, Velocity:Number):void {
			var moveAngle:Number = FlxU.getAngle(ship.x - x, ship.y - y);
			velocity = FlxU.rotatePoint(200, 0, 0, 0, moveAngle);
		}

		override public function hitRight(Contact:FlxObject, Velocity:Number):void {
			var moveAngle:Number = FlxU.getAngle(ship.x - x, ship.y - y);
			velocity = FlxU.rotatePoint(200, 0, 0, 0, moveAngle);
		}

		override public function hitTop(Contact:FlxObject, Velocity:Number):void {
			var moveAngle:Number = FlxU.getAngle(ship.x - x, ship.y - y);
			velocity = FlxU.rotatePoint(200, 0, 0, 0, moveAngle);
		}

		override public function hitBottom(Contact:FlxObject, Velocity:Number):void {
			var moveAngle:Number = FlxU.getAngle(ship.x - x, ship.y - y);
			velocity = FlxU.rotatePoint(200, 0, 0, 0, moveAngle);
		}

	}
}