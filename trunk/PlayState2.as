package {
	import org.flixel.*;

	public class PlayState2 extends PlayState {
		[Embed(source="res/back_sand.png")]
		private var ImgBack:Class;

		//public var _explosionIndex:uint;

		override public function create():void {
			super.create();
			
		}

		override protected function addEnemy():void {
			if ((enemyCount < 10) && (_timer % _timerInterval < _timerLast % _timerInterval)){
				_enemies.add(new EnemyPlain(int(FlxU.random() * 4), 10));
				enemyCount++;
			}
		}
		
		override protected function makeScene():void {
			back.loadGraphic(ImgBack);
			
			var box:Box;
			box = new Box(100, 100);
			boxes.add(box);
			box = new Box(100, 110);
			boxes.add(box);
			box = new Box(110, 100);
			boxes.add(box);
			box = new Box(110, 110);
			boxes.add(box);
		}
	}
}