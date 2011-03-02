package {
	import org.flixel.*;

	public class PlayState2 extends PlayState {
		[Embed(source="res/back_sand.png")]
		private var ImgBack:Class;

		//public var _explosionIndex:uint;

		override public function create():void {
			super.create();
			index = 2;
		}

		override protected function addEnemy():void {
			if ((enemyCount < 10) && (_timer % _timerInterval < _timerLast % _timerInterval)){
				_enemies.add(new EnemyShootFast(int(FlxU.random() * 4), 10));
				enemyCount++;
			}
		}
		
		override protected function makeScene():void {
			back.loadGraphic(ImgBack);
			
			var block:Block;
			block = new BlockBox(100, 100);
			blocks.add(block);
			block = new BlockBox(100, 110);
			blocks.add(block);
			block = new BlockBox(110, 100);
			blocks.add(block);
			block = new BlockBox(110, 110);
			blocks.add(block);
		}
	}
}