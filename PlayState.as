package {
	import org.flixel.*;

	public class PlayState extends FlxState {
		[Embed(source="res/gibs.png")]
		private var ImgGibs:Class;
		[Embed(source="res/crosshair.png")]
		private var ImgCursor:Class;
		[Embed(source="res/heart.png")]
		private var ImgHeart:Class;
		[Embed(source="res/flag.png")]
		private var ImgFlag:Class;
		//[Embed(source="res/back.png")]
		//private var ImgBack:Class;
		[Embed(source="res/shield.png")]
		private var ImgShield:Class;

		public static var _tank:Tank;
		public static var _battery:Battery;
		public static var _bullets:FlxGroup;
		public static var _lifeBar:FlxSprite;
		public static var progressBar:FlxSprite;
		public static var _enemyLifeBar:FlxSprite;
		public static var _enemyLifeBarBack:FlxSprite;
		public static var _enemyBullets:FlxGroup;
		public static var maxWidth:int;
		public static var maxHeight:int;
		public static var _explosions:FlxGroup;
		public static var _gibs:FlxEmitter;

		//public var _explosionIndex:uint;

		protected var _enemies:FlxGroup;
		protected var _objects:FlxGroup;
		//protected var _rock:Box;
		protected var back:FlxTileblock;
		protected var boxes:FlxGroup;
		protected var bonuses:FlxGroup;
		protected var base:FlxSprite;
		protected var _boss:FlxSprite;
		protected var shield:FlxSprite;
		protected var _timer:Number;
		protected var _timerLast:Number;
		protected var _timerInterval:Number;
		protected var enemyCount:uint;
		protected var progress:Number;
		protected var hasWin:Boolean;
		protected var score:int;
		protected var txtScore:FlxText;
		protected var txtGold:FlxText;
		protected var index:uint;

		override public function create():void {
			//back
			maxWidth = 400;
			maxHeight = 300;
			back = new FlxTileblock(0, 0, maxWidth, maxHeight);
			add(back);

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
			txtScore = new FlxText(200, 10, 100, "0");
			txtScore.size = 8;
			//txtScore.alignment = "center";
			txtScore.color = 0x336699;
			txtScore.antialiasing = false;
			txtScore.scrollFactor = ssf;
			//txtScore.alpha = 0.5;
			txtGold = new FlxText(20, 220, 100, "0");
			txtGold.size = 8;
			//txtGold.alignment = "center";
			txtGold.color = 0x999933;
			txtGold.antialiasing = false;
			txtGold.scrollFactor = ssf;

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

			_gibs = new FlxEmitter();
			_gibs.setXSpeed(-100, 100);
			_gibs.setYSpeed(-100, 100);
			//_gibs.setRotation(0,50);
			//_gibs.setSize(10, 10);
			_gibs.gravity = 0;
			_gibs.particleDrag.x = 200;
			_gibs.particleDrag.y = 200;
			_gibs.createSprites(ImgGibs);
			add(_gibs);
			_objects.add(_gibs);

			bonuses = new FlxGroup();
			add(bonuses);

			boxes = new FlxGroup();
			add(boxes);
			_objects.add(boxes);

			// to be overrided by every level
			makeScene();

			base = new Base();
			add(base);
			_objects.add(base);

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

			_enemyBullets = new FlxGroup();
			for (i = 0; i < 32; i++){
				s = new EnemyBullet();
				_enemyBullets.add(s);
			}

			_battery = new Battery();
			_tank = new Tank();

			_enemies = new FlxGroup();
			//var enemy:Enemy;
			//for (i = 0; i < 1; i++){
			//enemy = new Enemy(_tank, _gibs, _enemyBullets.members, _enemyLifeBar, _enemyLifeBarBack);
			//s.exists = false;
			//_enemies.add(enemy);
			//}

			//shield = new FlxSprite();
			//shield.loadGraphic(ImgShield, true);
			//shield.addAnimation("active", [0, 1, 2, 3], 18);
			//shield.play("active");

			_boss = new Boss(20);
			_boss.exists = false;
			add(_enemyBullets);
			add(_boss);
			add(_tank);
			add(_bullets);
			add(_battery);
			add(_enemies);
			//add(shield);
			add(_explosions);
			add(_enemyLifeBarBack);
			add(_enemyLifeBar);

			add(heart);
			add(_lifeBar);
			add(flag);
			add(progressBar);
			add(txtScore);
			add(txtGold);

			_objects.add(_tank);
			_objects.add(_enemies);
			//_objects.add(_rock);
			_objects.add(_boss);


			FlxG.mouse.show(ImgCursor);
			FlxG.follow(_tank);
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
		}

		override public function update():void {
			_enemyLifeBarBack.visible = false;
			_enemyLifeBar.visible = false;
			super.update();

			FlxU.overlap(_bullets, _enemies, overlapped);
			FlxU.overlap(_bullets, _boss, overlapped);
			FlxU.overlap(_enemyBullets, _tank, overlapped);
			FlxU.overlap(_enemyBullets, _enemies, overlapped);
			FlxU.overlap(_enemyBullets, _boss, overlapped);
			FlxU.overlap(_bullets, boxes, overlapped);
			FlxU.overlap(_enemyBullets, boxes, overlapped);
			FlxU.overlap(_bullets, base, overlapped);
			FlxU.overlap(_enemyBullets, base, overlapped);
			FlxU.overlap(bonuses, _tank, overlapped);
			FlxU.collide(_objects, _objects);

			if (FlxG.keys.ONE){
				_tank.setType(1)
			}
			if (FlxG.keys.TWO){
				_tank.setType(2)
			}

			// add enemies
			_timer += FlxG.elapsed;
			addEnemy();
			_timerLast = _timer;

			// check lose
			if (!_tank.exists || !base.active){
				FlxG.fade.start(0xff131c1b, 2, onFade);
			}
		/*
		   for each (var eny:Enemy in _enemies.members) {
		   if (!eny.exists) {
		   _enemies.remove(eny, true);
		   }
		   }
		 */

			 //shield.x = _tank.x;
			 //shield.y = _tank.y;
		}

		protected function overlapped(Object1:FlxObject, Object2:FlxObject):void {
			if ((Object1 is Bullet) && ((Object1 as Bullet).owner == Object2)){
				return;
			}
			Object1.kill();
			if (!(Object1 is EnemyBullet) && ((Object2 is Enemy) || (Object2 is Boss))){
				Object2.hurt(1);
			}
			if (Object2 is Box){
				Object2.hurt(1);
			}
			if ((Object1 is EnemyBullet) && ((Object2 is Base) || (Object2 is Tank))){
				Object2.hurt(1);
			}
			if ((Object1 is Bonus) && (Object2 is Tank)){
				// add gold
				FlxG.score += 1;
				txtGold.text = FlxG.score.toString();
			}
		}

		protected function addEnemy():void {
		}

		protected function makeScene():void {
		}

		private function onFade():void {
			FlxG.state = new EndState(hasWin, index);
		}

		public function dropBonus(iX:int, iY:int):void {
			bonuses.add(new Bonus(iX - 4, iY - 4));
		}

		public function updateProgress(p:uint, s:int):void {
			// update score
			score += s;
			txtScore.text = score.toString();

			progress += p;
			progress = progress > 100 ? 100 : progress;
			var w:int = progress / 100 * 50;
			if (w > 0){
				progressBar.createGraphic(w, 2, 0xff00ff00);
			} else {
				progressBar.fill(0);
			}
			// check win
			if (progress == 100){
				hasWin = true;
				FlxG.fade.start(0xff131c1b, 2, onFade);
			}
		}
	}
}