package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class EndState extends FlxState {
		[Embed(source="res/crosshair.png")]
		private var ImgCursor:Class;
		[Embed(source="res/back.png")]
		private var ImgBack:Class;
		[Embed(source="res/up.png")]
		private var ImgUp:Class;

		private var txtReplay:FlxText;
		//private var action:Class;
		private var delta:Number;

		private static var _save:FlxSave;
		private static var _loaded:Boolean = false;

		public static var score:int;
		public static var score_max:int;
		public static var score_total:int;
		public static var time:Number;
		public static var time_max:Number;
		public static var time_total:Number;
		public static var kills:Number;
		public static var kills_max:Number;
		public static var kills_total:Number;

		private const price_speed:Array = [100, 200, 300, 400, 500];

		private var btn_speed:FlxButton;
		private var btn_rate:FlxButton;
		private var btn_power:FlxButton;
		private var btn_bombs:FlxButton;
		private var btn_lives:FlxButton;

		private var txt_speed:FlxText;
		private var txt_rate:FlxText;
		private var txt_power:FlxText;
		private var txt_bombs:FlxText;
		private var txt_lives:FlxText;
		
		private var txt_score:FlxText;

		public function EndState(){

			var back:FlxSprite = new FlxSprite(-200, -200, ImgBack);
			add(back);

			txtReplay = new FlxText(0, 400, 640, "Click to REPLAY ...");
			//action = MenuState;
			//index = id;
			//if (hasWin){
			//_title.text = "you win";
			//if ((index == LevelState.levelUnlock) && (index < LevelState.levelMax)){
			//LevelState.levelUnlock++;
			//}
			//}
			txtReplay.size = 24;
			txtReplay.alignment = "center";
			//_title.color = 0xffffff;
			//txtReplay.antialiasing = true;
			add(txtReplay);

			// total
			//score_total += score;
			//_save.data.score_total = score_total;
			time_total += time;
			_save.data.time_total = time_total;
			kills_total += kills;
			_save.data.kills_total = kills_total;
			// new max
			if (score > _save.data.score){
				_save.data.score = score;
					// kong stats api
					//FlxG.kong.API.stats.submitArray([{name: "SCORE", value: EndState.score_max}]);
			}
			if (time > time_max){
				time_max = time;
				_save.data.time_max = time_max;
			}
			if (kills > kills_max){
				kills_max = kills;
				_save.data.kills_max = kills_max;
			}

			var txtTemp:FlxText;
			// time
			txtTemp = new FlxText(0, 20, 200, "TIME\r".concat(int(time / 60)).concat("'").concat(int(time % 60)).concat("\"").concat(int((time - int(time)) * 100)));
			txtTemp.size = 16;
			txtTemp.alignment = "center";
			add(txtTemp);

			txtTemp = new FlxText(0, 70, 200, "MAX TIME\r".concat(int(time_max / 60)).concat("'").concat(int(time_max % 60)).concat("\"").concat(int((time_max - int(time_max)) * 100)));
			txtTemp.size = 16;
			txtTemp.alignment = "center";
			add(txtTemp);

			txtTemp = new FlxText(0, 120, 200, "TOTAL TIME\r".concat(int(time_total / 60)).concat("'").concat(int(time_total % 60)).concat("\"").concat(int((time_total - int(time_total)) * 100)));
			txtTemp.size = 16;
			txtTemp.alignment = "center";
			add(txtTemp);

			// score
			txt_score = new FlxText(200, 30, 240, "SCORE\r".concat(score));
			txt_score.size = 48;
			txt_score.alignment = "center";
			add(txt_score);

			//txtTemp = new FlxText(220, 70, 200, "MAX SCORE\r".concat(EndState.score_max));
			//txtTemp.size = 16;
			//txtTemp.alignment = "center";
			//add(txtTemp);
//
			//txtTemp = new FlxText(220, 120, 200, "TOTAL SCORE\r".concat(EndState.score_total));
			//txtTemp.size = 16;
			//txtTemp.alignment = "center";
			//add(txtTemp);

			// kills
			txtTemp = new FlxText(440, 20, 200, "KILLS\r".concat(EndState.kills));
			txtTemp.size = 16;
			txtTemp.alignment = "center";
			add(txtTemp);

			txtTemp = new FlxText(440, 70, 200, "MAX KILLS\r".concat(EndState.kills_max));
			txtTemp.size = 16;
			txtTemp.alignment = "center";
			add(txtTemp);

			txtTemp = new FlxText(440, 120, 200, "TOTAL KILLS\r".concat(EndState.kills_total));
			txtTemp.size = 16;
			txtTemp.alignment = "center";
			add(txtTemp);

			//upgrade
			var txtUpgrade:FlxText;
			txtUpgrade = new FlxText(0, 180, 200, "SPEED");
			txtUpgrade.size = 32;
			txtUpgrade.alignment = "right";
			add(txtUpgrade);

			txtUpgrade = new FlxText(0, 220, 200, "RATE");
			txtUpgrade.size = 32;
			txtUpgrade.alignment = "right";
			add(txtUpgrade);

			txtUpgrade = new FlxText(0, 260, 200, "POWER");
			txtUpgrade.size = 32;
			txtUpgrade.alignment = "right";
			add(txtUpgrade);

			txtUpgrade = new FlxText(0, 300, 200, "BOMBS");
			txtUpgrade.size = 32;
			txtUpgrade.alignment = "right";
			add(txtUpgrade);

			txtUpgrade = new FlxText(0, 340, 200, "LIVES");
			txtUpgrade.size = 32;
			txtUpgrade.alignment = "right";
			add(txtUpgrade);

			var item:FlxSprite;
			for (var i:int = 0; i < 5; i++){
				for (var j:int = 0; j < 5; j++){
					item = new FlxSprite(220 + j * 40, 185 + i * 40);
					item.createGraphic(20, 30, 0xff333333);
					add(item);
				}


			}


			//var b:FlxButton;
			//var t1:FlxText;
			//var t2:FlxText;
			var up1:FlxSprite;
			var up2:FlxSprite;
			up1 = new FlxSprite(0, 0, ImgUp);
			up2 = new FlxSprite(0, 0, ImgUp);
			up2.color = 0xffcccccc;
			btn_speed = new FlxButton(550, 185, onSpeed);
			btn_speed.loadGraphic(up1, up2);
			add(btn_speed);
			up1 = new FlxSprite(0, 0, ImgUp);
			up2 = new FlxSprite(0, 0, ImgUp);
			up2.color = 0xffcccccc;
			btn_rate = new FlxButton(550, 225, onRate);
			btn_rate.loadGraphic(up1, up2);
			add(btn_rate);
			up1 = new FlxSprite(0, 0, ImgUp);
			up2 = new FlxSprite(0, 0, ImgUp);
			up2.color = 0xffcccccc;
			btn_power = new FlxButton(550, 265, onPower);
			btn_power.loadGraphic(up1, up2);
			add(btn_power);
			up1 = new FlxSprite(0, 0, ImgUp);
			up2 = new FlxSprite(0, 0, ImgUp);
			up2.color = 0xffcccccc;
			btn_bombs = new FlxButton(550, 305, onBombs);
			btn_bombs.loadGraphic(up1, up2);
			add(btn_bombs);
			up1 = new FlxSprite(0, 0, ImgUp);
			up2 = new FlxSprite(0, 0, ImgUp);
			up2.color = 0xffcccccc;
			btn_lives = new FlxButton(550, 345, onLives);
			btn_lives.loadGraphic(up1, up2);
			add(btn_lives);

			txt_speed = new FlxText(420, 180, 200, "0");
			txt_speed.size = 32;
			txt_speed.alignment = "left";
			txt_speed.color = 0xff333333;
			add(txt_speed);
			txt_rate = new FlxText(420, 220, 200, "0");
			txt_rate.size = 32;
			txt_rate.alignment = "left";
			txt_rate.color = 0xff333333;
			add(txt_rate);
			txt_power = new FlxText(420, 260, 200, "0");
			txt_power.size = 32;
			txt_power.alignment = "left";
			txt_power.color = 0xff333333;
			add(txt_power);
			txt_bombs = new FlxText(420, 300, 200, "0");
			txt_bombs.size = 32;
			txt_bombs.alignment = "left";
			txt_bombs.color = 0xff333333;
			add(txt_bombs);
			txt_lives = new FlxText(420, 340, 200, "0");
			txt_lives.size = 32;
			txt_lives.alignment = "left";
			txt_lives.color = 0xff333333;
			add(txt_lives);

			// choose levels
			//b = new FlxButton(40, 200, onLevels);
			//b.loadGraphic((new FlxSprite()).createGraphic(80, 12, 0x00000000));
			//t1 = new FlxText(0, 0, 80, "Levels");
			//t1.color = 0x672a02;
			//t1.shadow = 0xe3cba2;
			//t1.size = 8;
			//t1.alignment = "center";
			//t2 = new FlxText(0, 0, 80, "Levels");
			//t2.color = 0xe3cba2;
			//t2.shadow = 0x672a02;
			//t2.size = 8;
			//t2.alignment = "center";
			//b.loadText(t1, t2);
			//add(b);
			// replay
			//b = new FlxButton(120, 200, onReplay);
			//b.loadGraphic((new FlxSprite()).createGraphic(80, 12, 0x00000000));
			//t1 = new FlxText(0, 0, 80, "Replay");
			//t1.color = 0x672a02;
			//t1.shadow = 0xe3cba2;
			//t1.size = 8;
			//t1.alignment = "center";
			//t2 = new FlxText(0, 0, 80, "Replay");
			//t2.color = 0xe3cba2;
			//t2.shadow = 0x672a02;
			//t2.size = 8;
			//t2.alignment = "center";
			//b.loadText(t1, t2);
			//add(b);
			// next level
			//if (index < LevelState.levelUnlock){
			//b = new FlxButton(200, 200, onNext);
			//b.loadGraphic((new FlxSprite()).createGraphic(80, 12, 0x00000000));
			//t1 = new FlxText(0, 0, 80, "Next");
			//t1.color = 0x672a02;
			//t1.shadow = 0xe3cba2;
			//t1.size = 8;
			//t1.alignment = "center";
			//t2 = new FlxText(0, 0, 80, "Next");
			//t2.color = 0xe3cba2;
			//t2.shadow = 0x672a02;
			//t2.size = 8;
			//t2.alignment = "center";
			//b.loadText(t1, t2);
			//add(b);
			//}
			// shop
			//b = new FlxButton(135, 190, onShop);
			//b.loadGraphic((new FlxSprite()).createGraphic(50, 30, 0xff3a5c39), (new FlxSprite()).createGraphic(50, 30, 0xff729954));
			//t1 = new FlxText(0, 8, 48, "Shop");
			//t1.color = 0x729954;
			//t1.size = 8;
			//t1.alignment = "center";
			//t2 = new FlxText(0, 8, 48, "Shop");
			//t2.color = 0xd8eba2;
			//t2.size = 8;
			//t2.alignment = "center";
			//b.loadText(t1, t2);
			//add(b);
			delta = -0.03;
			FlxG.mouse.show(ImgCursor);
		}

		override public function update():void {
			txtReplay.alpha += delta;
			delta = (txtReplay.alpha == 1 || txtReplay.alpha == 0) ? -delta : delta;

			txt_speed.text = price_speed[Ship.speed];
			if (score >= price_speed[Ship.speed]){
				txt_speed.color = 0xffffffff;
				btn_speed.visible = true;
			} else {
				txt_speed.color = 0xff333333;
				btn_speed.visible = false;
			}

			txt_score.text = "SCORE\r".concat(score);
			
			super.update();
			//if (FlxG.mouse.pressed()){
			//FlxG.state = new PlayState();
			//}
		}

		public static function load():void {
			_save = new FlxSave();
			_loaded = _save.bind("myScore");
			if (_loaded){
				if (_save.data.score == null){
					_save.data.score = 0;
				}
				score = _save.data.score;
				//time
				if (_save.data.time_max == null){
					_save.data.time_max = 0;
				}
				if (_save.data.time_total == null){
					_save.data.time_total = 0;
				}
				time_max = _save.data.time_max;
				time_total = _save.data.time_total;
				//kills
				if (_save.data.kills_max == null){
					_save.data.kills_max = 0;
				}
				if (_save.data.kills_total == null){
					_save.data.kills_total = 0;
				}
				kills_max = _save.data.kills_max;
				kills_total = _save.data.kills_total;
			}
			time = 0;
			kills = 0;
		}

		//private function onLevels():void {
		//FlxG.flash.start(0xffe3cba2, 1);
		//FlxG.fade.start(0xff1e150f, 1, onLevelsFade);
		//}
//
		//private function onLevelsFade():void {
		//FlxG.state = new LevelState();
		//}
//
		//private function onReplay():void {
		//FlxG.flash.start(0xffe3cba2, 1);
		//FlxG.fade.start(0xff1e150f, 1, onReplayFade);
		//}
//
		//private function onReplayFade():void {
		//FlxG.state = new LevelState.levels[index - 1];
		//}
//
		//private function onNext():void {
		//FlxG.flash.start(0xffe3cba2, 1);
		//FlxG.fade.start(0xff1e150f, 1, onNextFade);
		//}
//
		//private function onNextFade():void {
		//if (index < LevelState.levelMax){
		//FlxG.state = new LevelState.levels[index];
		//} else {
		//FlxG.state = new ClearState();
		//}
		//}

		//private function onShop():void {
		//FlxG.flash.start(0xffd8eba2, 1);
		//FlxG.fade.start(0xff131c1b, 1, onShopFade);
		//}
		//private function onShopFade():void {
		//FlxG.state = new ShopState();
		//}

		private function onSpeed():void {
			score -= price_speed[Ship.speed];
			Ship.speed ++;
		}

		private function onRate():void {

		}

		private function onPower():void {

		}

		private function onBombs():void {

		}

		private function onLives():void {

		}
	}
}