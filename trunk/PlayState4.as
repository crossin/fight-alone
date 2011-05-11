package {
	import org.flixel.*;

	public class PlayState4 extends PlayState {
		[Embed(source="res/back_mud.png")]
		private var ImgBack:Class;

		override public function create():void {
			map = [
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
			[0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 0, 0, 0, 0, 0], 
			[0, 0, 0, 1, 1, 4, 1, 1, 0, 0, 0, 0, 0, 2, 2, 4, 2, 2, 0, 0, 0, 0], 
			[0, 0, 0, 1, 4, 4, 4, 1, 0, 0, 0, 0, 0, 2, 4, 4, 4, 2, 0, 0, 0, 0], 
			[0, 0, 0, 1, 1, 4, 1, 1, 0, 0, 0, 0, 0, 2, 2, 4, 2, 2, 0, 0, 0, 0], 
			[0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 0, 0, 0, 0, 0], 
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
			[0, 0, 0, 0, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0], 
			[0, 0, 0, 3, 3, 4, 3, 3, 0, 0, 0, 0, 0, 1, 1, 4, 1, 1, 0, 0, 0, 0], 
			[0, 0, 0, 3, 4, 4, 4, 3, 0, 0, 0, 0, 0, 1, 4, 4, 4, 1, 0, 0, 0, 0], 
			[0, 0, 0, 3, 3, 4, 3, 3, 0, 0, 0, 0, 0, 1, 1, 4, 1, 1, 0, 0, 0, 0], 
			[0, 0, 0, 0, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0]
			];
			startX = 184;
			startY = 150;
			super.create();
			back.loadGraphic(ImgBack);

			_timerInterval = 5;
			
			index = 4;
		}

		override protected function addEnemy():void {
			if ((enemyCount < 5) && (_timer % _timerInterval < _timerLast % _timerInterval)){
				_enemies.add(new EnemyBig(int(FlxU.random() * 4), 5));
				enemyCount++;
			}
			if ((enemyCount >= 5) && (enemyCount < 10) && (_timer % _timerInterval < _timerLast % _timerInterval)){
				_enemies.add(new EnemyShootFast(int(FlxU.random() * 4), 5));
				enemyCount++;
			}
			if ((enemyCount >= 10) && (enemyCount < 15) && (_timer % _timerInterval < _timerLast % _timerInterval)){
				_enemies.add(new EnemyFast(int(FlxU.random() * 4), 5));
				enemyCount++;
			}
			if ((enemyCount >= 15) && (enemyCount < 20) && (_timer % _timerInterval < _timerLast % _timerInterval)){
				_enemies.add(new EnemyFast(int(FlxU.random() * 4), 5));
				enemyCount++;
			}

		}

		//override public function update():void {
			//super.update();
			//FlxU.overlap(target, _tank, overlapped2);
		//}
	}
}