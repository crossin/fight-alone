package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class MenuState extends FlxState {
		[Embed(source="res/cursor.png")]
		private var ImgCursor:Class;
		[Embed(source="res/title.png")]
		private var ImgTitle:Class;
		[Embed(source="res/back_mud.png")]
		private var ImgBack:Class;
		[Embed(source="res/tank_plain.png")]
		private var ImgTank:Class;
		[Embed(source="res/battery_plain.png")]
		private var ImgBattery:Class;
		[Embed(source="res/tank_shadow.png")]
		private var ImgShadow:Class;
		
		//private var _title:FlxText;

		public function MenuState(){
			//_title = new FlxText(0, FlxG.height / 3, 320, "TanKe");
			//_title.size = 64;
			//_title.alignment = "center";
			//_title.color = 0xffffff;
			//_title.antialiasing = true;
			//add(_title);

			var back:FlxTileblock;
			back = new FlxTileblock(0, 0, FlxG.width, FlxG.height);
			back.loadGraphic(ImgBack);
			add(back);

			var bg:FlxSprite = new FlxSprite(0, 0, ImgTitle);
			add(bg);
			
			var tank:FlxSprite;
			tank = new FlxSprite(21, 201, ImgShadow);
			add(tank);
			tank = new FlxSprite(20, 200);
			tank.loadGraphic(ImgTank, true);
			tank.addAnimation("move", [0, 1], 12);
			tank.play("move");
			add(tank);
			tank = new FlxSprite(20, 200);
			tank.loadGraphic(ImgBattery, true);
			tank.angle = -90;
			add(tank);

			var b:FlxButton;
			var t1:FlxText;
			var t2:FlxText;
			// quick start
			b = new FlxButton((FlxG.width - 80) / 2, 140, onStart);
			b.loadGraphic((new FlxSprite()).createGraphic(80, 12, 0x00000000));
			t1 = new FlxText(0, 0, 80, "QUICK PLAY");
			t1.color = 0x672a02;
			t1.shadow = 0xe3cba2;
			t1.size = 8;
			t1.alignment = "center";
			t2 = new FlxText(0, 0, 80, "QUICK PLAY");
			t2.color = 0xe3cba2;
			t2.shadow = 0x672a02;
			t2.size = 8;
			t2.alignment = "center";
			b.loadText(t1, t2);
			add(b);
			// choose levels
			b = new FlxButton((FlxG.width - 80) / 2, 155, onLevel);
			b.loadGraphic((new FlxSprite()).createGraphic(80, 12, 0x00000000));
			t1 = new FlxText(0, 0, 80, "LEVELS");
			t1.color = 0x672a02;
			t1.shadow = 0xe3cba2;
			t1.size = 8;
			t1.alignment = "center";
			t2 = new FlxText(0, 0, 80, "LEVELS");
			t2.color = 0xe3cba2;
			t2.shadow = 0x672a02;
			t2.size = 8;
			t2.alignment = "center";
			b.loadText(t1, t2);
			add(b);

			FlxG.mouse.show(ImgCursor);
		}

		//override public function update():void {
		//if (FlxG.mouse.justPressed()){
		//FlxG.flash.start(0xffe3cba2, 1);
		//FlxG.fade.start(0xff1e150f, 1, onFade);
		//}
		//}

		private function onStart():void {
			FlxG.flash.start(0xffe3cba2, 1);
			FlxG.fade.start(0xff1e150f, 1, onStartFade);
		}

		private function onStartFade():void {
			FlxG.state = new LevelState.levels[LevelState.levelUnlock - 1];
		}

		private function onLevel():void {
			FlxG.flash.start(0xffe3cba2, 1);
			FlxG.fade.start(0xff1e150f, 1, onLevelFade);
		}

		private function onLevelFade():void {
			//FlxG.state = new EndState(true,1);
			FlxG.state = new LevelState();
		}
	}

}