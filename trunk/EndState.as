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

		public function EndState(hasWin:Boolean){
			_title = new FlxText(0, FlxG.height / 3, 320, "you lose");
			if (hasWin){
				_title.text = "you win";
			}
			_title.size = 12;
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