package  
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author crossin
	 */
	public class ShopItem extends FlxGroup 
	{
		//protected var txtName:FlxText;
		//protected var bgName:FlxSprite;
		//protected var fore:FlxSprite;
		//protected var available:Boolean;
		//protected var up:Upgrade;
		//protected var name:String;
		//protected var price:int;
		//protected var increment:int;
		//protected var colorName:uint;
		//protected var colorPrice:uint;
		
		public function ShopItem(u:Upgrade) 
		{
			var ssf:FlxPoint = new FlxPoint(0, 0);
			var bgName:FlxSprite = new FlxSprite(0, 0);
			bgName.createGraphic(48, 18, u.colorName);
			bgName.scrollFactor = ssf;
			add(bgName);
			var txtName:FlxText = new FlxText(-5, -2, 56, u.name);
			txtName.color = u.colorPrice;
			txtName.size = 16;
			txtName.alignment = "center";
			txtName.scrollFactor = ssf;
			add(txtName);
			var txtPrice:FlxText = new FlxText(60, -2, 100, u.price.toString().concat("(+",u.increment,")"));
			txtPrice.color = 0xffffff;
			txtPrice.size = 16;
			//txtPrice.alignment = "center";
			txtPrice.scrollFactor = ssf;
			add(txtPrice);
		}
		
	}

}