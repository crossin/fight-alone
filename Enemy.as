package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class Enemy extends FlxSprite {
		[Embed(source="res/rect.png")]
		private var ImgEnemy:Class;
		[Embed(source="res/sound/explode.mp3")]
		private var SndExplode:Class;


		protected var score:uint;
		protected var gibs:FlxEmitter;

		//private var _bulletIndex:uint;
		//private var _explosionIndex:uint;


		public function Enemy(img:Class, ix:Number = 0, iy:Number = 0){
			if (ix == 0 && iy == 0){
				ix = 50 + 1050 * FlxU.random();
				iy = 50 + 750 * FlxU.random();
			}
			super(ix, iy, img);
			solid = false;
			alpha = 0;
			//gibs = PlayState.gibsRect;
			//score = 100;
			antialiasing = true;
		}

		override public function update():void {
			//_timer += FlxG.elapsed;
			if (!solid){
				alpha += 0.02;
				if (alpha >= 1){
					solid = true;
					start();
				}
			}
			super.update();
		}

		protected function start():void {
			// to be override
		}

		override public function kill():void {
			super.kill();
			FlxG.play(SndExplode, 0.5);
			gibs.at(this);
			gibs.start(true, 0.5, 20);
			EndState.score += score;
			EndState.kills ++;
		}
	}
}