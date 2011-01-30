package {
	import flash.geom.Point;
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class Upgrade extends FlxGroup {
		private var txtName:FlxText;
		private var txtPrice:FlxText;
		private var bgName:FlxSprite;
		private var bgPrice:FlxSprite;

		public function Upgrade(){
			super();
			var ssf:FlxPoint = new FlxPoint(0, 0);
			bgName = new FlxSprite(0, 0);
			bgName.createGraphic(24, 8, 0xffcc0000);
			bgName.scrollFactor = ssf;
			add(bgName);
			bgPrice = new FlxSprite(0, 8);
			bgPrice.createGraphic(24, 8, 0xffffcccc);
			bgPrice.scrollFactor = ssf;
			add(bgPrice);
			txtName = new FlxText(-4, -2, 30, "MS");
			txtName.size = 8;
			txtName.alignment = "center";
			txtName.scrollFactor = ssf;
			add(txtName);
			txtPrice = new FlxText( -4, 5, 30, "9999");
			txtPrice.color = 0xcc0000;
			txtPrice.size = 8;
			txtPrice.alignment = "center";
			txtPrice.scrollFactor = ssf;
			add(txtPrice);
		}

	}
}