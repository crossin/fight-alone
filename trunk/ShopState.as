package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class ShopState extends FlxState {
		[Embed(source="res/cursor.png")]
		private var ImgCursor:Class;

		private var _title:FlxText;
		
		public var txtGold:FlxText;
		public var selects:Array;
		public var items:Array;

		//public static var upgrades:Array = [UpgradeMS, UpgradeAS];
		public static var upgrades:Array = [-1, -1, -1, -1, -1];
		public static var upgradesBought:Array = [false, false, false];
		public static var upgradesAll:Array = [new UpgradeMS, new UpgradeAS, new UpgradeMS];

		public function ShopState(){
			_title = new FlxText(0, 0, 320, "here is SHOP");
			_title.size = 12;
			_title.alignment = "center";
			_title.color = 0xffffff;
			//_title.antialiasing = true;
			add(_title);

			var b:FlxButton;
			var t1:FlxText;
			var t2:FlxText;
			// choose levels
			b = new FlxButton(135, 200, onOK);
			b.loadGraphic((new FlxSprite()).createGraphic(50, 30, 0xff3a5c39), (new FlxSprite()).createGraphic(50, 30, 0xff729954));
			t1 = new FlxText(0, 8, 48, "OK");
			t1.color = 0x729954;
			t1.size = 8;
			t1.alignment = "center";
			t2 = new FlxText(0, 8, 48, "OK");
			t2.color = 0xd8eba2;
			t2.size = 8;
			t2.alignment = "center";
			b.loadText(t1, t2);
			add(b);

			FlxG.score = 1000;
			txtGold = new FlxText(120, 20, 100, FlxG.score.toString());
			txtGold.size = 8;
			//txtGold.alignment = "center";
			txtGold.color = 0x999933;
			//txtGold.scrollFactor = ssf;
			add(txtGold);

			// items
			items = new Array();
			//var si:ShopItem;
			var i:uint;
			for (i = 0; i < upgradesAll.length; i++){
				//if (ShopState.upgrades[i]){
				items.push(new ShopItem(i));
				items[i].reset(30 + i % 2 * 140, 100 + int(i / 2) * 30);
				//u.scrollFactor = ssf;
				add(items[i]);
					//}
			}

			// select
			selects = new Array();
			//var ss:ShopSelect;
			var index:int;
			for (i = 0; i < 5; i++){
				index = upgrades[i];
				selects.push(new ShopSelect(i));
				selects[i].reset(30 + i * 30, 50);
				add(selects[i]);
				if (index >= 0){
					selectUpgrade2(index, i);
				}
			}

			FlxG.mouse.show(ImgCursor);
		}

		private function onOK():void {
			FlxG.flash.start(0xffd8eba2, 1);
			FlxG.fade.start(0xff131c1b, 1, onFade);
		}

		private function onFade():void {
			FlxG.state = new LevelState();
		}

		public function selectUpgrade2(i:uint, s:uint):void {
			upgrades[s] = i;
			selects[s].setValue(i);
			items[i].setValue(false);
		}

		public function selectUpgrade(i:uint):void {
			var s:uint;
			for (s = 0; s < 5; s++){
				if (upgrades[s] < 0){
					break;
				}
			}
			if (s == 5){
				return;
			}
			selectUpgrade2(i, s);
		}

		public function cancelUpgrade(i:uint, s:uint):void {
			upgrades[s] = -1;
			items[i].setValue(true);
		}
	}

}