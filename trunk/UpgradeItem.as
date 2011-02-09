package  
{
	import org.flixel.FlxGroup;
	
	/**
	 * ...
	 * @author crossin
	 */
	public class UpgradeItem extends FlxGroup 
	{
		protected var txtName:FlxText;
		protected var txtPrice:FlxText;
		protected var bgName:FlxSprite;
		protected var bgPrice:FlxSprite;
		protected var fore:FlxSprite;
		protected var available:Boolean;
		protected var up:Upgrade;
		protected var key:String;
		protected var level:uint;
		protected var name:String;
		protected var price:int;
		protected var increment:int;
		protected var colorName:uint;
		protected var colorPrice:uint;
		public function UpgradeItem(u:Upgrade, k:uint) 
		{
			super();
			price = 0;
			increment = 0;
			level = 0;
			available = false;
			colorName = 0xff000000;
			colorPrice = 0xffffffff;
			var ssf:FlxPoint = new FlxPoint(0, 0);
			var bg:FlxSprite = new FlxSprite(0, 0);
			bg.createGraphic(24, 18, 0xff333333);
			bg.scrollFactor = ssf;
			add(bg);

			bgName = new FlxSprite(0, 0);
			bgName.createGraphic(24, 9, colorName);
			bgName.scrollFactor = ssf;
			add(bgName);
			bgPrice = new FlxSprite(0, 9);
			bgPrice.createGraphic(24, 9, colorPrice);
			bgPrice.scrollFactor = ssf;
			add(bgPrice);
			txtName = new FlxText(-4, -2, 30, "UP");
			txtName.color = 0xffffff;
			txtName.size = 8;
			txtName.alignment = "center";
			txtName.scrollFactor = ssf;
			add(txtName);
			txtPrice = new FlxText(-4, 7, 30, "0");
			txtPrice.color = 0x000000;
			txtPrice.size = 8;
			txtPrice.alignment = "center";
			txtPrice.scrollFactor = ssf;
			add(txtPrice);

			fore = new FlxSprite(0, 0);
			fore.createGraphic(24, 18, 0xffcccccc);
			fore.scrollFactor = ssf;
			fore.visible = false;
			//fore.alpha = 0.5;
			add(fore);

			bgName.alpha = 0.3;
			bgPrice.alpha = 0.3;
			txtName.alpha = 0.3;
			txtPrice.alpha = 0.3;

			switch (k){
				case 1:
					key = "ONE";
					break;
				case 2:
					key = "TWO";
					break;
				case 3:
					key = "THREE";
					break;
				case 4:
					key = "FOUR";
					break;
				case 5:
					key = "FIVE";
					break;
			}
		}
		
		override public function update():void {
			super.update();
			if (fore.flickering()){
				return;
			}
			txtPrice.text = price.toString();
			if (!available && (FlxG.state as PlayState).score >= price){
				available = true;
				bgName.fill(colorName);
				bgPrice.fill(colorPrice);
				bgName.alpha = 1;
				bgPrice.alpha = 1;
				txtName.alpha = 1;
				txtPrice.alpha = 1;
			} else if (available && (FlxG.state as PlayState).score < price){
				available = false;
				bgName.fill(colorName);
				bgPrice.fill(colorPrice);
				bgName.alpha = 0.3;
				bgPrice.alpha = 0.3;
				txtName.alpha = 0.3;
				txtPrice.alpha = 0.3;
			}

			if (available && FlxG.keys.justPressed(key)){
				//bgName.flicker();
				//bgPrice.flicker();
				//txtName.flicker();
				//txtPrice.flicker();
				fore.visible = true;
				fore.flicker(0.5);
				(FlxG.state as PlayState).score -= price;
				level++;
				price += increment;
				price = (price > 9999) ? 9999 : price;
				doEffect();
			}

			if (fore.visible){
				fore.visible = false;
			}
		}
	}

}