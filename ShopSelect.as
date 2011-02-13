package {
	import org.flixel.*;

	/**
	 * ...
	 * @author crossin
	 */
	public class ShopSelect extends FlxGroup {
		protected var up:Upgrade;
		protected var index:uint;
		protected var indexItem:uint;
		protected var txtName:FlxText;
		protected var txtPrice:FlxText;
		protected var bgName:FlxSprite;
		protected var bgPrice:FlxSprite;
		protected var button:FlxButton;

		public function ShopSelect(i:uint){
			index = i;
			//var ssf:FlxPoint = new FlxPoint(0, 0);
			bgName = new FlxSprite(0, 0);
			bgName.createGraphic(24, 9, 0xff000000);
			//bgName.scrollFactor = ssf;
			add(bgName);
			bgPrice = new FlxSprite(0, 9);
			bgPrice.createGraphic(24, 9, 0xffffffff);
			//bgPrice.scrollFactor = ssf;
			add(bgPrice);
			txtName = new FlxText(-4, -2, 30, "");
			txtName.color = 0xffffffff;
			txtName.size = 8;
			txtName.alignment = "center";
			//txtName.scrollFactor = ssf;
			add(txtName);
			txtPrice = new FlxText(-4, 7, 30, "");
			txtPrice.color = 0xff000000;
			txtPrice.size = 8;
			txtPrice.alignment = "center";
			//txtPrice.scrollFactor = ssf;
			add(txtPrice);

			button = new FlxButton(0, 0, onCancel);
			button.loadGraphic((new FlxSprite()).createGraphic(24, 18, 0x00ffffff), (new FlxSprite()).createGraphic(24, 18, 0x66ffffff));
			add(button);

			//cover = new FlxSprite(0, 0);
			//cover.createGraphic(24, 18, 0x66000000);
			//cover.scrollFactor = ssf;
			//cover.visible = false;
			//add(cover);
			visible = false;
		}

		public function setValue(i:uint):void {
			indexItem = i;
			up = ShopState.upgradesAll[i];
			bgName.fill(up.colorName);
			bgPrice.fill(up.colorPrice);
			txtName.color = up.colorPrice;
			txtPrice.color = up.colorName;
			txtName.text = up.name;
			txtPrice.text = up.price.toString();
			visible = true;
		}

		protected function onCancel():void {
			visible = false;
			(FlxG.state as ShopState).cancelUpgrade(indexItem, index);
		}
	}

}