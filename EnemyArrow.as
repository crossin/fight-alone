package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class EnemyArrow extends Enemy {
		[Embed(source="res/arrow.png")]
		private var ImgEnemy:Class;

		public function EnemyArrow(){
			super(ImgEnemy);
			score = 40;
			var r:Number = FlxU.random();
			if (r < 0.25) {
				angle = 180;
			} else if (r < 0.5) {
				angle = 0;
			} else if (r < 0.75) {
				angle = 270;
			} else {
				angle = 90;
			}
		}

		override protected function start():void {
			color = 0x0000ff;
			//velocity.x = -150 + 300 * FlxU.random();
			//velocity.y = Math.sqrt(150 * 150 - velocity.x * velocity.x);
			switch (angle) {
				case 0:
					velocity.x = 150;
					break;
				case 90:
					velocity.y = 150;
					break;
				case 180:
					velocity.x = -150;
					break;
				case 270:
					velocity.y = -150;
					break;
			}

			//angularVelocity = (FlxU.random() < 0.5) ? -90 : 90;
			gibs = PlayState.gibsArrow;
		}
		
		override public function hitLeft(Contact:FlxObject,Velocity:Number):void
		{
			velocity.x = -velocity.x;
			angle = 0;
		}
		
		override public function hitRight(Contact:FlxObject,Velocity:Number):void
		{
			velocity.x = -velocity.x;
			angle = 180;
		}
		
		override public function hitTop(Contact:FlxObject,Velocity:Number):void
		{
			velocity.y = -velocity.y;
			angle = 90;
		}
		
		override public function hitBottom(Contact:FlxObject,Velocity:Number):void
		{
			velocity.y = -velocity.y;
			angle = 270;
		}
		
	}
}