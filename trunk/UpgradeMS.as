package {
	import flash.geom.Point;
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class UpgradeMS extends Upgrade {

		public function UpgradeMS(){
			super();
			price = 100;
			increment = 50;
			bgName.fill(0xffcc0000);
			bgPrice.fill(0xffffcccc);
			txtName.text = "MS";
			txtName.color = 0xffcccc;
			txtPrice.text = price.toString();
			txtPrice.color = 0xcc0000;
		}

	}
}