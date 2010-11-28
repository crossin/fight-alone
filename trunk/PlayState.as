package {
	import org.flixel.*;

	public class PlayState extends FlxState {
		[Embed(source="gibs.png")]
		private var ImgGibs:Class;
		[Embed(source="cursor.png")]
		private var ImgCursor:Class;
		[Embed(source="bullet.png")]
		private var ImgBullet:Class;

		protected var _tank:Tank;
		protected var _battery:Battery;
		protected var _bullets:FlxGroup;
		protected var _enemy:Enemy;
		protected var _gibs:FlxEmitter;

		override public function create():void {
			_battery = new Battery();

			var s:FlxSprite;
			_bullets = new FlxGroup();
			var i:int;
			for (i = 0; i < 32; i++){
				s = new FlxSprite(-100, -100, ImgBullet);
				//s.width = 10;
				//s.height = 10;
				//s.offset.x = -1;
				s.offset.y = -1;
				s.exists = false;
				_bullets.add(s);
			}

			_tank = new Tank(_battery, _bullets.members);

			add(_tank);
			add(_battery);
			add(_bullets);



			_gibs = new FlxEmitter();
			_gibs.setXSpeed(-50, 50);
			_gibs.setYSpeed(-50, 50);
			//_gibs.setRotation();
			_gibs.gravity = 0;
			_gibs.particleDrag.x = 100;
			_gibs.particleDrag.y = 100;
			_gibs.createSprites(ImgGibs);
			add(_gibs);

			_enemy = new Enemy(_tank, _gibs);
			add(_enemy);

			FlxG.mouse.show(ImgCursor);

		}

		override public function update():void {
			super.update();

			FlxU.overlap(_bullets, _enemy, overlapped);
			FlxU.collide(_tank, _enemy);
		}

		protected function overlapped(Object1:FlxObject, Object2:FlxObject):void {
			//if ((Object1 is BotBullet) || (Object1 is Bullet))
			Object1.kill();
			Object2.hurt(1);
		}
	}
}