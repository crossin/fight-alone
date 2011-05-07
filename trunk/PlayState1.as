package {
	import org.flixel.*;

	public class PlayState1 extends PlayState {
		[Embed(source="res/back_mud.png")]
		private var ImgBack:Class;

		//public var _explosionIndex:uint;

		override public function create():void {
			map = [
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 0, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 2, 0, 0, 0, 0, 2, 2, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0],
			[0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0],
			[0, 0, 0, 2, 0, 0, 0, 2, 0, 0, -1, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0],
			[0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0],
			[0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 2, 0, 0, 0, 0, 2, 2, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 0, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
			];
			startX = 184;
			startY = 150;
			super.create();
			back.loadGraphic(ImgBack);
			index = 1;
			
			// add enemies
			var enemy:Enemy;
			//enemy = new EnemyPlain(0, 10);
			//enemy.reset(180, 0);
			//_enemies.add(enemy);
			enemy = new EnemyPlain(0, 10);
			enemy.reset(180, 50);
			_enemies.add(enemy);
			enemy = new EnemyPlain(0, 10);
			enemy.reset(180, 250);
			_enemies.add(enemy);
			//enemy = new EnemyPlain(0, 10);
			//enemy.reset(180, 300);
			//_enemies.add(enemy);
			
			//enemy = new EnemyPlain(0, 10);
			//enemy.reset(30, 150);
			//_enemies.add(enemy);
			enemy = new EnemyPlain(0, 10);
			enemy.reset(80, 150);
			_enemies.add(enemy);
			enemy = new EnemyPlain(0, 10);
			enemy.reset(280, 150);
			_enemies.add(enemy);
			//enemy = new EnemyPlain(0, 10);
			//enemy.reset(330, 150);
			//_enemies.add(enemy);
			
			//enemy = new EnemyPlain(0, 5);
			//enemy.reset(120, 90);
			//_enemies.add(enemy);
			//enemy = new EnemyPlain(0, 5);
			//enemy.reset(120, 210);
			//_enemies.add(enemy);
			//enemy = new EnemyPlain(0, 5);
			//enemy.reset(240, 90);
			//_enemies.add(enemy);
			//enemy = new EnemyPlain(0, 5);
			//enemy.reset(240, 210);
			//_enemies.add(enemy);
			
			//enemy = new EnemyPlain(0, 5);
			//enemy.reset(60, 80);
			//_enemies.add(enemy);
			//enemy = new EnemyPlain(0, 5);
			//enemy.reset(60, 220);
			//_enemies.add(enemy);
			//enemy = new EnemyPlain(0, 5);
			//enemy.reset(300, 80);
			//_enemies.add(enemy);
			//enemy = new EnemyPlain(0, 5);
			//enemy.reset(300, 220);
			//_enemies.add(enemy);
			
			//enemy = new EnemyPlain(0, 10);
			//enemy.reset(110, 30);
			//_enemies.add(enemy);
			//enemy = new EnemyPlain(0, 10);
			//enemy.reset(110, 270);
			//_enemies.add(enemy);
			//enemy = new EnemyPlain(0, 10);
			//enemy.reset(250, 30);
			//_enemies.add(enemy);
			//enemy = new EnemyPlain(0, 10);
			//enemy.reset(250, 270);
			//_enemies.add(enemy);
			
			enemyCount = 4;
		}

		override protected function addEnemy():void {
			if ((enemyCount < 10) && (_timer % _timerInterval < _timerLast % _timerInterval)){
				_enemies.add(new EnemyPlain(int(FlxU.random() * 4), 10));
				enemyCount++;
			}
			//if ((enemyCount >= 10) && (enemyCount < 12) && (_timer % _timerInterval < _timerLast % _timerInterval)){
				//_enemies.add(new EnemyFast(int(FlxU.random() * 4), 10));
				//enemyCount++;
			//}
			// add boss
			//if (_timerLast < 1 && _timer > 1) {
				//_enemies.add(new Boss(5));
				//_boss.reset(FlxG.width / 2, -40);
			//}
		}
	}
}