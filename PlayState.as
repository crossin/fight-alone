package {
	import org.flixel.*;

	public class PlayState extends FlxState {
		[Embed(source="gibs.png")]
		private var ImgGibs:Class;
		[Embed(source="cursor.png")]
		private var ImgCursor:Class;
		[Embed(source="bullet.png")]
		private var ImgBullet:Class;
		[Embed(source="heart.png")]
		private var ImgHeart:Class;
		[Embed(source="back.png")]
		private var ImgBack:Class;
		[Embed(source="rock.png")]
		private var ImgRock:Class;

		protected var _tank:Tank;
		public static var _battery:Battery;
		public static var _bullets:FlxGroup;
		public static var _lifeBar:FlxSprite;

		protected var _enemyBullets:FlxGroup;
		protected var _enemies:FlxGroup;
		protected var _objects:FlxGroup;
		protected var _gibs:FlxEmitter;
		protected var _rock:FlxSprite;
		protected var _enemyLifeBar:FlxSprite;
		protected var _enemyLifeBarBack:FlxSprite;

		protected var maxWidth:int;
		protected var maxHeight:int;

		override public function create():void {
			//back
			maxWidth = 400;
			maxHeight = 300;
			var back:FlxTileblock = new FlxTileblock(0, 0, maxWidth, maxHeight);
			back.loadGraphic(ImgBack);
			add(back);
			_rock = new FlxSprite(100, 100, ImgRock);
			_rock.fixed = true;
			add(_rock);

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

			var s:FlxSprite;
			_bullets = new FlxGroup();
			var i:int;
			for (i = 0; i < 32; i++){
				s = new FlxSprite(-100, -100, ImgBullet);
				//s.width = 50;
				//s.height = 10;
				//s.offset.x = -31;
				//s.offset.y = -31;
				s.exists = false;
				_bullets.add(s);
			}

			_enemyBullets = new FlxGroup();
			for (i = 0; i < 32; i++){
				s = new FlxSprite(-100, -100, ImgBullet);
				//s.width = 10;
				//s.height = 10;
				//s.offset.x = -1;
				//s.offset.y = -1;

				s.exists = false;
				_enemyBullets.add(s);
			}

			_battery = new Battery();
			_tank = new Tank();



			_gibs = new FlxEmitter();
			_gibs.setXSpeed(-50, 50);
			_gibs.setYSpeed(-50, 50);
			//_gibs.setRotation();
			_gibs.gravity = 0;
			_gibs.particleDrag.x = 100;
			_gibs.particleDrag.y = 100;
			_gibs.createSprites(ImgGibs);
			add(_gibs);



			add(_enemyBullets);
			add(_tank);
			add(_bullets);
			add(_battery);

			_enemies = new FlxGroup();
			var enemy:Enemy;
			for (i = 0; i < 1; i++){
				enemy = new Enemy(_tank, _gibs, _enemyBullets.members, _enemyLifeBar, _enemyLifeBarBack);
				//s.exists = false;
				_enemies.add(enemy);
			}
			add(_enemies);

			add(_enemyLifeBarBack);
			add(_enemyLifeBar);

			add(heart);
			add(_lifeBar);

			_objects = new FlxGroup();
			_objects.add(_tank);
			_objects.add(_enemies);
			_objects.add(_rock);

			FlxG.mouse.show(ImgCursor);
			FlxG.follow(_tank);
			FlxG.followBounds(0, 0, maxWidth, maxHeight);

		}

		override public function update():void {
			_enemyLifeBarBack.visible = false;
			_enemyLifeBar.visible = false;
			super.update();

			FlxU.overlap(_bullets, _enemies, overlapped);
			FlxU.overlap(_enemyBullets, _tank, overlapped);
			FlxU.overlap(_bullets, _rock, overlapped);
			FlxU.overlap(_enemyBullets, _rock, overlapped);
			FlxU.collide(_objects, _objects);

			if (FlxG.keys.ONE){
				_tank.setType(1)
			}
			if (FlxG.keys.TWO){
				_tank.setType(2)
			}
		}

		protected function overlapped(Object1:FlxObject, Object2:FlxObject):void {
			//if ((Object1 is BotBullet) || (Object1 is Bullet))
			Object1.kill();
			if ((Object2 is Tank) || (Object2 is Enemy)){
				Object2.hurt(1);
			}
		}
	}
}