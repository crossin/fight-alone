package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class BlockBox extends Block {
		[Embed(source="res/box.png")]
		private var ImgBlock:Class;
		[Embed(source="res/gibs_box.png")]
		private var ImgGibsBox:Class;

		public function BlockBox(ix:int, iy:int){
			super(ix, iy);
			loadGraphic(ImgBlock);
			width = 18;
			height = 18;
			fixed = false;
			//health = 1;
			drag.x = 100;
			drag.y = 100;

			ImgGibs = ImgGibsBox;
		}

		override public function hurt(Damage:Number):void {
			kill();
		}
	}
}