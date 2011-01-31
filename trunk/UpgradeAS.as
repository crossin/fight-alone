package {
	import flash.geom.Point;
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class UpgradeAS extends Upgrade {

		public function UpgradeAS(){
			super();
			price = 200;
			increment = 75;
			bgName.fill(0xff00cc00);
			bgPrice.fill(0xffccffcc);
			txtName.text = "AS";
			txtName.color = 0xccffcc;
			txtPrice.text = price.toString();
			txtPrice.color = 0x00cc00;
		}

	}
}