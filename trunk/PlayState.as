package {
	import org.flixel.*;

	public class PlayState extends FlxState {
		protected var _tank:Tank;
		protected var _battery:Battery;
		protected var _bullets:FlxGroup;

		override public function create():void {
			_battery = new Battery();

			var s:FlxSprite;
			_bullets = new FlxGroup();
			var i:int;
			for (i = 0; i < 32; i++){
				s = new FlxSprite(-100, -100);
				s.createGraphic(8, 2);
				s.width = 10;
				s.height = 10;
				s.offset.x = -1;
				s.offset.y = -4;
				s.exists = false;
				_bullets.add(s);
			}

			_tank = new Tank(_battery, _bullets.members);

			add(_tank);
			add(_battery);
			add(_bullets);
			
			FlxG.mouse.show();
		}
	}
}