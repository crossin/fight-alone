package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class EnemyCross extends Enemy {
		[Embed(source="res/cross.png")]
		private var ImgEnemy:Class;
		[Embed(source = "res/sound/hit.mp3")]
		private var SndHit:Class;

		private var scraps:Array;

		public function EnemyCross(){
			super(ImgEnemy);
			gibs = PlayState.gibsCross;
			score = 100;
			health = 30;
			scraps = (FlxG.state as PlayState)._scraps.members;
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
			FlxG.play(SndHit, 0.5);
		}

		override public function kill():void {
			super.kill();
			var s:Scrap;
			for (var i:int = 0; i < 18; i++){
				s = scraps[Scrap.scrapIndex];
				s.reset(x + (width - s.width) / 2, y + (height - s.height) / 2);
				s.velocity = FlxU.rotatePoint(100, 0, 0, 0, i * 20);
				Scrap.scrapIndex++;
				if (Scrap.scrapIndex >= scraps.length)
					Scrap.scrapIndex = 0;
			}
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