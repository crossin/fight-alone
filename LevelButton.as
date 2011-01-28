package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class LevelButton extends FlxButton {
		private var level:uint;

		public function LevelButton(iX:int, iY:int, index:uint){
			super(iX, iY, onButton);
			level = index;
			var t1:FlxText;
			var t2:FlxText;
			if (level <= LevelState.levelUnlock) {
				loadGraphic((new FlxSprite()).createGraphic(30, 30, 0xff3a5c39), (new FlxSprite()).createGraphic(30, 30, 0xff729954));
				t1 = new FlxText(0, 4, 28, level.toString());
				t1.color = 0x729954;
				t1.size = 16;
				t1.alignment = "center";
				t2 = new FlxText(0, 4, 28, level.toString());
				t2.color = 0xd8eba2;
				t2.size = 16;
				t2.alignment = "center";
				loadText(t1, t2);
			} else {
				_callback = null;
				loadGraphic((new FlxSprite()).createGraphic(30, 30, 0xff818181));
				t1 = new FlxText(0, 4, 28, level.toString());
				t1.color = 0xc1c1c1;
				t1.size = 16;
				t1.alignment = "center";
				loadText(t1);
			}
		}

		private function onButton():void {
			FlxG.flash.start(0xffd8eba2, 0.5);
			FlxG.fade.start(0xff131c1b, 1, onFade);
		}
		
		private function onFade():void {
			(FlxG.state as LevelState).playLevel(level);
		}

	}

}