package {
	import org.flixel.*;

	public class PlayState2 extends PlayState {
		[Embed(source="res/back_sand.png")]
		private var ImgBack:Class;


		//public var _explosionIndex:uint;
		protected var target:Target;

		override public function create():void {
			map = [
			[0, 0, 3, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 0, 0, 0], 
			[0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0], 
			[0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0], 
			[0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0], 
			[0, 0, 2, 0, 0, 0, 3, 3, 2, 2, 2, 2, 2, 3, 3, 0, 0, 0, 2, 0, 0, 0], 
			[0, 0, 2, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 2, 0, 0, 0], 
			[0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0], 
			[0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0], 
			[0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0], 
			[0, 0, 2, 0, 0, 0, 2, 0, -1, 0, 2, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0], 
			[0, 0, 2, 0, 0, 0, 3, 0, 0, 0, 3, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0], 
			[0, 0, 2, 0, 0, 0, 3, 3, 2, 3, 3, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0], 
			[0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0], 
			[0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0], 
			[0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 2, 0, 0, 0], 
			[0, 0, 3, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 0, 0, 0, 2, 0, 0, 0]
			];
			startX = 148;
			startY = 170;
			super.create();
			back.loadGraphic(ImgBack);

			target = new Target();
			target.map = [
			[70, 140], 
			[180, 40], 
			[290, 180], 
			[15, 40], 
			[360, 260], 
			[15, 220], 
			[360, 40], 
			[145, 165]
			];
			add(target);
			target.nextStep();

			index = 2;

			// add enemies
			var enemy:Enemy;
			enemy = new EnemyPlain(0, 0);
			enemy.reset(70, 220);
			_enemies.add(enemy);
			enemy = new EnemyPlain(0, 0);
			enemy.reset(70, 50);
			_enemies.add(enemy);
			enemy = new EnemyPlain(0, 0);
			enemy.reset(290, 50);
			_enemies.add(enemy);
			enemy = new EnemyPlain(0, 0);
			enemy.reset(200, 220);
			_enemies.add(enemy);
			enemy = new EnemyPlain(0, 0);
			enemy.reset(290, 200);
			_enemies.add(enemy);
			enemyCount = 5;
		}

		override protected function addEnemy():void {
			if ((enemyCount < 30) && (_timer % _timerInterval < _timerLast % _timerInterval)){
				_enemies.add(new EnemyShootFast(enemyCount % 2 + 1, 0));
				enemyCount++;
			}
		}

		override public function update():void {
			super.update();
			FlxU.overlap(target, _tank, overlapped2);
		}

		protected function overlapped2(Object1:FlxObject, Object2:FlxObject):void {
			target.nextStep();
			(FlxG.state as PlayState).updateProgress(13, 0);
		}
	}
}