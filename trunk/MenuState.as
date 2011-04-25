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
		[Embed(source="res/back_mud.png")]
		private var ImgBack:Class;
		
		private var _title:FlxText;

		public function MenuState(){
			_title = new FlxText(0, FlxG.height / 3, 320, "TanKe");
			_title.size = 64;
			_title.alignment = "center";
			_title.color = 0xffffff;
			_title.antialiasing = true;
			add(_title);
			
			var back:FlxTileblock;
			back = new FlxTileblock(0, 0, FlxG.width, FlxG.height);
			back.loadGraphic(ImgBack);
			add(back);
			
			var bg:FlxSprite = new FlxSprite(0, 0, ImgTitle);
			add(bg);
			
			FlxG.mouse.show(ImgCursor);
		}

		override public function update():void {
			if (FlxG.mouse.justPressed()){
				FlxG.flash.start(0xffe3cba2, 1);
				FlxG.fade.start(0xff1e150f, 1, onFade);
			}
		}

		private function onFade():void {
			FlxG.state = new LevelState();
		}
	}

}