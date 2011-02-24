package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class BlockBarrier extends Block {
		[Embed(source="res/barrier.png")]
		private var ImgBlock:Class;

		public function BlockBarrier(ix:int, iy:int){
			super(ix, iy);
			loadGraphic(ImgBlock);
			//fixed = false;
		}
		
		override public function hurt(Damage:Number):void {
		}
	}
}