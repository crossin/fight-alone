package {
	import org.flixel.FlxText;

	/**
	 * ...
	 * @author Crossin
	 */
	public class Achievement extends FlxText {
		public var name:String;
		public var got:Boolean;

		public function Achievement(n:String, ix:int, iy:int){
			super(ix, iy, 320, "????????");
			name = n;
			got = false;
			color = 0xff888888;
			size = 16;
			alignment = "center";
		}

		public function achieve():void {
			color = 0xffffffff;
			text = name;
		}
	}

}