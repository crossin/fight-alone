package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class EnemyArrow extends Enemy {
		[Embed(source="res/arrow.png")]
		private var ImgEnemy:Class;

		public function EnemyArrow(pos:int, index:int) {
			var ix:int;
			var iy:int;
			switch (pos){
				case 0:
					ix = 60 + index * 50;
					iy = 50;
					break;
				case 1:
					ix = 1125;
					iy = 60 + index * 50;
					break;
				case 2:
					ix = 60 + index * 50;
					iy = 825;
					break;
				case 3:
					ix = 50;
					iy = 60 + index * 50;
					break;
			}
			super(ImgEnemy, ix, iy);
			switch (pos){
				case 0:
					angle = 90;
					break;
				case 1:
					angle = 180;
					break;
				case 2:
					angle = 270;
					break;
				case 3:
					angle = 0;
					break;
			}
			gibs = PlayState.gibsArrow;
			score = 5;
		}

		override protected function start():void {
			color = 0x1d35ea;
			//velocity.x = -150 + 300 * FlxU.random();
			//velocity.y = Math.sqrt(150 * 150 - velocity.x * velocity.x);
			switch (angle){
				case 0:
					velocity.x = 100;
					break;
				case 90:
					velocity.y = 100;
					break;
				case 180:
					velocity.x = -100;
					break;
				case 270:
					velocity.y = -100;
					break;
			}

			//angularVelocity = (FlxU.random() < 0.5) ? -90 : 90;
		}

		override public function hitLeft(Contact:FlxObject, Velocity:Number):void {
			velocity.x = -velocity.x;
			angle = 0;
		}

		override public function hitRight(Contact:FlxObject, Velocity:Number):void {
			velocity.x = -velocity.x;
			angle = 180;
		}

		override public function hitTop(Contact:FlxObject, Velocity:Number):void {
			velocity.y = -velocity.y;
			angle = 90;
		}

		override public function hitBottom(Contact:FlxObject, Velocity:Number):void {
			velocity.y = -velocity.y;
			angle = 270;
		}

	}
}