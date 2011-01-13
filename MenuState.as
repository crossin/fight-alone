package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class MenuState extends FlxState {
		[Embed(source="res/cursor.png")]
		private var ImgCursor:Class;

		private var _title:FlxText;

		public function MenuState(){
			_title = new FlxText(0, FlxG.height / 3, 320, "Tankie");
			_title.size = 32;
			_title.alignment = "center";
			_title.color = 0xffffff;
			_title.antialiasing = true;
			add(_title);

			FlxG.mouse.show(ImgCursor);
		}

		override public function update():void {
			if (FlxG.mouse.justPressed()){
				FlxG.flash.start(0xffd8eba2, 0.5);
				FlxG.fade.start(0xff131c1b, 1, onFade);
			}
		}

		private function onFade():void {
			FlxG.state = new PlayState();
		}
	}

}