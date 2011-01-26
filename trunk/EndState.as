package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class EndState extends FlxState {
		[Embed(source="res/cursor.png")]
		private var ImgCursor:Class;

		private var _title:FlxText;
		private var action:Class;

		public function EndState(hasWin:Boolean){
			_title = new FlxText(0, FlxG.height / 3, 320, "you lose");
			action = MenuState;
			if (hasWin){
				_title.text = "you win";
			}
			_title.size = 12;
			_title.alignment = "center";
			_title.color = 0xffffff;
			_title.antialiasing = true;
			add(_title);

			var b:FlxButton;
			var t1:FlxText;
			var t2:FlxText;
			// choose levels
			b = new FlxButton(75, 150, onLevels);
			b.loadGraphic((new FlxSprite()).createGraphic(50, 30, 0xff3a5c39), (new FlxSprite()).createGraphic(50, 30, 0xff729954));
			t1 = new FlxText(0, 8, 48, "Levels");
			t1.color = 0x729954;
			t1.size = 8;
			t1.alignment = "center";
			t2 = new FlxText(0, 8, 48, "Levels");
			t2.color = 0xd8eba2;
			t2.size = 8;
			t2.alignment = "center";
			b.loadText(t1, t2);
			add(b);
			// replay
			b = new FlxButton(135, 150, onLevels);
			b.loadGraphic((new FlxSprite()).createGraphic(50, 30, 0xff3a5c39), (new FlxSprite()).createGraphic(50, 30, 0xff729954));
			t1 = new FlxText(0, 8, 48, "Replay");
			t1.color = 0x729954;
			t1.size = 8;
			t1.alignment = "center";
			t2 = new FlxText(0, 8, 48, "Replay");
			t2.color = 0xd8eba2;
			t2.size = 8;
			t2.alignment = "center";
			b.loadText(t1, t2);
			add(b);
			// next level
			b = new FlxButton(195, 150, onLevels);
			b.loadGraphic((new FlxSprite()).createGraphic(50, 30, 0xff3a5c39), (new FlxSprite()).createGraphic(50, 30, 0xff729954));
			t1 = new FlxText(0, 8, 48, "Next");
			t1.color = 0x729954;
			t1.size = 8;
			t1.alignment = "center";
			t2 = new FlxText(0, 8, 48, "Next");
			t2.color = 0xd8eba2;
			t2.size = 8;
			t2.alignment = "center";
			b.loadText(t1, t2);
			add(b);

			FlxG.mouse.show(ImgCursor);
		}

		//override public function update():void {
		//if (FlxG.mouse.justPressed()){
		//FlxG.flash.start(0xffd8eba2, 0.5);
		//FlxG.fade.start(0xff131c1b, 1, onFade);
		//}
		//}

		private function onFade():void {
			FlxG.state = new action;
		}

		private function onLevels():void {
			action = LevelState;
			FlxG.flash.start(0xffd8eba2, 0.5);
			FlxG.fade.start(0xff131c1b, 1, onFade);
		}
		
				private function onReplay():void {
			action = LevelState;
			FlxG.flash.start(0xffd8eba2, 0.5);
			FlxG.fade.start(0xff131c1b, 1, onFade);
		}
		
				private function onNext():void {
			action = LevelState;
			FlxG.flash.start(0xffd8eba2, 0.5);
			FlxG.fade.start(0xff131c1b, 1, onFade);
		}
	}

}