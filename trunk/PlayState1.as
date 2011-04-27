package {
	import org.flixel.*;

	public class PlayState1 extends PlayState {
		[Embed(source="res/back_mud.png")]
		private var ImgBack:Class;

		//public var _explosionIndex:uint;

		override public function create():void {
			map = [
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 4, 0, 0, 2, 0, 0, 2, 0, 0, 2, 0, 0, 2, 0, 0, 4, 0, 0, 0],
			[0, 0, 0, 2, 0, 0, 2, 0, 0, 2, 0, 0, 2, 0, 0, 2, 0, 0, 2, 0, 0, 0],
			[0, 0, 0, 2, 0, 0, 2, 0, 0, 2, 2, 2, 2, 0, 0, 2, 0, 0, 2, 0, 0, 0],
			[0, 0, 0, 2, 0, 0, 2, 0, 0, 2, 0, 0, 2, 0, 0, 2, 0, 0, 2, 0, 0, 0],
			[0, 0, 0, 2, 0, 0, 2, 0, 2, 0, 0, 0, 0, 0, 0, 2, 0, 0, 2, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 2, 2, 2, 2, 0, 2, 0, -1, -1, 0, 0, 0, 2, 2, 2, 2, 0, 0, 0],
			[0, 0, 0, 2, 2, 2, 2, 0, 0, -1, -1, -1, 0, 0, 0, 2, 2, 2, 2, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 2, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 2, 0, 0, 0],
			[0, 0, 0, 2, 0, 0, 2, 0, 0, 2, 0, 0, 2, 0, 0, 2, 0, 0, 2, 0, 0, 0],
			[0, 0, 0, 2, 0, 0, 2, 0, 0, 2, 2, 2, 2, 0, 0, 2, 0, 0, 2, 0, 0, 0],
			[0, 0, 0, 2, 0, 0, 2, 0, 0, 2, 0, 0, 2, 0, 0, 2, 0, 0, 2, 0, 0, 0],
			[0, 0, 0, 4, 0, 0, 2, 0, 0, 2, 0, 0, 2, 0, 0, 2, 0, 0, 4, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
			];
			
			super.create();
			back.loadGraphic(ImgBack);
			index = 1;
		}

		override protected function addEnemy():void {
			if ((enemyCount < 10) && (_timer % _timerInterval < _timerLast % _timerInterval)){
				_enemies.add(new EnemyShootFast(int(FlxU.random() * 4), 118));
				enemyCount++;
			}
			if ((enemyCount >= 10) && (enemyCount < 12) && (_timer % _timerInterval < _timerLast % _timerInterval)){
				_enemies.add(new EnemyFast(int(FlxU.random() * 4), 10));
				enemyCount++;
			}
			// add boss
			//if (_timerLast < 1 && _timer > 1) {
				//_enemies.add(new Boss(5));
				//_boss.reset(FlxG.width / 2, -40);
			//}
		}
	}
}