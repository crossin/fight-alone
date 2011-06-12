package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class Border extends FlxSprite {
		[Embed(source="res/border_v.png")]
		private var ImgBorderV:Class;
		[Embed(source="res/border_h.png")]
		private var ImgBorderH:Class;
		//[Embed(source="res/gibs.png")]
		protected var ImgGibs:Class;
		protected var gibs:FlxEmitter;

		public function Border(ix:int, iy:int, type:int){

			super(ix, iy);
			fixed = true;
			if (type == 1){
				loadGraphic(ImgBorderV);
			} else {
				loadGraphic(ImgBorderH);
			}

			//health = 4;
			//addAnimation("health4", [0]);
			//addAnimation("health3", [1]);
			//addAnimation("health2", [2]);
			//addAnimation("health1", [3]);
			gibs = PlayState._gibs;

		}

		override public function hurt(Damage:Number):void {
			super.hurt(1);
			play("health" + health);
		}

		override public function kill():void {
			super.kill();
			flicker(-1);
			gibs.createSprites(ImgGibs);
			gibs.at(this);
			gibs.start(true, 0.4, 25);
			if (FlxU.random() < 0.2){
				(FlxG.state as PlayState).dropBonus(x + origin.x, y + origin.y);
			}
		}
	}
}