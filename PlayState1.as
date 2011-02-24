package {
	import org.flixel.*;

	public class PlayState1 extends PlayState {
		[Embed(source="res/back_mud.png")]
		private var ImgBack:Class;

		//public var _explosionIndex:uint;

		override public function create():void {
			super.create();
			index = 1;
		}

		override protected function addEnemy():void {
			if ((enemyCount < 20) && (_timer % _timerInterval < _timerLast % _timerInterval)){
				_enemies.add(new EnemyFast(int(FlxU.random() * 4), 5));
				enemyCount++;
			}
			// add boss
			if (_timerLast < 1 && _timer > 1){
				_boss.reset(FlxG.width / 2, -40);
			}
		}
		
		override protected function makeScene():void {
			back.loadGraphic(ImgBack);
			
			var block:Block;
			block = new BlockBrick(100, 100);
			blocks.add(block);
			block = new BlockSteel(100, 118);
			blocks.add(block);
			block = new BlockBarrier(118, 100);
			blocks.add(block);
			block = new BlockBox(118, 118);
			blocks.add(block);
		}
	}
}