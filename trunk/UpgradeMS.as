package {
	import flash.geom.Point;
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class UpgradeMS extends Upgrade {

		public function UpgradeMS(k:uint){
			super(k);
			price = 100;
			increment = 50;
			colorName = 0xffcc0000;
			colorPrice = 0xffffcccc;
			bgName.fill(colorName);
			bgPrice.fill(colorPrice);	
			txtName.text = "MS";
			txtName.color = 0xffcccc;
			txtPrice.text = price.toString();
			txtPrice.color = 0xcc0000;
		}

	}
}