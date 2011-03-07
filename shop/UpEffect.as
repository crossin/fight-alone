package {
	import org.flixel.*;

	/**
	 * ...
	 * @author crossin
	 */
	public class UpEffect extends FlxGroup {
		[Embed(source="res/up.png")]
		private var ImgUp:Class;

		protected var img:FlxSprite;
		protected var level:FlxText;
		protected var offset:Number;
		protected var time:int;

		public function UpEffect() {
			offset = 16;
			time = 0;
			img = new FlxSprite(0, 8, ImgUp);
			level = new FlxText(0, 6, 22, "1");
			level.size = 8;
			level.alignment = "center";
			add(img);
			add(level);
			exists = false;
			//visible = false;
		}
		
		override public function update():void 
		{
			if (exists){
				var tank:Tank = (FlxG.state as PlayState)._tank;
				reset(tank.x, tank.y - offset);
				offset = (offset >= 16)?16:(offset + 1);
				img.alpha += 0.04;
				level.alpha += 0.04;
				if (time++ > 50) {
					exists = false;	
				}
			}
			super.update();
		}

		public function show(clr:uint, lvl:String):void {
			img.color = clr;
			level.text = lvl;
			level.color = clr;
			img.alpha =0;
			level.alpha = 0;
			offset = 0;
			time = 0;
			exists = true;
		}
	}

}