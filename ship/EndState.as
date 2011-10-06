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

		private var txtReplay:FlxText;
		//private var action:Class;
		private var delta:Number;

		private static var _save:FlxSave;
		private static var _loaded:Boolean = false;
		
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
			
			// new hi
			if (FlxG.score > FlxG.save) {
				FlxG.save = FlxG.score;
				_save.data.score = FlxG.save;
				// kong stats api
				FlxG.kong.API.stats.submitArray ( [ { name:"SCORE", value:FlxG.save } ] );
			}
			

			var txtScore:FlxText = new FlxText(0, 150, 640, "SCORE: ".concat(FlxG.score));
			txtScore.size = 32;
			txtScore.alignment = "center";
			add(txtScore);
			
			var txtHi:FlxText = new FlxText(0, 200, 640, "HI SCORE: ".concat(FlxG.save));
			txtHi.size = 32;
			txtHi.alignment = "center";
			add(txtHi);
			
			delta = -0.03;
			
			
			
			
			
			
			//var b:FlxButton;
			//var t1:FlxText;
			//var t2:FlxText;
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

			FlxG.mouse.show(ImgCursor);
		}

		override public function update():void {
			txtReplay.alpha += delta;
			delta = (txtReplay.alpha == 1 || txtReplay.alpha == 0) ? -delta : delta;
			
			if (FlxG.mouse.pressed()){
				FlxG.state = new PlayState();
			}
		}
		
		public static function load():void
		{
			_save = new FlxSave();
			_loaded = _save.bind("myScore");
			if (_loaded)
			{
				if (_save.data.score == null) {
					_save.data.score = 0;
				}
				FlxG.save = _save.data.score;
			}
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
	}
}