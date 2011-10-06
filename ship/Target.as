package {
	import flash.display.Sprite;
	import org.flixel.*;
	import org.flixel.data.FlxAnim;

	/**
	 * ...
	 * @author Crossin
	 */
	public class Target extends FlxGroup {
		[Embed(source="res/target.png")]
		private var ImgTarget:Class;

		public var step:int;
		public var txtStep:FlxText;
		public var map:Array;

		public function Target(){
			super();
			var back:FlxSprite = new FlxSprite();
			back.loadGraphic(ImgTarget, true);
			back.addAnimation("play", [0, 1, 2, 3, 4, 5], 16);
			back.play("play");
			add(back);
			step = 0;
			txtStep = new FlxText(0, 4, 18);
			txtStep.size = 8;
			txtStep.alignment = "center";
			txtStep.color = 0xff8a00;
			txtStep.text = step.toString();
			add(txtStep);
		}


		public function nextStep():void {
			if (map[step]){
				reset(map[step][0], map[step][1]);
				step++;
				txtStep.text = step.toString();
			} else {
				kill();
				//
			}
		}
	}
}