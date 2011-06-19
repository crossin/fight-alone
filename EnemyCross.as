package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class EnemyCross extends Enemy {
		[Embed(source="res/cross.png")]
		private var ImgEnemy:Class;

		public function EnemyCross(){
			super(ImgEnemy);
			gibs = PlayState.gibsCross;
			score = 50;
			health = 30;
		}

		override protected function start():void {
			color = 0xea1a1a;
			velocity.x = -50 + 100 * FlxU.random();
			velocity.y = Math.sqrt(50 * 50 - velocity.x * velocity.x);
			velocity.y = (FlxU.random() < 0.5) ? -velocity.y : velocity.y;
			angularVelocity = (FlxU.random() < 0.5) ? -45 : 45;
		}
		
		override public function hurt(Damage:Number):void {
			super.hurt(Damage);
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