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
		
		private var levels:Array = [PlayState1, PlayState2];

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
			var t1:FlxText;
			var t2:FlxText;
			for (i = 0; i < 15; i++){
				b = new LevelButton(60 + i % 5 * 40, 50 + int(i / 5) * 40, i + 1);
				b.loadGraphic((new FlxSprite()).createGraphic(30, 30, 0xff3a5c39), (new FlxSprite()).createGraphic(30, 30, 0xff729954));
				//b.reset(50, 100*i)
				//s.width = 50;
				//s.height = 10;
				//s.offset.x = -31;
				//s.offset.y = -31;
				t1 = new FlxText(0, 4, 28, (i + 1).toString());
				t1.color = 0x729954;
				t1.size = 16;
				t1.alignment = "center";
				t2 = new FlxText(0, 4, 28, (i + 1).toString());
				t2.color = 0xd8eba2;
				t2.size = 16;
				t2.alignment = "center";
				b.loadText(t1, t2);
				btnLevels.add(b);
			}
			add(btnLevels);

			//levels = new Array(PlayState1);

			FlxG.mouse.show(ImgCursor);
		}

		public function playLevel(index:uint):void {
			FlxG.state = new levels[index-1];
		}
	}
}