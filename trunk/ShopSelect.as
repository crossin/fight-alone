package  
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author crossin
	 */
	public class ShopSelect extends FlxGroup 
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
		protected var button:FlxButton;
		protected var cover:FlxSprite;
		
		public function ShopSelect(u:Upgrade) 
		{
			var ssf:FlxPoint = new FlxPoint(0, 0);
			var bgName:FlxSprite = new FlxSprite(0, 0);
			bgName.createGraphic(24, 9, colorName);
			bgName.scrollFactor = ssf;
			add(bgName);
			var bgPrice:FlxSprite = new FlxSprite(0, 9);
			bgPrice.createGraphic(24, 9, colorPrice);
			bgPrice.scrollFactor = ssf;
			add(bgPrice);
			var txtName:FlxText = new FlxText(-4, -2, 30, up.name);
			txtName.color = colorPrice;
			txtName.size = 8;
			txtName.alignment = "center";
			txtName.scrollFactor = ssf;
			add(txtName);
			var txtPrice:FlxText = new FlxText(-4, 7, 30, "0");
			txtPrice.color = colorName;
			txtPrice.size = 8;
			txtPrice.alignment = "center";
			txtPrice.scrollFactor = ssf;
			add(txtPrice);
			
			button = new FlxButton(0, 0, onSelect);
			button.loadGraphic((new FlxSprite()).createGraphic(120, 18, 0x00ffffff), (new FlxSprite()).createGraphic(120, 18, 0x66ffffff));
			add(button);
			
			cover = new FlxSprite(0, 0);
			cover.createGraphic(120, 18, 0x66000000);
			cover.scrollFactor = ssf;
			cover.visible = false;
			add(cover);
		}
		
		protected function onSelect():void {
			button.visible = false;
			cover.visible = true;
		}
	}

}