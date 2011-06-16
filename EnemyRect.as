package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class EnemyRect extends Enemy {
		[Embed(source="res/rect.png")]
		private var ImgEnemy:Class;

		public function EnemyRect(){
			super(ImgEnemy);
		}

		override protected function start():void {
			color = 0x00ff00;
			velocity.x = -150 + 300 * FlxU.random();
			velocity.y = Math.sqrt(150 * 150 - velocity.x * velocity.x);
			velocity.y = (FlxU.random() < 0.5) ? -velocity.y : velocity.y;
			angularVelocity = (FlxU.random() < 0.5) ? -90 : 90;
			gibs = PlayState.gibsRect;
		}
		
		override public function hitLeft(Contact:FlxObject,Velocity:Number):void
		{
			velocity.x = -velocity.x;
		}
		
		override public function hitRight(Contact:FlxObject,Velocity:Number):void
		{
			velocity.x = -velocity.x;
		}
		
		override public function hitTop(Contact:FlxObject,Velocity:Number):void
		{
			velocity.y = -velocity.y;
		}
		
		override public function hitBottom(Contact:FlxObject,Velocity:Number):void
		{
			velocity.y = -velocity.y;
		}
		
	}
}