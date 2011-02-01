package {
	import flash.geom.Point;
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class UpgradeAS extends Upgrade {

		public function UpgradeAS(k:uint){
			super(k);
			price = 200;
			increment = 75;
			colorName = 0xff00cc00;
			colorPrice = 0xffccffcc;
			bgName.fill(colorName);
			bgPrice.fill(colorPrice);
			txtName.text = "AS";
			txtName.color = 0xccffcc;
			txtPrice.text = price.toString();
			txtPrice.color = 0x00cc00;
		}

	}
}