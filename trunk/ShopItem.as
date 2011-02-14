package {
	import org.flixel.*;

	/**
	 * ...
	 * @author crossin
	 */
	public class ShopItem extends FlxGroup {
		[Embed(source="res/gold.png")]
		private var ImgBonus:Class;
		
		protected var up:Upgrade;
		protected var index:uint;
		protected var available:Boolean;
		protected var txtName:FlxText;
		protected var txtPrice:FlxText;
		protected var bgName:FlxSprite;
		protected var bgPrice:FlxSprite;
		protected var tagGold:FlxSprite;
		protected var button:FlxButton;
		protected var cover:FlxSprite;
		protected var price:String;

		public function ShopItem(i:uint){
			index = i;
			up = ShopState.upgradesAll[i];
			//var ssf:FlxPoint = new FlxPoint(0, 0);
			available = ShopState.upgradesBought[i];
			
			var colorName:uint;
			var colorPrice:uint;
			if (available) {
				colorName = up.colorName;
				colorPrice = up.colorPrice;
				price = up.price.toString().concat("(+", up.increment, ")");
			} else {
				colorName = 0xff999999;
				colorPrice = 0xffcccccc;
				price = "    ".concat(up.gold.toString());
			}
			bgName = new FlxSprite(0, 0);
			bgName.createGraphic(32, 18, colorName);
			//bgName.scrollFactor = ssf;
			add(bgName);
			bgPrice = new FlxSprite(32, 0);
			bgPrice.createGraphic(88, 18, colorPrice);
			//bgPrice.scrollFactor = ssf;
			add(bgPrice);
			txtName = new FlxText(-5, -2, 40, up.name);
			txtName.color = colorPrice;
			txtName.size = 16;
			txtName.alignment = "center";
			//txtName.scrollFactor = ssf;
			add(txtName);
			txtPrice = new FlxText(32, -2, 100, price);
			txtPrice.color = colorName;
			txtPrice.size = 8;
			//txtPrice.alignment = "center";
			//txtPrice.scrollFactor = ssf;
			add(txtPrice);
			
			tagGold = new FlxSprite(34, 2, ImgBonus);
			add(tagGold);

			button = new FlxButton(0, 0, onSelect);
			button.loadGraphic((new FlxSprite()).createGraphic(120, 18, 0x00ffffff), (new FlxSprite()).createGraphic(120, 18, 0x66ffffff));
			add(button);

			cover = new FlxSprite(0, 0);
			cover.createGraphic(120, 18, 0x66000000);
			//cover.scrollFactor = ssf;
			cover.visible = false;
			add(cover);
		}

		protected function onSelect():void {
			if (available) {
				(FlxG.state as ShopState).selectUpgrade(index);
			} else {
				if () {
					
				} else {
					
				}
			}

		}

		public function setValue(b:Boolean):void {
			button.visible = b;
			cover.visible = !b;
		}

	}

}