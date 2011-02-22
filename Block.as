package {
	import org.flixel.*;

	/**
	 * ...
	 * @author Crossin
	 */
	public class Block extends FlxSprite {
		//[Embed(source="res/gibs.png")]
		protected var ImgGibs:Class;
		protected var gibs:FlxEmitter;
		
		public function Block(ix:int,iy:int){
			super(ix, iy);
			//loadGraphic(ImgBox, true);
			fixed = true;
			//health = 4;
			//addAnimation("health4", [0]);
			//addAnimation("health3", [1]);
			//addAnimation("health2", [2]);
			//addAnimation("health1", [3]);
			gibs = PlayState._gibs;
		}
		
		override public function hurt(Damage:Number):void {
			super.hurt(Damage);
			play("health" + health);
		}
		
		override public function kill():void {
			super.kill();
			flicker( -1);
			gibs.createSprites(ImgGibs);
			gibs.at(this);
			gibs.start(true, 0.4, 25);
			(FlxG.state as PlayState).dropBonus(x + origin.x, y + origin.y);
		}
	}
}