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
			loadGraphic((new FlxSprite()).createGraphic(30, 30, 0xff3a5c39), (new FlxSprite()).createGraphic(30, 30, 0xff729954));
			var t1:FlxText = new FlxText(0, 4, 28, level.toString());
			t1.color = 0x729954;
			t1.size = 16;
			t1.alignment = "center";
			var t2:FlxText = new FlxText(0, 4, 28, level.toString());
			t2.color = 0xd8eba2;
			t2.size = 16;
			t2.alignment = "center";
			loadText(t1, t2);
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