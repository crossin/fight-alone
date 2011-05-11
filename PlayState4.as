package {
	import org.flixel.*;

	public class PlayState4 extends PlayState {
		[Embed(source="res/back_mud.png")]
		private var ImgBack:Class;

		override public function create():void {
			map = [
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
			[0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0], 
			[0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0], 
			[0, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0], 
			[0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0], 
			[0, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0], 
			[0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0], 
			[0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0], 
			[0, 0, 0, 1, 0, 1, 0, 1, 0, 0, -1, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0], 
			[0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0], 
			[0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0], 
			[0, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0], 
			[0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0], 
			[0, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0], 
			[0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0], 
			[0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0]
			];
			startX = 184;
			startY = 150;
			super.create();
			back.loadGraphic(ImgBack);

			_timerInterval = 2;
			
			index = 4;
		}

		override protected function addEnemy():void {
			if ((enemyCount < 10) && (_timer % _timerInterval < _timerLast % _timerInterval)){
				_enemies.add(new EnemyPlain(enemyCount % 2 + 1, 0));
				enemyCount++;
			}
			if ((enemyCount >= 10) && (enemyCount < 20) && (_timer % _timerInterval < _timerLast % _timerInterval)){
				_enemies.add(new EnemyShootFast(enemyCount % 2 + 1, 0));
				enemyCount++;
			}
			if ((enemyCount >= 20) && (enemyCount < 30) && (_timer % _timerInterval < _timerLast % _timerInterval)){
				_enemies.add(new EnemyFast(enemyCount % 2 + 1, 0));
				enemyCount++;
			}
			
			if (_timer % 3 < _timerLast % 3){
				(FlxG.state as PlayState).updateProgress(5, 0);
			}
		}

		//override public function update():void {
			//super.update();
			//FlxU.overlap(target, _tank, overlapped2);
		//}
	}
}