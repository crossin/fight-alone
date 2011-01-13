package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class Box extends FlxSprite {
		[Embed(source="res/box.png")]
		private var ImgBox:Class;
		private var gibs:FlxEmitter;
		
		public function Box(ix:int,iy:int){
			super(ix, iy);
			loadGraphic(ImgBox, true);
			fixed = true;
			health = 4;
			addAnimation("health4", [0]);
			addAnimation("health3", [1]);
			addAnimation("health2", [2]);
			addAnimation("health1", [3]);
			gibs = PlayState._gibs;
		}
		
		override public function hurt(Damage:Number):void {
			super.hurt(Damage);
			play("health" + health);
		}
		
		override public function kill():void {
			super.kill();
			flicker(-1);
			gibs.at(this);
			gibs.start(true, 1, 25);
		}
	}
}