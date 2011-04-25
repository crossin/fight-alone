package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class LevelButton extends FlxButton {
		[Embed(source="res/box.png")]
		private var ImgBox:Class;
		[Embed(source="res/brick.png")]
		private var ImgBrick:Class;
		[Embed(source="res/steel.png")]
		private var ImgSteel:Class;
		[Embed(source="res/barrier.png")]
		private var ImgBarrier:Class;
		
		private var level:uint;

		public function LevelButton(iX:int, iY:int, index:uint, type:int){
			super(iX, iY, onButton);
			level = index;
			var t1:FlxText;
			var t2:FlxText;
			var ImgBlock:Class;
			t1 = new FlxText(0, 2, 16, level.toString());
			t1.size = 8;
			t1.alignment = "center";
			t2 = new FlxText(0, 2, 16, level.toString());
			t2.size = 8;
			t2.alignment = "center";
			switch (type) {
				case 0:
					ImgBlock = ImgBox;
					t1.color = 0x555555;
					t2.color = 0x222222;
					break;
				case 1:default:
					ImgBlock = ImgBrick;
					t1.color = 0xdddddd;
					t2.color = 0xaaaaaa;
					break;
				case 2:
					ImgBlock = ImgSteel;
					t1.color = 0x555555;
					t2.color = 0x222222;
					break;
				case 3:
					ImgBlock = ImgBarrier;
					t1.color = 0xdddddd;
					t2.color = 0xaaaaaa;
					break;
			}
			if (level <= LevelState.levelUnlock) {
				var back1:FlxSprite = new FlxSprite();
				back1.loadGraphic(ImgBlock, true);
				var back2:FlxSprite = new FlxSprite();
				back2.loadGraphic(ImgBlock, true);
				back2.color = 0xcccccc;
				loadGraphic(back1, back2);
				//loadGraphic((new FlxSprite()).createGraphic(30, 30, 0xff3a5c39), (new FlxSprite()).createGraphic(30, 30, 0xff729954));
				
				//t1.color = 0x729954;
				//t1.color = 0xfecc39;
				//t1.color = 0x654c09;
				//t1.size = 8;
				//t1.shadow = 0xEBFAFF;
				//t1.alignment = "center";
				
				//t2.color = 0xd8eba2;
				//t2.color = 0x333333;

				//t2.shadow = 0x999999;
				//t2.alignment = "center";
				loadText(t1, t2);
			} else {
				_callback = null;
				var back3:FlxSprite = new FlxSprite();
				back3.loadGraphic(ImgBlock, true);
				back3.alpha = 0.5;
				loadGraphic(back3);
				//t1 = new FlxText(0, 2, 16, level.toString());
				//t1.color = 0x666666;
				//t1.size = 8;
				//t1.shadow = 0xcccccc;
				//t1.alignment = "center";
				t1.alpha = 0.5;
				loadText(t1);
			}
		}

		private function onButton():void {
			FlxG.flash.start(0xffe3cba2, 1);
			FlxG.fade.start(0xff1e150f, 1, onFade);
		}

		private function onFade():void {
			(FlxG.state as LevelState).playLevel(level);
		}

	}

}