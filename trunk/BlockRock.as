package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class BlockRock extends Block {
		[Embed(source="res/rock.png")]
		private var ImgBlock:Class;
		[Embed(source="res/gibs_rock.png")]
		private var ImgGibsRock:Class;

		public function BlockRock(ix:int, iy:int){
			super(ix, iy);
			loadGraphic(ImgBlock, true);
			//fixed = false;
			health = 2;
			addAnimation("health2", [0]);
			addAnimation("health1", [1]);

			ImgGibs = ImgGibsRock;
		}
	}
}