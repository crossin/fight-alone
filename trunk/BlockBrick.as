package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class BlockBrick extends Block {
		[Embed(source="res/brick.png")]
		private var ImgBlock:Class;
		[Embed(source="res/gibs_brick.png")]
		private var ImgGibsBrick:Class;

		public function BlockBrick(ix:int, iy:int){
			super(ix, iy);
			loadGraphic(ImgBlock, true);
			width = 18;
			height = 18;
			//fixed = false;
			health = 2;
			addAnimation("health2", [0]);
			addAnimation("health1", [1]);

			ImgGibs = ImgGibsBrick;
		}
	}
}