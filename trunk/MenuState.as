package {
	import org.flixel.*;
	import org.flixel.data.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class MenuState extends FlxState {
		[Embed(source="res/crosshair.png")]
		private var ImgCursor:Class;
		[Embed(source="res/back.png")]
		private var ImgBack:Class;

		private var txtReplay:FlxText;
		//private var action:Class;
		private var delta:Number;

		private static var _save:FlxSave;
		private static var _loaded:Boolean = false;
		
		public function MenuState(){

			var back:FlxSprite = new FlxSprite(-200, -200, ImgBack);
			add(back);

			txtReplay = new FlxText(0, 400, 640, "Click to START ...");
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


			var txtTitle:FlxText = new FlxText(0, 130, 640, "BATTLE FRAME");
			txtTitle.size = 64;
			txtTitle.alignment = "center";
			add(txtTitle);
			//txtTitle = new FlxText(0, 200, 640, "2");
			//txtTitle.size = 96;
			//txtTitle.alignment = "center";
			//add(txtTitle);
			var txtName:FlxText = new FlxText(0, 100, 640, "A Crossin's Game");
			txtName.size = 16;
			txtName.alignment = "center";
			add(txtName);

			var txtHi:FlxText = new FlxText(0, 0, 640, "SCORE: ".concat(EndState.score));
			txtHi.size = 16;
			txtHi.alignment = "left";
			add(txtHi);

			var txtMute:FlxText = new FlxText(0, 0, 640, "'0' to MUTE");
			txtMute.size = 16;
			txtMute.alignment = "right";
			add(txtMute);

			delta = -0.03;

			FlxG.mouse.show(ImgCursor);
		}

		override public function update():void {
			// init kong stats api
			if (!FlxG.kong)
				(FlxG.kong = parent.addChild(new FlxKong()) as FlxKong).init();
				
			txtReplay.alpha += delta;
			delta = (txtReplay.alpha == 1 || txtReplay.alpha == 0) ? -delta : delta;

			if (FlxG.mouse.pressed()){
				FlxG.state = new PlayState();
			}
		}

		public static function load():void {
			_save = new FlxSave();
			_loaded = _save.bind("myScore");
			if (_loaded){
				if (_save.data.score == null){
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