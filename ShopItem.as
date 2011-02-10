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
			bgName.createGraphic(32, 18, u.colorName);
			bgName.scrollFactor = ssf;
			add(bgName);
			var bgPrice:FlxSprite = new FlxSprite(32, 0);
			bgPrice.createGraphic(88, 18, u.colorPrice);
			bgPrice.scrollFactor = ssf;
			add(bgPrice);
			var txtName:FlxText = new FlxText(-5, -2, 40, u.name);
			txtName.color = u.colorPrice;
			txtName.size = 16;
			txtName.alignment = "center";
			txtName.scrollFactor = ssf;
			add(txtName);
			var txtPrice:FlxText = new FlxText(32, -2, 100, u.price.toString().concat("(+",u.increment,")"));
			txtPrice.color = u.colorName;
			txtPrice.size = 8;
			//txtPrice.alignment = "center";
			txtPrice.scrollFactor = ssf;
			add(txtPrice);
			
			var button:FlxButton = new FlxButton(0, 0, onSelect);
			button.loadGraphic((new FlxSprite()).createGraphic(120, 18, 0x00ffffff), (new FlxSprite()).createGraphic(120, 18, 0x66ffffff));
			add(button);
		}
		
		protected function onSelect():void {
			
		}
	}

}