package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class EnemyBossCannon extends EnemyBoss {
		[Embed(source="res/cannon.png")]
		private var ImgEnemy:Class;

		//private var ship:Ship;
		private var _timer:Number;
		private var _timerInterval:Number;
		private var boss:EnemyBossBarrage;
		private var index:int;
		private var invincible:Boolean;
		private var shot:Boolean;
		private var scraps:Array;

		public function EnemyBossCannon(b:EnemyBossBarrage, i:int){
			super(ImgEnemy);
			boss = b;
			scraps = (FlxG.state as PlayState)._scraps.members;
			index = i;
			gibs = PlayState.gibsBarrage;
			score = 0;
			health = 20;

			_timer = 0;
			shot = false;
			//ship = (FlxG.state as PlayState).ship;

			//if (level == 0) {
			PlayState.lifeBoss.start(health);
			invincible = true;
			//origin.x = boss.x - x;
			//origin.y = boss.y - y;
			//}

			//_timerInterval = 5;
			//_timer = _timerInterval;
		}

		//override protected function start():void {
		//color = 0xd90395;
		//}

		override public function update():void {
			invincible = true;
			color = 0xffffff;
			if (_timer > 0){
				invincible = false;
				color = 0xd90395;
				_timer -= FlxG.elapsed;
				if (_timer < _timerInterval / 2 && !shot){
					shoot();
				}
			}
			angle = boss.angle - index * 45 + 180;
			x = boss.x + boss.origin.x + boss.width / 2 * Math.sin(angle * Math.PI / 180) - origin.x;
			y = boss.y + boss.origin.y - boss.height / 2 * Math.cos(angle * Math.PI / 180) - origin.y;
			//cannons[numGun].y = y + origin.y + 96 * Math.cos(numGun * Math.PI / 4) - cannons[numGun].origin.y;

			super.update();
		}

		override public function hurt(Damage:Number):void {
			if (!invincible){
				super.hurt(Damage);
			}
			//PlayState.lifeBoss.decrease(Damage);
		}

		override public function kill():void {
			boss.loseGun();
			super.kill();
		}

		public function action(t:Number):void {
			_timerInterval = t;
			_timer = _timerInterval;
			shot = false;
		}

		public function shoot():void {
			shot = true;
			var s:Scrap = scraps[Scrap.scrapIndex];
			//var shootAngle:Number = FlxU.getAngle((FlxG.mouse.x + FlxG.mouse.cursor.width / 2) - (x + width / 2), (FlxG.mouse.y + FlxG.mouse.cursor.height / 2) - (y + height / 2));
			s.reset(x + (width - s.width) / 2, y + (height - s.height) / 2);
			s.angle = angle - 90;
			var dist:FlxPoint = FlxU.rotatePoint(height/2, 0, 0, 0, s.angle);
			s.x += dist.x;
			s.y += dist.y;
			s.color = 0xd90395;
			s.velocity = FlxU.rotatePoint(200, 0, 0, 0, s.angle);
			//b.velocity.x += velocity.x;
			//b.velocity.y += velocity.y;
			Scrap.scrapIndex++;
			if (Scrap.scrapIndex >= scraps.length)
				Scrap.scrapIndex = 0;
		}
	}
}