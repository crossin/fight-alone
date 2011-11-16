package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class AchieveState extends FlxState {
		[Embed(source="res/crosshair.png")]
		private var ImgCursor:Class;
		[Embed(source="res/back.png")]
		private var ImgBack:Class;

		private var btn_play:FlxButton;
		private var btn_shop:FlxButton;
		private var achievements:Array;
		private var names:Array = ["first blood", "killed 5 enemies in a game", "killed 10 enemies in total", "survived 30 seconds", "survived 3 seconds", "played 15 seconds", "got 100 points", "got 200 points", "got 500 points", "killed boss 1", "killed boss 2", "killed final boss", "full speed", "full fire rate", "full power", "max bombs", "max lives", "the most powerful ship"];

		public static var wins:Array;

		public function AchieveState(){

			var back:FlxSprite = new FlxSprite(-200, -200, ImgBack);
			add(back);

			var txt:FlxText = new FlxText(0, 20, 640, "ACHIEVEMENTS");
			txt.size = 48;
			txt.alignment = "center";
			add(txt);

			var t1:FlxText;
			var t2:FlxText;
			btn_play = new FlxButton(240, 400, onPlay);
			btn_play.loadGraphic((new FlxSprite()).createGraphic(160, 60, 0x00000000));
			t1 = new FlxText(0, 0, 160, "PLAY");
			t1.size = 48;
			t1.alignment = "center";
			t2 = new FlxText(0, 0, 160, "PLAY");
			t2.color = 0xff888888;
			t2.size = 48;
			t2.alignment = "center";
			btn_play.loadText(t1, t2);
			add(btn_play);

			btn_shop = new FlxButton(80, 424, onShop);
			btn_shop.loadGraphic((new FlxSprite()).createGraphic(80, 30, 0x00000000));
			t1 = new FlxText(0, 0, 80, "SHOP");
			t1.size = 24;
			t1.alignment = "center";
			t2 = new FlxText(0, 0, 80, "SHOP");
			t2.color = 0xff888888;
			t2.size = 24;
			t2.alignment = "center";
			btn_shop.loadText(t1, t2);
			add(btn_shop);

			var len:int = names.length;
			achievements = new Array(len);
			for (var i:int = 0; i < len; i++){
				achievements[i] = new Achievement(names[i], i % 2 * 320, 100 + int(i / 2) * 30);
				if (wins[i]){
					achievements[i].achieve();
				}
				add(achievements[i]);
			}

			FlxG.mouse.show(ImgCursor);
		}

		private function onPlay():void {
			FlxG.state = new PlayState();
		}

		private function onShop():void {
			FlxG.state = new EndState();
		}
	}
}