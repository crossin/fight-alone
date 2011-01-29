package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class ShopState extends FlxState {
		[Embed(source="res/cursor.png")]
		private var ImgCursor:Class;

		private var _title:FlxText;

		public function ShopState(){
			_title = new FlxText(0, FlxG.height / 3, 320, "here is SHOP");
			_title.size = 12;
			_title.alignment = "center";
			_title.color = 0xffffff;
			//_title.antialiasing = true;
			add(_title);

			var b:FlxButton;
			var t1:FlxText;
			var t2:FlxText;
			// choose levels
			b = new FlxButton(135, 150, onOK);
			b.loadGraphic((new FlxSprite()).createGraphic(50, 30, 0xff3a5c39), (new FlxSprite()).createGraphic(50, 30, 0xff729954));
			t1 = new FlxText(0, 8, 48, "OK");
			t1.color = 0x729954;
			t1.size = 8;
			t1.alignment = "center";
			t2 = new FlxText(0, 8, 48, "OK");
			t2.color = 0xd8eba2;
			t2.size = 8;
			t2.alignment = "center";
			b.loadText(t1, t2);
			add(b);

			FlxG.mouse.show(ImgCursor);
		}

		private function onOK():void {
			FlxG.flash.start(0xffd8eba2, 1);
			FlxG.fade.start(0xff131c1b, 1, onFade);
		}

		private function onFade():void {
			FlxG.state = new LevelState();
		}
	}

}