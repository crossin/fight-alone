package {
	import org.flixel.*;
	import flash.utils.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class LevelState extends FlxState {
		[Embed(source="res/cursor.png")]
		private var ImgCursor:Class;
		[Embed(source="res/back_mud.png")]
		private var ImgBack:Class;

		private var _title:FlxText;
		private var btnLevels:FlxGroup;

		public static var levels:Array = [
		PlayState1, 
		PlayState2,
		PlayState3,
		];
		
		public static var levelMax:uint = 20;
		public static var levelUnlock:uint = 3;

		public function LevelState() {
			var back:FlxTileblock;
			back = new FlxTileblock(0, 0, FlxG.width, FlxG.height);
			back.loadGraphic(ImgBack);
			add(back);
			
			_title = new FlxText(0, 10, 320, "Choose Level");
			_title.size = 16;
			_title.alignment = "center";
			_title.color = 0x672a02;
			_title.antialiasing = true;
			add(_title);

			btnLevels = new FlxGroup();
			var i:int;
			var b:FlxButton;
			//var t1:FlxText;
			//var t2:FlxText;
			for (i = 0; i < levelMax; i++){
				b = new LevelButton(70 + i % 5 * 40, 40 + int(i / 5) * 40, i + 1, int(i / 5));
				//if (i < levelUnlock) {
				//b.loadGraphic((new FlxSprite()).createGraphic(30, 30, 0xff3a5c39), (new FlxSprite()).createGraphic(30, 30, 0xff729954));
				//t1 = new FlxText(0, 4, 28, (i + 1).toString());
				//t1.color = 0x729954;
				//t1.size = 16;
				//t1.alignment = "center";
				//t2 = new FlxText(0, 4, 28, (i + 1).toString());
				//t2.color = 0xd8eba2;
				//t2.size = 16;
				//t2.alignment = "center";
				//b.loadText(t1, t2);
				//}

				btnLevels.add(b);
			}
			add(btnLevels);

			var t1:FlxText;
			var t2:FlxText;
			// menu
			b = new FlxButton((FlxG.width - 80) / 2, 200, onMenu);
			b.loadGraphic((new FlxSprite()).createGraphic(80, 12, 0x00000000));
			t1 = new FlxText(0, 0, 80, "MENU");
			t1.color = 0x672a02;
			t1.shadow = 0xe3cba2;
			t1.size = 8;
			t1.alignment = "center";
			t2 = new FlxText(0, 0, 80, "MENU");
			t2.color = 0xe3cba2;
			t2.shadow = 0x672a02;
			t2.size = 8;
			t2.alignment = "center";
			b.loadText(t1, t2);
			add(b);
			// shop
			//b = new FlxButton(135, 190, onShop);
			//b.loadGraphic((new FlxSprite()).createGraphic(50, 30, 0xff3a5c39), (new FlxSprite()).createGraphic(50, 30, 0xff729954));
			//t1 = new FlxText(0, 8, 48, "Shop");
			//t1.color = 0x729954;
			//t1.size = 8;
			//t1.alignment = "center";
			//t2 = new FlxText(0, 8, 48, "Shop");
			//t2.color = 0xd8eba2;
			//t2.size = 8;
			//t2.alignment = "center";
			//b.loadText(t1, t2);
			//add(b);

			//levels = new Array(PlayState1);
			FlxG.mouse.show(ImgCursor);
		}

		public function playLevel(index:uint):void {
			FlxG.state = new levels[index - 1];
		}

		private function onMenu():void {
			FlxG.flash.start(0xffe3cba2, 1);
			FlxG.fade.start(0xff1e150f, 1, onMenuFade);
		}
		
		private function onMenuFade():void {
			FlxG.state = new MenuState();
		}
		//private function onShop():void {
			//FlxG.flash.start(0xffd8eba2, 1);
			//FlxG.fade.start(0xff131c1b, 1, onShopFade);
		//}
		//private function onShopFade():void {
			//FlxG.state = new ShopState();
		//}
	}
}