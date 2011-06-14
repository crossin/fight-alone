package {
	import org.flixel.*;

	public class PlayState extends FlxState {
		[Embed(source="res/crosshair.png")]
		private var ImgCursor:Class;
		[Embed(source="res/heart.png")]
		private var ImgHeart:Class;
		[Embed(source="res/flag.png")]
		private var ImgFlag:Class;
		[Embed(source="res/gibs_white.png")]
		private var ImgGibs:Class;
		[Embed(source="res/gibs_rect.png")]
		private var ImgGibsRect:Class;
		//[Embed(source="res/upgrade.png")]
		//private var ImgUpgrade:Class;
		//[Embed(source="res/back.png")]
		//private var ImgBack:Class;
		//[Embed(source="res/shield.png")]
		//private var ImgShield:Class;

		public var ship:Ship;
		public var shield:Shield;
		//public var upEffect:UpEffect;
		//public static var _battery:Battery;
		public static var _bullets:FlxGroup;
		public static var _bulletsSmall:FlxGroup;
		public static var _lifeBar:FlxSprite;
		public static var progressBar:FlxSprite;
		public static var _enemyLifeBar:FlxSprite;
		public static var _enemyLifeBarBack:FlxSprite;
		public static var _enemyBullets:FlxGroup;
		public static var maxWidth:int;
		public static var maxHeight:int;
		public static var _explosions:FlxGroup;
		public static var _gibs:FlxEmitter;
		public static var gibsRect:FlxEmitter;

		//public var _explosionIndex:uint;

		protected var _enemies:FlxGroup;
		protected var _objects:FlxGroup;
		//protected var _rock:Box;
		//protected var back:FlxTileblock;
		protected var blocks:FlxGroup;
		protected var bonuses:FlxGroup;
		//protected var base:FlxSprite;
		//protected var _boss:FlxSprite;
		protected var _timer:Number;
		protected var _timerLast:Number;
		protected var _timerInterval:Number;
		protected var enemyCount:uint;
		protected var progress:Number;
		protected var hasWin:Boolean;
		protected var txtScore:FlxText;
		//protected var txtGold:FlxText;
		protected var index:uint;
		protected var map:Array;
		//protected var startX:int;
		//protected var startY:int;

		public var score:int;


		// blur
		private const _blur:Number = 0.3;
		private var _helper:FlxSprite;

		override public function create():void {
			//back
			maxWidth = 800;
			maxHeight = 600;
			//back = new FlxTileblock(0, 0, maxWidth, maxHeight);
			//add(back);

			// hud
			var ssf:FlxPoint = new FlxPoint(0, 0);
			var heart:FlxSprite = new FlxSprite(20, 10, ImgHeart);
			heart.scrollFactor = ssf;
			_lifeBar = new FlxSprite(heart.x + 13, heart.y + 2);
			_lifeBar.createGraphic(50, 4);
			_lifeBar.fill(0xfff29a7d);
			_lifeBar.scrollFactor = ssf;
			var flag:FlxSprite = new FlxSprite(240, 230, ImgFlag);
			flag.scrollFactor = ssf;
			progressBar = new FlxSprite(flag.x + 1, flag.y + 2);
			progressBar.fill(0);
			progressBar.scrollFactor = ssf;
			_enemyLifeBar = new FlxSprite();
			_enemyLifeBarBack = new FlxSprite();
			// upgrade panel
			//var upPanel:FlxSprite = new FlxSprite(5, 215, ImgUpgrade);
			//upPanel.scrollFactor = ssf;
			//score
			txtScore = new FlxText(0, 218, 50, "0");
			txtScore.size = 8;
			txtScore.alignment = "center";
			txtScore.color = 0xf0f0f0;
			//txtScore.antialiasing = false;
			txtScore.scrollFactor = ssf;
			//txtScore.alpha = 0.5;
			//txtGold = new FlxText(120, 20, 100, FlxG.score.toString());
			//txtGold.size = 8;
			//txtGold.alignment = "center";
			//txtGold.color = 0x999933;
			//txtGold.antialiasing = false;
			//txtGold.scrollFactor = ssf;


			_objects = new FlxGroup();

			_explosions = new FlxGroup();
			for (i = 0; i < 10; i++){
				s = new Explosion();
				//s.width = 50;
				//s.height = 10;
				//s.offset.x = -31;
				//s.offset.y = -31;
				s.exists = false;
				_explosions.add(s);
			}

			makeEmitter();

			bonuses = new FlxGroup();
			add(bonuses);

			blocks = new FlxGroup();
			add(blocks);
			_objects.add(blocks);

			// to be overrided by every level
			makeScene();

			//base = new Base();
			//add(base);
			//_objects.add(base);

			var s:FlxSprite;
			_bullets = new FlxGroup();
			var i:int;
			for (i = 0; i < 32; i++){
				s = new Bullet();
				//s.width = 50;
				//s.height = 10;
				//s.offset.x = -31;
				//s.offset.y = -31;
				_bullets.add(s);
			}
			_bulletsSmall = new FlxGroup();
			for (i = 0; i < 64; i++){
				s = new BulletSmall();
				_bulletsSmall.add(s);
			}

			_enemyBullets = new FlxGroup();
			for (i = 0; i < 64; i++){
				s = new EnemyBullet();
				_enemyBullets.add(s);
			}

			//_battery = new Battery();
			ship = new Ship(400, 300);

			_enemies = new FlxGroup();
			//var enemy:Enemy;
			//for (i = 0; i < 1; i++){
			//enemy = new Enemy(_tank, _gibs, _enemyBullets.members, _enemyLifeBar, _enemyLifeBarBack);
			//s.exists = false;
			//_enemies.add(enemy);
			//}

			shield = new Shield();
			shield.exists = false;
			//_boss = new Boss(20);
			//_boss.exists = false;

			//upEffect = new UpEffect();

			add(_enemyBullets);
			//add(_boss);
			add(ship);
			add(_bullets);
			add(_bulletsSmall);
			//add(_battery);
			add(_enemies);
			add(shield);
			add(_explosions);
			add(_enemyLifeBarBack);
			add(_enemyLifeBar);
			//add(upEffect);

			add(heart);
			add(_lifeBar);
			add(flag);
			add(progressBar);
			//add(upPanel);
			add(txtScore);
			//add(txtGold);

			//_objects.add(ship);
			//_objects.add(_enemies);
			
			//_objects.add(_rock);
			//_objects.add(_boss);


			FlxG.mouse.show(ImgCursor);
			FlxG.follow(ship, 3);
			//FlxG.followAdjust(0.5,0.0);
			FlxG.followBounds(0, 0, maxWidth, maxHeight);

			_timer = 0;
			_timerLast = 0;
			_timerInterval = 5;
			//_bulletIndex = 0;
			//_explosionIndex = 0;
			enemyCount = 0;
			progress = 0;
			hasWin = false;
			index = 0;
			score = 0;

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
		}

		override public function update():void {
			_enemyLifeBarBack.visible = false;
			_enemyLifeBar.visible = false;

			txtScore.text = score.toString();

			super.update();

			FlxU.overlap(_bullets, _enemies, overlapped);
			//FlxU.overlap(_bulletsSmall, _enemies, overlapped);
			//FlxU.overlap(_bullets, _boss, overlapped);
			//FlxU.overlap(_enemyBullets, ship, overlapped);
			//FlxU.overlap(_enemyBullets, _enemies, overlapped);
			//FlxU.overlap(_enemyBullets, _boss, overlapped);
			FlxU.overlap(_bullets, blocks, overlapped);
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
			addEnemy();
			_timerLast = _timer;

			// check lose
			if (!ship.exists /*|| !base.active*/){
				FlxG.fade.start(0xff1e150f, 2, onFade);
			}
			/*
			   for each (var eny:Enemy in _enemies.members) {
			   if (!eny.exists) {
			   _enemies.remove(eny, true);
			   }
			   }
			 */
			shield.angle = ship.angle;
			shield.x = ship.x + (ship.width - shield.width) / 2;
			shield.y = ship.y + (ship.height - shield.height) / 2;
		}

		protected function overlapped(Object1:FlxObject, Object2:FlxObject):void {
			
			
			//if ((Object1 is Bullet) && ((Object1 as Bullet).owner == Object2)){
				//return;
			//}
			Object1.kill();
			if (Object2 is EnemyRect) {
				Object2.kill();
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
				//FlxG.score += 1;
				//txtGold.text = FlxG.score.toString();
				//(Object1 as Bonus).doEffect();
			//}
		}

		protected function addEnemy():void {
			if (_timer % 1 < _timerLast % 1) {
				_enemies.add(new EnemyRect());
			}
			//if (_timerLast < 1 && _timer >= 1){
				//_enemies.add(new EnemyRect());
					//enemyCount++;
			//}
						//if (_timerLast < 2 && _timer >= 2){
				//_enemies.add(new EnemyRect());
					//enemyCount++;
			//}
						//if (_timerLast < 3 && _timer >= 3){
				//_enemies.add(new EnemyRect();
					//enemyCount++;
			//}
						//if (_timerLast < 4 && _timer >= 4){
				//_enemies.add(new EnemyRect());
					//enemyCount++;
			//}
						//if (_timerLast < 5 && _timer >= 5){
				//_enemies.add(new EnemyRect());
					//enemyCount++;
			//}
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
			
			gibsRect = new FlxEmitter();
			gibsRect.setXSpeed(-500, 500);
			gibsRect.setYSpeed(-500, 500);
			gibsRect.gravity = 0;
			gibsRect.particleDrag.x = 100;
			gibsRect.particleDrag.y = 100;
			gibsRect.createSprites(ImgGibsRect, 100, 0, false);
			add(gibsRect);
		}

		protected function makeScene():void {
			var border:Border;
			border = new Border(51, 43, 1);
			blocks.add(border);
			border = new Border(749, 51, 2);
			blocks.add(border);
			border = new Border(51, 549, 3);
			blocks.add(border);
			border = new Border(43, 51, 4);
			blocks.add(border);
		}

		private function onFade():void {
			FlxG.state = new EndState(hasWin, index);
		}

		public function dropBonus(iX:int, iY:int):void {
			var ran:Number = FlxU.random();
			if (ran < 0.1){
				bonuses.add(new BonusBig(iX, iY));
			} else if (ran < 0.2){
				bonuses.add(new BonusBomb(iX, iY));
			} else if (ran < 0.3){
				bonuses.add(new BonusFast(iX, iY));
			} else if (ran < 0.4){
				bonuses.add(new BonusFour(iX, iY));
			} else if (ran < 0.5){
				bonuses.add(new BonusLife(iX, iY));
			} else if (ran < 0.6){
				bonuses.add(new BonusShield(iX, iY));
			} else if (ran < 0.7){
				bonuses.add(new BonusShootfast(iX, iY));
			} else if (ran < 0.8){
				bonuses.add(new BonusThree(iX, iY));
			} else if (ran < 0.9){
				bonuses.add(new BonusTwo(iX, iY));
			}
		}

		public function updateProgress(p:uint, s:int):void {
			// update score
			score += s;

			progress += p;
			progress = progress > 100 ? 100 : progress;
			var w:int = progress / 100 * 50;
			if (w > 0){
				progressBar.createGraphic(w, 2, 0xff00ff00);
				progressBar.fill(0xff00ff00);
			} else {
				progressBar.fill(0);
			}
			// check win
			if (progress == 100){
				hasWin = true;
				FlxG.fade.start(0xff1e150f, 2, onFade);
			}
		}

		public function bomb():void {
			FlxG.quake.start(0.005, 0.35);
			FlxG.flash.start(0xffcccccc, 0.5);
			for each (var eny:Enemy in _enemies.members){
				if (eny.exists){
					eny.hurt(100);
				}
			}
		}

		override public function preProcess():void {
			screen.draw(_helper);
		}
	}
}