package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class BlockSteel extends Block {
		[Embed(source="res/steel.png")]
		private var ImgBlock:Class;
		[Embed(source="res/gibs_steel.png")]
		private var ImgGibsSteel:Class;

		public function BlockSteel(ix:int, iy:int){
			super(ix, iy);
			loadGraphic(ImgBlock, true);
			//fixed = false;
			health = 4;
			addAnimation("health4", [0]);
			addAnimation("health3", [1]);
			addAnimation("health2", [2]);
			addAnimation("health1", [3]);

			ImgGibs = ImgGibsSteel;
		}
	}
}