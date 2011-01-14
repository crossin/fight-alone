package {
	import org.flixel.*;

	public class PlayState extends FlxState {
		[Embed(source="res/gibs.png")]
		private var ImgGibs:Class;
		[Embed(source="res/crosshair.png")]
		private var ImgCursor:Class;
		[Embed(source="res/heart.png")]
		private var ImgHeart:Class;
		[Embed(source="res/back.png")]
		private var ImgBack:Class;
		[Embed(source="res/shield.png")]
		private var ImgShield:Class;

		public static var _tank:Tank;
		public static var _battery:Battery;
		public static var _bullets:FlxGroup;
		public static var _lifeBar:FlxSprite;
		public static var _enemyLifeBar:FlxSprite;
		public static var _enemyLifeBarBack:FlxSprite;
		public static var _enemyBullets:FlxGroup;
		public static var maxWidth:int;
		public static var maxHeight:int;
		public static var _explosions:FlxGroup;
		public static var _gibs:FlxEmitter;

		protected var _enemies:FlxGroup;
		protected var _objects:FlxGroup;
		protected var _rock:Box;
		protected var boxes:FlxGroup;
		protected var bonuses:FlxGroup;
		protected var _boss:FlxSprite;
		protected var shield:FlxSprite;
		private var _timer:Number;
		private var _timerLast:Number;
		private var _timerInterval:Number;

		override public function create():void {
			//back
			maxWidth = 400;
			maxHeight = 300;
			var back:FlxTileblock = new FlxTileblock(0, 0, maxWidth, maxHeight);
			back.loadGraphic(ImgBack);
			add(back);

			// hud
			var ssf:FlxPoint = new FlxPoint(0, 0);
			var heart:FlxSprite = new FlxSprite(10, 10, ImgHeart);
			heart.scrollFactor = ssf;
			_lifeBar = new FlxSprite(heart.x + 13, heart.y + 2);
			_lifeBar.createGraphic(50, 4);
			_lifeBar.fill(0xfff29a7d);
			_lifeBar.scrollFactor = ssf;

			_enemyLifeBar = new FlxSprite();
			_enemyLifeBarBack = new FlxSprite();

			
			bonuses = new FlxGroup();
			add(bonuses);
			
			_objects = new FlxGroup();
			
			_gibs = new FlxEmitter();
			_gibs.setXSpeed(-100, 100);
			_gibs.setYSpeed(-100, 100);
			//_gibs.setRotation(0,50);
			//_gibs.setSize(10, 10);
			_gibs.gravity = 0;
			_gibs.particleDrag.x = 200;
			_gibs.particleDrag.y = 200;
			_gibs.createSprites(ImgGibs, 50, 16, true, 0.2);
			add(_gibs);
			_objects.add(_gibs);

			boxes = new FlxGroup();
			var box:Box;
			box = new Box(100, 100);
			boxes.add(box);
			box = new Box(100, 110);
			boxes.add(box);
			box = new Box(110, 100);
			boxes.add(box);
			box = new Box(110, 110);
			boxes.add(box);
			add(boxes);
			_objects.add(boxes);
			
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

			shield = new FlxSprite();
			shield.loadGraphic(ImgShield, true);
			shield.addAnimation("active", [0, 1, 2, 3], 18);
			shield.play("active");
			
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

			_boss = new Boss();
			_boss.exists = false;
			add(_enemyBullets);
			add(_boss);
			add(_tank);
			add(shield);
			add(_bullets);
			add(_battery);
			add(_enemies);
			add(_explosions);
			add(_enemyLifeBarBack);
			add(_enemyLifeBar);

			add(heart);
			add(_lifeBar);


			_objects.add(_tank);
			_objects.add(_enemies);
			_objects.add(_rock);
			_objects.add(_boss);


			FlxG.mouse.show(ImgCursor);
			FlxG.follow(_tank);
			FlxG.followBounds(0, 0, maxWidth, maxHeight);

			_timer = 0;
			_timerLast = 0;
			_timerInterval = 5;
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
			FlxU.collide(_objects, _objects);

			if (FlxG.keys.ONE){
				_tank.setType(1)
			}
			if (FlxG.keys.TWO){
				_tank.setType(2)
			}

			// add enemies
			_timer += FlxG.elapsed;
			if (_timer % _timerInterval < _timerLast % _timerInterval){
				_enemies.add(new EnemyFast(int(FlxU.random() * 4)));
			}
			// add boss
			if (_timerLast < 1 && _timer > 1){
				_boss.reset(FlxG.width / 2, -40);
			}
			_timerLast = _timer;

			// check end
			if (!_boss.exists && _boss.dead){
				FlxG.fade.start(0xff131c1b, 2, onFade);
			}
			/*
			for each (var eny:Enemy in _enemies.members) {
				if (!eny.exists) {
					_enemies.remove(eny, true);
				}
			}
			*/

			shield.x = _tank.x;
			shield.y = _tank.y;
		}

		protected function overlapped(Object1:FlxObject, Object2:FlxObject):void {
			if ((Object1 as Bullet).owner == Object2){
				return;
			}
			Object1.kill();
			if (Object2 is Tank){
				Object2.hurt(1);
			}
			if (!(Object1 is EnemyBullet) && ((Object2 is Enemy) || (Object2 is Boss))){
				Object2.hurt(1);
			}
			if (Object2 is Box){
				Object2.hurt(1);
			}
		}

		private function onFade():void {
			FlxG.state = new EndState();
		}
		
		public function dropBonus(iX:int,iY:int):void {
			bonuses.add(new BonusLife(iX - 4, iY - 4));
			trace(bonuses.members[0])
			trace(bonuses.members[0].x)
			//trace(bonuses.members[0].exist)
		}
	}
}