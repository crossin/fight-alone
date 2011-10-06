package {
	import org.flixel.*;

	public class PlayState5 extends PlayState {
		[Embed(source="res/back_mud.png")]
		private var ImgBack:Class;
		
		protected var boss:Boss_1;

		override public function create():void {
			map = [
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
			];
			startX = 184;
			startY = 150;
			super.create();
			back.loadGraphic(ImgBack);

			_timerInterval = 5;
			
			boss = new Boss_1();
			_enemies.add(boss);
			enemyCount = 1;
			
			index = 5;
		}

		override protected function addEnemy():void {
			//if ((enemyCount < 5) && (_timer % _timerInterval < _timerLast % _timerInterval)){
				//_enemies.add(new EnemyPlain(int(FlxU.random() * 4), 5));
				//enemyCount++;
			//}
			//if ((enemyCount >= 5) && (enemyCount < 10) && (_timer % _timerInterval < _timerLast % _timerInterval)){
				//_enemies.add(new EnemyBig(int(FlxU.random() * 4), 5));
				//enemyCount++;
			//}
			//if ((enemyCount >= 10) && (enemyCount < 15) && (_timer % _timerInterval < _timerLast % _timerInterval)){
				//_enemies.add(new EnemyShootFast(int(FlxU.random() * 4), 5));
				//enemyCount++;
			//}
			//if ((enemyCount >= 15) && (enemyCount < 20) && (_timer % _timerInterval < _timerLast % _timerInterval)){
				//_enemies.add(new EnemyFast(int(FlxU.random() * 4), 5));
				//enemyCount++;
			//}

		}

		override public function update():void {
			super.update();
			//FlxU.collide(_tank, boss.base);
			//FlxU.overlap(target, _tank, overlapped2);
		}
		
		override protected function overlapped(Object1:FlxObject, Object2:FlxObject):void {
			if (Object2 != boss.cannon) {
				super.overlapped(Object1, Object2);
				if (!(Object1 is EnemyBullet) && (Object2 == boss.base)){
					boss.hurt((Object1 as Bullet).damage);
				}
			}
		}
	}
}