package {
	import org.flixel.*;

	public class PlayState3 extends PlayState {
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

			index = 3;
		}

		override protected function addEnemy():void {
			if ((enemyCount < 30) && (_timer % _timerInterval < _timerLast % _timerInterval)){
				_enemies.add(new EnemyShootFast(enemyCount % 2 + 1, 0));
				enemyCount++;
			}
			
			if ((enemyCount < 30) && (_timer % 3 < _timerLast % 3)){
				(FlxG.state as PlayState).updateProgress(5, 0);
			}
		}

		//override public function update():void {
			//super.update();
			//FlxU.overlap(target, _tank, overlapped2);
		//}
	}
}