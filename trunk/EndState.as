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
		private var index:uint;

		public function EndState(hasWin:Boolean, id:uint){
			_title = new FlxText(0, FlxG.height / 3, 320, "you lose");
			action = MenuState;
			index = id;
			if (hasWin){
				_title.text = "you win";
				if ((index == LevelState.levelUnlock) && (index < LevelState.levelMax)){
					LevelState.levelUnlock++;
				}
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
			b = new FlxButton(135, 150, onReplay);
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
			b = new FlxButton(195, 150, onNext);
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
			// shop
			b = new FlxButton(135, 190, onShop);
			b.loadGraphic((new FlxSprite()).createGraphic(50, 30, 0xff3a5c39), (new FlxSprite()).createGraphic(50, 30, 0xff729954));
			t1 = new FlxText(0, 8, 48, "Shop");
			t1.color = 0x729954;
			t1.size = 8;
			t1.alignment = "center";
			t2 = new FlxText(0, 8, 48, "Shop");
			t2.color = 0xd8eba2;
			t2.size = 8;
			t2.alignment = "center";
			b.loadText(t1, t2);
			add(b);

			FlxG.mouse.show(ImgCursor);
		}

		private function onLevels():void {
			FlxG.flash.start(0xffd8eba2, 1);
			FlxG.fade.start(0xff131c1b, 1, onLevelsFade);
		}

		private function onLevelsFade():void {
			FlxG.state = new LevelState();
		}

		private function onReplay():void {
			FlxG.flash.start(0xffd8eba2, 1);
			FlxG.fade.start(0xff131c1b, 1, onReplayFade);
		}

		private function onReplayFade():void {
			FlxG.state = new LevelState.levels[index - 1];
		}

		private function onNext():void {
			FlxG.flash.start(0xffd8eba2, 1);
			FlxG.fade.start(0xff131c1b, 1, onNextFade);
		}

		private function onNextFade():void {
			if (index < LevelState.levelMax){
				FlxG.state = new LevelState.levels[index];
			} else {
				FlxG.state = new ClearState();
			}
		}

		private function onShop():void {
			FlxG.flash.start(0xffd8eba2, 1);
			FlxG.fade.start(0xff131c1b, 1, onShopFade);
		}

		private function onShopFade():void {
			FlxG.state = new ShopState();
		}
	}
}