package {
	/**
	 * ...
	 * @author Crossin
	 */
	public class Upgrade {
		public var name:String;
		public var price:int;
		public var increment:int;
		public var colorName:uint;
		public var colorPrice:uint;
		public var gold:uint;

		public function Upgrade() {
			name = "UP";
			price = 0;
			increment = 0;
			colorName = 0xff000000;
			colorPrice = 0xffffffff;
		}

		public function doEffect():void {
			// to be overrided
		}
	}
}