package {
	import flash.geom.Point;
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class Upgrade extends FlxGroup {
		protected var txtName:FlxText;
		protected var txtPrice:FlxText;
		protected var bgName:FlxSprite;
		protected var bgPrice:FlxSprite;
		protected var price:int;
		protected var increment:int;

		public function Upgrade(){
			super();
			price = 0;
			increment = 0;
			var ssf:FlxPoint = new FlxPoint(0, 0);
			bgName = new FlxSprite(0, 0);
			bgName.createGraphic(24, 8, 0xff000000);
			bgName.scrollFactor = ssf;
			add(bgName);
			bgPrice = new FlxSprite(0, 8);
			bgPrice.createGraphic(24, 8, 0xffffffff);
			bgPrice.scrollFactor = ssf;
			add(bgPrice);
			txtName = new FlxText( -4, -2, 30, "UP");
			txtName.color = 0xffffff;
			txtName.size = 8;
			txtName.alignment = "center";
			txtName.scrollFactor = ssf;
			add(txtName);
			txtPrice = new FlxText( -4, 5, 30, "0");
			txtPrice.color = 0x000000;
			txtPrice.size = 8;
			txtPrice.alignment = "center";
			txtPrice.scrollFactor = ssf;
			add(txtPrice);
		}

	}
}