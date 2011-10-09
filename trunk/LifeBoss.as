package  
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxText;
	import org.flixel.FlxPoint;
	
	/**
	 * ...
	 * @author Crossin
	 */
	public class LifeBoss extends FlxGroup 
	{
		public var bar:FlxSprite;
		public var lifeMax:int;
		public var life:int;
		
		public function LifeBoss() 
		{
			var ssf:FlxPoint = new FlxPoint(0, 0);
			var txt:FlxText = new FlxText(10, 450, 100, "BOSS");
			txt.size = 16;
			txt.scrollFactor = ssf;
			add(txt);
			
			bar = new FlxSprite(62, 456);
			bar.createGraphic(560, 10);
			bar.scrollFactor = ssf;
			bar.origin.x = 0;
			add(bar);
			visible = false;
		}
		
		public function start(max:int):void {
			lifeMax = max;
			life = lifeMax;
			bar.scale.x = 1;
			visible = true;
		}
		
		public function decrease(value:int):void {
			life -= value;
			bar.scale.x = life / lifeMax;
			if (life <= 0) {
				visible = false;
			}
		}
	}

}