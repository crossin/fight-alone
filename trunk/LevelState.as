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

		private var _title:FlxText;
		private var btnLevels:FlxGroup;
		private var levels:Array;

		public function LevelState(){
			_title = new FlxText(0, 0, 320, "Choose Level");
			_title.size = 16;
			_title.alignment = "center";
			_title.color = 0xffffff;
			_title.antialiasing = true;
			add(_title);
			
			btnLevels = new FlxGroup();
			var i:int;
			var b:FlxButton;
			for (i = 0; i < 15; i++){
				b = new FlxButton(60 + i%5 * 40, 50 + int(i / 5) * 40, onButton);
				b.loadGraphic((new FlxSprite()).createGraphic(30, 30, 0xff3a5c39), (new FlxSprite()).createGraphic(30, 30, 0xff729954));
				//b.reset(50, 100*i)
				//s.width = 50;
				//s.height = 10;
				//s.offset.x = -31;
				//s.offset.y = -31;

				btnLevels.add(b);
			}
			add(btnLevels);
			
			levels = new Array(PlayState);

			FlxG.mouse.show(ImgCursor);
		}

		private function onFade():void {
			//PlayState;
			//var level:Class = getDefinitionByName("unnamed.PlayState") as Class;
			//trace(level)
			FlxG.state = new levels[0];
		}
		
		private function onButton():void {
			//PlayState;
			//var level:Class = getDefinitionByName("unnamed.PlayState") as Class;
			//trace(level)
			//FlxG.state = new levels[0];
			
		}
	}

}