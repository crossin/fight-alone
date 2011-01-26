package {
	import org.flixel.*;

	public class PlayState1 extends PlayState {
		[Embed(source="res/back_mud.png")]
		private var ImgBack:Class;

		//public var _explosionIndex:uint;

		override public function create():void {
			super.create();
			
		}

		override protected function addEnemy():void {
			if ((enemyCount < 10) && (_timer % _timerInterval < _timerLast % _timerInterval)){
				_enemies.add(new EnemyFast(int(FlxU.random() * 4), 80));
				enemyCount++;
			}
			// add boss
			if (_timerLast < 1 && _timer > 1){
				_boss.reset(FlxG.width / 2, -40);
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