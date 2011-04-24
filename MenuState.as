package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class MenuState extends FlxState {
		[Embed(source="res/cursor.png")]
		private var ImgCursor:Class;
		[Embed(source="res/title.png")]
		private var ImgTitle:Class;
		
		private var _title:FlxText;

		public function MenuState(){
			_title = new FlxText(0, FlxG.height / 3, 320, "TanKe");
			_title.size = 64;
			_title.alignment = "center";
			_title.color = 0xffffff;
			_title.antialiasing = true;
			add(_title);
			
			var bg:FlxSprite = new FlxSprite(0, 0, ImgTitle);
			add(bg);
			
			FlxG.mouse.show(ImgCursor);
		}

		override public function update():void {
			if (FlxG.mouse.justPressed()){
				FlxG.flash.start(0xffd8eba2, 1);
				FlxG.fade.start(0xff131c1b, 1, onFade);
			}
		}

		private function onFade():void {
			FlxG.state = new LevelState();
		}
	}

}