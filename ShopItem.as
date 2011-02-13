package {
	import org.flixel.*;

	/**
	 * ...
	 * @author crossin
	 */
	public class ShopItem extends FlxGroup {
		protected var up:Upgrade;
		protected var index:uint;
		protected var available:Boolean;
		protected var txtName:FlxText;
		protected var txtPrice:FlxText;
		protected var bgName:FlxSprite;
		protected var bgPrice:FlxSprite;
		protected var button:FlxButton;
		protected var cover:FlxSprite;

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
			}else {
				colorName = ;
				 colorPrice = 
			}
			bgName = new FlxSprite(0, 0);
			bgName.createGraphic(32, 18, up.colorName);
			//bgName.scrollFactor = ssf;
			add(bgName);
			bgPrice = new FlxSprite(32, 0);
			bgPrice.createGraphic(88, 18, up.colorPrice);
			//bgPrice.scrollFactor = ssf;
			add(bgPrice);
			txtName = new FlxText(-5, -2, 40, up.name);
			txtName.color = up.colorPrice;
			txtName.size = 16;
			txtName.alignment = "center";
			//txtName.scrollFactor = ssf;
			add(txtName);
			txtPrice = new FlxText(32, -2, 100, up.price.toString().concat("(+", up.increment, ")"));
			txtPrice.color = up.colorName;
			txtPrice.size = 8;
			//txtPrice.alignment = "center";
			//txtPrice.scrollFactor = ssf;
			add(txtPrice);

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
			(FlxG.state as ShopState).selectUpgrade(index);
		}

		public function setValue(b:Boolean):void {
			button.visible = b;
			cover.visible = !b;
		}

	}

}