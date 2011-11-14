package {
	import org.flixel.*;

	public class PlayState extends FlxState {
		[Embed(source="res/crosshair.png")]
		private var ImgCursor:Class;
		//[Embed(source="res/heart.png")]
		//private var ImgHeart:Class;
		//[Embed(source="res/flag.png")]
		//private var ImgFlag:Class;
		[Embed(source="res/gibs_white.png")]
		private var ImgGibs:Class;
		[Embed(source="res/gibs_ship.png")]
		private var ImgGibsShip:Class;
		[Embed(source="res/gibs_rect.png")]
		private var ImgGibsRect:Class;
		[Embed(source="res/gibs_arrow.png")]
		private var ImgGibsArrow:Class;
		[Embed(source="res/gibs_dart.png")]
		private var ImgGibsDart:Class;
		[Embed(source="res/gibs_luna.png")]
		private var ImgGibsLuna:Class;
		[Embed(source="res/gibs_shuttle.png")]
		private var ImgGibsShuttle:Class;
		[Embed(source="res/gibs_circle.png")]
		private var ImgGibsCircle:Class;
		[Embed(source="res/gibs_cross.png")]
		private var ImgGibsCross:Class;
		[Embed(source="res/gibs_splinter.png")]
		private var ImgGibsSplinter:Class;
		[Embed(source="res/gibs_charge.png")]
		private var ImgGibsCharge:Class;
		[Embed(source="res/gibs_barrage.png")]
		private var ImgGibsBarrage:Class;
		//[Embed(source="res/upgrade.png")]
		//private var ImgUpgrade:Class;
		[Embed(source="res/back1.png")]
		private var ImgBack1:Class;
		[Embed(source="res/back2.png")]
		private var ImgBack2:Class;
		[Embed(source="res/back3.png")]
		private var ImgBack3:Class;
		[Embed(source="res/bomb.png")]
		private var ImgBomb:Class;
		[Embed(source="res/life.png")]
		private var ImgLife:Class;
		//[Embed(source="res/shield.png")]
		//private var ImgShield:Class;
		[Embed(source="res/sound/bgm.mp3")]
		private var SndBgm:Class;

		public var ship:Ship;
		//public var shield:Shield;
		//public var upEffect:UpEffect;
		//public static var _battery:Battery;
		public static var _bullets:FlxGroup;
		public var _scraps:FlxGroup;
		//public static var _bulletsSmall:FlxGroup;
		//public static var _lifeBar:FlxSprite;
		//public static var progressBar:FlxSprite;
		//public static var _enemyLifeBar:FlxSprite;
		//public static var _enemyLifeBarBack:FlxSprite;
		//public static var _enemyBullets:FlxGroup;
		public static var maxWidth:int;
		public static var maxHeight:int;
		//public static var _explosions:FlxGroup;
		public static var _gibs:FlxEmitter;
		public static var gibsShip:FlxEmitter;
		public static var gibsRect:FlxEmitter;
		public static var gibsArrow:FlxEmitter;
		public static var gibsDart:FlxEmitter;
		public static var gibsLuna:FlxEmitter;
		public static var gibsShuttle:FlxEmitter;
		public static var gibsCircle:FlxEmitter;
		public static var gibsCross:FlxEmitter;
		public static var gibsSplinter:FlxEmitter;
		public static var gibsCharge:FlxEmitter;
		public static var gibsBarrage:FlxEmitter;

		//public var _explosionIndex:uint;

		public var _enemies:FlxGroup;
		//protected var _objects:FlxGroup;
		//protected var _rock:Box;
		//protected var back:FlxTileblock;
		public var blocks:FlxGroup;
		//protected var bonuses:FlxGroup;
		//protected var base:FlxSprite;
		//protected var _boss:FlxSprite;
		protected var _timer:Number;
		protected var _timerLast:Number;
		protected var _timerInterval:Number;
		protected var _timerEnd:Number;
		//protected var enemyCount:uint;
		//protected var progress:Number;
		//protected var hasWin:Boolean;
		protected var txtScore:FlxText;
		//protected var txtGold:FlxText;
		//protected var index:uint;
		//protected var map:Array;
		//protected var startX:int;
		//protected var startY:int;
		protected var back1:FlxSprite;
		protected var back2:FlxSprite;
		protected var back3:FlxSprite;

		public static var lifeBoss:LifeBoss;

		//public var score:int;
		public var bombs:Array;
		public var lives:Array;
		public var tip:Tip;

		// blur
		private const _blur:Number = 0.3;
		private var _helper:FlxSprite;

		override public function create():void {
			//back
			maxWidth = 1200;
			maxHeight = 900;
			//back = new FlxTileblock(0, 0, maxWidth, maxHeight);
			//add(back);

			// hud
			var ssf:FlxPoint = new FlxPoint(0, 0);
			//var heart:FlxSprite = new FlxSprite(20, 10, ImgHeart);
			//heart.scrollFactor = ssf;
			//_lifeBar = new FlxSprite(heart.x + 13, heart.y + 2);FlxG.save
			//_lifeBar.createGraphic(50, 4);
			//_lifeBar.fill(0xfff29a7d);
			//_lifeBar.scrollFactor = ssf;
			//var flag:FlxSprite = new FlxSprite(240, 230, ImgFlag);
			//flag.scrollFactor = ssf;
			//progressBar = new FlxSprite(flag.x + 1, flag.y + 2);
			//progressBar.fill(0);
			//progressBar.scrollFactor = ssf;
			//_enemyLifeBar = new FlxSprite();
			//_enemyLifeBarBack = new FlxSprite();
			// upgrade panel
			//var upPanel:FlxSprite = new FlxSprite(5, 215, ImgUpgrade);
			//upPanel.scrollFactor = ssf;
			//score
			txtScore = new FlxText(0, 0, 640, "0");
			txtScore.size = 24;
			txtScore.alignment = "center";
			//txtScore.color = 0xf0f0f0;
			//txtScore.antialiasing = false;
			txtScore.scrollFactor = ssf;
			//txtScore.alpha = 0.5;
			//txtGold = new FlxText(120, 20, 100, EndState.score.toString());
			//txtGold.size = 8;
			//txtGold.alignment = "center";
			//txtGold.color = 0x999933;
			//txtGold.antialiasing = false;
			//txtGold.scrollFactor = ssf;

			back1 = new FlxSprite(0, 0, ImgBack1);
			add(back1);
			back2 = new FlxSprite(0, 0, ImgBack2);
			add(back2);
			back3 = new FlxSprite(0, 0, ImgBack3);
			add(back3);

			//_objects = new FlxGroup();

			//_explosions = new FlxGroup();
			//for (i = 0; i < 10; i++){
			//s = new Explosion();
			//s.width = 50;
			//s.height = 10;
			//s.offset.x = -31;
			//s.offset.y = -31;
			//s.exists = false;
			//_explosions.add(s);
			//}

			makeEmitter();

			//bonuses = new FlxGroup();
			//add(bonuses);

			blocks = new FlxGroup();
			add(blocks);
			//_objects.add(blocks);

			// to be overrided by every level
			makeScene();

			//base = new Base();
			//add(base);
			//_objects.add(base);

			var s:FlxSprite;
			_bullets = new FlxGroup();
			var i:int;
			for (i = 0; i < 48; i++){
				s = new Bullet();
				//s.width = 50;
				//s.height = 10;
				//s.offset.x = -31;
				//s.offset.y = -31;
				_bullets.add(s);
			}

			_scraps = new FlxGroup();
			for (i = 0; i < 64; i++){
				s = new Scrap();
				_scraps.add(s);
			}



			//_bulletsSmall = new FlxGroup();
			//for (i = 0; i < 64; i++){
			//s = new BulletSmall();
			//_bulletsSmall.add(s);
			//}
//
			//_enemyBullets = new FlxGroup();
			//for (i = 0; i < 64; i++){
			//s = new EnemyBullet();
			//_enemyBullets.add(s);
			//}

			//_battery = new Battery();
			ship = new Ship(400, 300);

			_enemies = new FlxGroup();
			//var enemy:Enemy;
			//for (i = 0; i < 1; i++){
			//enemy = new Enemy(_tank, _gibs, _enemyBullets.members, _enemyLifeBar, _enemyLifeBarBack);
			//s.exists = false;
			//_enemies.add(enemy);
			//}

			//shield = new Shield();
			//shield.exists = false;
			//_boss = new Boss(20);
			//_boss.exists = false;

			//upEffect = new UpEffect();

			//add(_enemyBullets);
			//add(_boss);
			add(ship);
			add(_bullets);
			add(_scraps);
			//add(_bulletsSmall);
			//add(_battery);
			add(_enemies);
			//add(shield);
			//add(_explosions);
			//add(_enemyLifeBarBack);
			//add(_enemyLifeBar);
			//add(upEffect);

			//add(heart);
			//add(_lifeBar);
			//add(flag);
			//add(progressBar);
			//add(upPanel);
			add(txtScore);
			//add(txtGold);

			//_objects.add(ship);
			//_objects.add(_enemies);

			//_objects.add(_rock);
			//_objects.add(_boss);

			bombs = new Array(5);
			for (i = 0; i < 5; i++){
				bombs[i] = new FlxSprite(620 - i * 20, 5, ImgBomb);
				bombs[i].scrollFactor = ssf;
				add(bombs[i]);
				if (i >= Ship.bombs){
					bombs[i].visible = false;
				}
			}
			lives = new Array(5);
			for (i = 0; i < 5; i++){
				lives[i] = new FlxSprite(5 + i * 20, 5, ImgLife);
				lives[i].scrollFactor = ssf;
				add(lives[i]);
				if (i >= Ship.lives){
					lives[i].visible = false;
				}
			}

			lifeBoss = new LifeBoss();
			add(lifeBoss);
			
			tip = new Tip();
			tip.scrollFactor = ssf;
			add(tip);

			FlxG.mouse.show(ImgCursor);
			FlxG.follow(ship, 3);
			//FlxG.followAdjust(0.5,0.0);
			FlxG.followBounds(0, 0, maxWidth, maxHeight);

			_timer = 0;
			_timerLast = 0;
			_timerInterval = 5;
			_timerEnd = 3;

			//EndState.score = 0;
			EndState.kills = 0;
			//EndState.time = 0;

			//_bulletIndex = 0;
			//_explosionIndex = 0;
			//enemyCount = 0;
			//progress = 0;
			//hasWin = false;
			//index = 0;
			//score = 0;

			// upgrades
			//var u:UpgradeItem;
			//var index:int;
			//for (i = 0; i < 5; i++){
			//index = ShopState.upgrades[i];
			//if (index >= 0){
			//u = new UpgradeItem(index, i + 1);
			//u.reset(49 + i * 25, 217);
			//u.scrollFactor = ssf;
			//add(u);
			//}
			//}

			_helper = new FlxSprite();
			_helper.createGraphic(FlxG.width, FlxG.height, 0xff000000, true);
			_helper.alpha = _blur;

			FlxG.playMusic(SndBgm, 0.7);
		}

		override public function update():void {
			//_enemyLifeBarBack.visible = false;
			//_enemyLifeBar.visible = false;

			txtScore.text = EndState.score.toString();
			//txtScore.text = "".concat(int(_timer / 60)).concat("'").concat(int(_timer % 60)).concat("\"").concat(int((_timer - int(_timer)) * 100))

			super.update();

			FlxU.overlap(_bullets, _enemies, overlapped);
			//FlxU.overlap(_bulletsSmall, _enemies, overlapped);
			//FlxU.overlap(_bullets, _boss, overlapped);
			//FlxU.overlap(_enemyBullets, ship, overlapped);
			//FlxU.overlap(_enemyBullets, _enemies, overlapped);
			//FlxU.overlap(_enemyBullets, _boss, overlapped);
			FlxU.overlap(_bullets, blocks, overlapped);
			FlxU.overlap(ship, _enemies, overlapped);
			FlxU.overlap(ship, _scraps, overlapped);
			FlxU.overlap(_scraps, blocks, overlapped);
			//FlxU.overlap(_bulletsSmall, blocks, overlapped);
			//FlxU.overlap(_enemyBullets, blocks, overlapped);
			//FlxU.overlap(_bullets, base, overlapped);
			//FlxU.overlap(_bulletsSmall, base, overlapped);
			//FlxU.overlap(_enemyBullets, base, overlapped);
			//FlxU.overlap(bonuses, ship, overlapped);
			//FlxU.overlap(_enemyBullets, shield, overlapped);
			//FlxU.collide(_objects, _objects);
			FlxU.collide(blocks, _enemies);
			FlxU.collide(blocks, ship);

			//if (FlxG.keys.justPressed("ONE")) {
			//_tank.setType(1)
			//}
			//if (FlxG.keys.TWO){
			//_tank.setType(2)
			//}

			// add enemies
			_timer += FlxG.elapsed;
			if (_timer < 120){
				addEnemy1();
			} else {
				addEnemy2();
			}
			_timerLast = _timer;

			// move background
			var w:int = FlxG.scroll.x + (maxWidth - FlxG.width) / 2;
			var h:int = FlxG.scroll.y + (maxHeight - FlxG.height) / 2;
			back3.x = -w;
			back3.y = -h;
			back2.x = -w / 2;
			back2.y = -h / 2;

			
			// check achievements
			 // kill 1
			 if (!AchieveState.wins[0] && EndState.kills >= 1) {
				 AchieveState.wins[0] = true;
				 tip.show();
			 }
			 
			 // kill 5
			 if (!AchieveState.wins[1] && EndState.kills >= 5) {
				 AchieveState.wins[1] = true;
				 tip.show();
			 }
			 
			 // kill 10
			 if (!AchieveState.wins[2] && EndState.kills + EndState.kills_total >= 10) {
				 AchieveState.wins[2] = true;
				 tip.show();
			 } 
				 
			 // survive 30 sec
			 if (!AchieveState.wins[3] && _timer >= 30) {
				 AchieveState.wins[3] = true;
				 tip.show();
			 } 
			 
			 // survive 3 sec
			 if (!AchieveState.wins[4] && _timer >= 3) {
				 AchieveState.wins[4] = true;
				 tip.show();
			 } 
			 
			 // play 30 sec
			 if (!AchieveState.wins[5] && ship.exists && EndState.time_total + _timer >= 15) {
				 AchieveState.wins[5] = true;
				 tip.show();
			 } 
				 
				 
			// check lose
			if (!ship.exists /*|| !base.active*/){
				//FlxG.music.volume -= 0.01;
				FlxG.music.stop();
				_timerEnd -= FlxG.elapsed;
				if (_timerEnd < 0){
					EndState.time = _timer - 3;
					EndState.calc();
					FlxG.state = new EndState();
				}
					//FlxG.fade.start(0xff1e150f, 2, onFade);
			}
		/*
		   for each (var eny:Enemy in _enemies.members) {
		   if (!eny.exists) {
		   _enemies.remove(eny, true);
		   }
		   }
		 */
			 //shield.angle = ship.angle;
			 //shield.x = ship.x + (ship.width - shield.width) / 2;
			 //shield.y = ship.y + (ship.height - shield.height) / 2;
			 

		}

		protected function overlapped(Object1:FlxObject, Object2:FlxObject):void {


			//if ((Object1 is Bullet) && ((Object1 as Bullet).owner == Object2)){
			//return;
			//}
			if (Object1 is Ship){
				Object1.hurt(1);
			} else {
				Object1.kill();
			}
			if (Object2 is Enemy){
				if ((Object2 is EnemyCross || Object2 is EnemyBoss)){
					if (!(Object1 is Ship)){
						Object2.hurt(1);
					}
				} else {
					Object2.kill();
				}
			}

			if (Object2 is Scrap){
				Object2.kill();
			}

			if (Object1 is Bullet && Object2 is Border){
				//FlxG.play(SndHit);
			}
			//if (!(Object1 is EnemyBullet) && ((Object2 is Enemy) || (Object2 is Boss))){
			//Object2.hurt((Object1 as Bullet).damage);
			//}
			//if (Object2 is Block){
			//Object2.hurt((Object1 as Bullet).damage);
			//}
			//if ((Object1 is EnemyBullet) && ((Object2 is Base) || (Object2 is Ship) || (Object2 is Shield))){
			//Object2.hurt((Object1 as Bullet).damage);
			//}
			//if ((Object1 is Bonus) && (Object2 is Ship)){
			// add gold
			//EndState.score += 1;
			//txtGold.text = EndState.score.toString();
			//(Object1 as Bonus).doEffect();
			//}
		}

		protected function addEnemy1():void {
			//if (_timer < 2 && _timer % 1 < _timerLast % 1){
				//_enemies.add(new EnemyBossBarrage());
				//_enemies.add(new EnemyCross());
			//}
			

			// rect
			if (_timer < 20 && _timer % 2 < _timerLast % 2){
				_enemies.add(new EnemyRect());
				_enemies.add(new EnemyRect());
			}

			// shuttle
			if (_timer > 20 && _timer < 40 && _timer % 3 < _timerLast % 3){
				_enemies.add(new EnemyShuttle());
				_enemies.add(new EnemyShuttle());
			}
			// circle
			if (_timer > 40 && _timer < 60 && _timer % 3 < _timerLast % 3){
				_enemies.add(new EnemyCircle());
				_enemies.add(new EnemyCircle());
			}
			// dart
			if (_timer > 60 && _timer < 80 && _timer % 4 < _timerLast % 4){
				_enemies.add(new EnemyDart(0));
				_enemies.add(new EnemyDart(1));
				_enemies.add(new EnemyDart(2));
				_enemies.add(new EnemyDart(3));
			}
			// luna
			if (_timer > 80 && _timer < 100 && _timer % 3 < _timerLast % 3){
				_enemies.add(new EnemyLuna());
				_enemies.add(new EnemyLuna());
			}
			// arrow
			if (_timer % 30 < _timerLast % 30){
				for (var i:int = 0; i < 22; i++){
					_enemies.add(new EnemyArrow(2, i));
				}
				for (i = 0; i < 16; i++){
					_enemies.add(new EnemyArrow(3, i));
				}
			}
			// cross
			if (_timer % 50 < _timerLast % 50){
				_enemies.add(new EnemyCross());
				_enemies.add(new EnemyCross());
			}
			
		}

		protected function addEnemy2():void {
			// rect
			if (_timer % 2 < _timerLast % 2){
				_enemies.add(new EnemyRect());
			}
			// luna
			if (_timer % 5 < _timerLast % 5){
				_enemies.add(new EnemyLuna());
			}
			// shuttle
			if (_timer % 6 < _timerLast % 6){
				_enemies.add(new EnemyShuttle());
			}
			// circle
			if (_timer % 7 < _timerLast % 7){
				_enemies.add(new EnemyCircle());
			}
			// dart
			if (_timer % 9 < _timerLast % 9){
				_enemies.add(new EnemyDart(0));
				_enemies.add(new EnemyDart(1));
				_enemies.add(new EnemyDart(2));
				_enemies.add(new EnemyDart(3));
			}
			// arrow
			if (_timer % 23 < _timerLast % 23){
				for (var i:int = 0; i < 22; i++){
					_enemies.add(new EnemyArrow(0, i));
				}
			}
			if (_timer % 29 < _timerLast % 29){
				for (i = 0; i < 16; i++){
					_enemies.add(new EnemyArrow(1, i));
				}
			}
			if (_timer % 31 < _timerLast % 31){
				for (i = 0; i < 22; i++){
					_enemies.add(new EnemyArrow(2, i));
				}
			}
			if (_timer % 43 < _timerLast % 43){
				for (i = 0; i < 16; i++){
					_enemies.add(new EnemyArrow(3, i));
				}
			}
			// cross
			if (_timer % 15 < _timerLast % 15){
				_enemies.add(new EnemyCross());
			}
		}

		protected function makeEmitter():void {
			_gibs = new FlxEmitter();
			_gibs.setXSpeed(-300, 300);
			_gibs.setYSpeed(-300, 300);
			//_gibs.setRotation(0,50);
			//_gibs.setSize(10, 10);
			_gibs.gravity = 0;
			_gibs.particleDrag.x = 100;
			_gibs.particleDrag.y = 100;
			_gibs.createSprites(ImgGibs, 100, 0, false);
			add(_gibs);
			//_objects.add(_gibs);

			gibsShip = new FlxEmitter();
			gibsShip.setXSpeed(-700, 700);
			gibsShip.setYSpeed(-700, 700);
			gibsShip.gravity = 0;
			gibsShip.particleDrag.x = 100;
			gibsShip.particleDrag.y = 100;
			gibsShip.createSprites(ImgGibsShip, 50, 0, false);
			add(gibsShip);

			gibsRect = new FlxEmitter();
			gibsRect.setXSpeed(-500, 500);
			gibsRect.setYSpeed(-500, 500);
			gibsRect.gravity = 0;
			gibsRect.particleDrag.x = 100;
			gibsRect.particleDrag.y = 100;
			gibsRect.createSprites(ImgGibsRect, 100, 0, false);
			add(gibsRect);

			gibsArrow = new FlxEmitter();
			gibsArrow.setXSpeed(-500, 500);
			gibsArrow.setYSpeed(-500, 500);
			gibsArrow.gravity = 0;
			gibsArrow.particleDrag.x = 100;
			gibsArrow.particleDrag.y = 100;
			gibsArrow.createSprites(ImgGibsArrow, 100, 0, false);
			add(gibsArrow);

			gibsDart = new FlxEmitter();
			gibsDart.setXSpeed(-500, 500);
			gibsDart.setYSpeed(-500, 500);
			gibsDart.gravity = 0;
			gibsDart.particleDrag.x = 100;
			gibsDart.particleDrag.y = 100;
			gibsDart.createSprites(ImgGibsDart, 100, 0, false);
			add(gibsDart);

			gibsLuna = new FlxEmitter();
			gibsLuna.setXSpeed(-500, 500);
			gibsLuna.setYSpeed(-500, 500);
			gibsLuna.gravity = 0;
			gibsLuna.particleDrag.x = 100;
			gibsLuna.particleDrag.y = 100;
			gibsLuna.createSprites(ImgGibsLuna, 100, 0, false);
			add(gibsLuna);

			gibsShuttle = new FlxEmitter();
			gibsShuttle.setXSpeed(-500, 500);
			gibsShuttle.setYSpeed(-500, 500);
			gibsShuttle.gravity = 0;
			gibsShuttle.particleDrag.x = 100;
			gibsShuttle.particleDrag.y = 100;
			gibsShuttle.createSprites(ImgGibsShuttle, 100, 0, false);
			add(gibsShuttle);

			gibsCircle = new FlxEmitter();
			gibsCircle.setXSpeed(-500, 500);
			gibsCircle.setYSpeed(-500, 500);
			gibsCircle.gravity = 0;
			gibsCircle.particleDrag.x = 100;
			gibsCircle.particleDrag.y = 100;
			gibsCircle.createSprites(ImgGibsCircle, 100, 0, false);
			add(gibsCircle);

			gibsCross = new FlxEmitter();
			gibsCross.setXSpeed(-500, 500);
			gibsCross.setYSpeed(-500, 500);
			gibsCross.gravity = 0;
			gibsCross.particleDrag.x = 100;
			gibsCross.particleDrag.y = 100;
			gibsCross.createSprites(ImgGibsCross, 100, 0, false);
			add(gibsCross);

			gibsSplinter = new FlxEmitter();
			gibsSplinter.setXSpeed(-500, 500);
			gibsSplinter.setYSpeed(-500, 500);
			gibsSplinter.gravity = 0;
			gibsSplinter.particleDrag.x = 100;
			gibsSplinter.particleDrag.y = 100;
			gibsSplinter.createSprites(ImgGibsSplinter, 100, 0, false);
			add(gibsSplinter);

			gibsCharge = new FlxEmitter();
			gibsCharge.setXSpeed(-700, 700);
			gibsCharge.setYSpeed(-700, 700);
			gibsCharge.gravity = 0;
			//gibsCharge.particleDrag.x = 100;
			//gibsCharge.particleDrag.y = 100;
			gibsCharge.createSprites(ImgGibsCharge, 50, 0, false);
			add(gibsCharge);

			gibsBarrage = new FlxEmitter();
			gibsBarrage.setXSpeed(-700, 700);
			gibsBarrage.setYSpeed(-700, 700);
			gibsBarrage.gravity = 0;
			//gibsBarrage.particleDrag.x = 100;
			//gibsBarrage.particleDrag.y = 100;
			gibsBarrage.createSprites(ImgGibsBarrage, 100, 0, false);
			add(gibsBarrage);
		}

		protected function makeScene():void {
			var border:Border;
			border = new Border(51, 43, 1);
			blocks.add(border);
			border = new Border(1149, 51, 2);
			blocks.add(border);
			border = new Border(51, 849, 3);
			blocks.add(border);
			border = new Border(43, 51, 4);
			blocks.add(border);
		}

		private function onFade():void {
			//FlxG.state = new EndState(hasWin, index);
		}

		//public function dropBonus(iX:int, iY:int):void {
		//var ran:Number = FlxU.random();
		//if (ran < 0.1){
		//bonuses.add(new BonusBig(iX, iY));
		//} else if (ran < 0.2){
		//bonuses.add(new BonusBomb(iX, iY));
		//} else if (ran < 0.3){
		//bonuses.add(new BonusFast(iX, iY));
		//} else if (ran < 0.4){
		//bonuses.add(new BonusFour(iX, iY));
		//} else if (ran < 0.5){
		//bonuses.add(new BonusLife(iX, iY));
		//} else if (ran < 0.6){
		//bonuses.add(new BonusShield(iX, iY));
		//} else if (ran < 0.7){
		//bonuses.add(new BonusShootfast(iX, iY));
		//} else if (ran < 0.8){
		//bonuses.add(new BonusThree(iX, iY));
		//} else if (ran < 0.9){
		//bonuses.add(new BonusTwo(iX, iY));
		//}
		//}

		//public function updateProgress(p:uint, s:int):void {
		// update score
		//score += s;
//
		//progress += p;
		//progress = progress > 100 ? 100 : progress;
		//var w:int = progress / 100 * 50;
		//if (w > 0){
		//progressBar.createGraphic(w, 2, 0xff00ff00);
		//progressBar.fill(0xff00ff00);
		//} else {
		//progressBar.fill(0);
		//}
		// check win
		//if (progress == 100){
		//hasWin = true;
		//FlxG.fade.start(0xff1e150f, 2, onFade);
		//}
		//}

		//public function bomb():void {
		//FlxG.quake.start(0.005, 0.35);
		//FlxG.flash.start(0xffcccccc, 0.5);
		//for each (var eny:Enemy in _enemies.members){
		//if (eny.exists){
		//eny.hurt(100);
		//}
		//}
		//}

		override public function preProcess():void {
			screen.draw(_helper);
		}
	}
}