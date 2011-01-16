package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class Base extends FlxSprite {
		[Embed(source="res/base.png")]
		private var ImgBase:Class;

		private var maxHealth:Number;
		private var lifeBar:FlxSprite;
		private var lifeBarBack:FlxSprite;
		private var timeDead:Number;
		private var timeExplode:Number;
		private var explosions:Array;

		public function Base(){
			super(200, 200);
			loadGraphic(ImgBase, true);
			explosions = PlayState._explosions.members;
			_fixed = true;
			maxHealth = 4;
			health = maxHealth;
			addAnimation("safe", [0, 1], 2);
			addAnimation("minor", [2, 3], 2);
			addAnimation("severe", [4, 5], 2);
			addAnimation("dead", [6]);
			play("safe");
			lifeBar = PlayState._enemyLifeBar;
			lifeBarBack = PlayState._enemyLifeBarBack;
			timeDead = 3;
			timeExplode = 0;
		}

		override public function hurt(Damage:Number):void {
			super.hurt(Damage);
			if (health > 0.6 * maxHealth){
				play("safe");
			} else if (health > 0.3 * maxHealth){
				play("minor");
			} else if (health > 0){
				play("severe");
			} else {
				play("dead");
			}
		}

		override public function kill():void {
			//super.kill();
			dead = true;
			flicker(-1);
			//gibs.at(this);
			//gibs.start(true, 1, 25);
			//(FlxG.state as PlayState).dropBonus(x + origin.x, y + origin.y);
		}

		override public function update():void {
			if (dead){
				timeDead -= FlxG.elapsed;
				timeExplode -= FlxG.elapsed;
				if (timeExplode < 0){
					explode();
					timeExplode = 0.3 + 0.2 * FlxU.random();
				}
				if (timeDead < 0){
					active = false;
					trace(timeDead)
				}
				return;
			}
			super.update();
			var mouseX:Number = FlxG.mouse.x + 4.5;
			var mouseY:Number = FlxG.mouse.y + 4.5;
			if ((mouseX > x && mouseX < x + width) && (mouseY > y && mouseY < y + height)){
				lifeBar.x = x;
				lifeBar.y = y - 2;
				lifeBarBack.x = x - 1;
				lifeBarBack.y = y - 3;
				lifeBar.visible = true;
				lifeBarBack.visible = true;
				lifeBarBack.createGraphic(width + 2, 3);
				lifeBarBack.fill(0xff000000);

				var c:uint;
				if (health > maxHealth * 0.75){
					c = 0xff00ff00 | uint(255 * 4 * (1 - health / maxHealth)) << 16;
				} else {
					c = 0xffff0000 | uint(255 * 4 / 3 * health / maxHealth) << 8;
				}
				var w:int = health / maxHealth * width;
				if (w > 0){
					lifeBar.createGraphic(w, 1, c)
				} else {
					lifeBar.fill(0);
				}
			}
		}

		private function explode():void {
			var e:Explosion = explosions[Explosion.explosionIndex];
			e.reset(x - e.width / 2 + width * FlxU.random(), y - e.height / 2 + height * FlxU.random());
			e.play("explode");
			Explosion.explosionIndex++;
			if (Explosion.explosionIndex >= explosions.length)
				Explosion.explosionIndex = 0;
		}
	}
}