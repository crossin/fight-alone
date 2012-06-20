package {
	import flash.display.MovieClip;
	import org.flixel.*;
	import org.flixel.data.*;
	import flash.events.Event;
	import mochi.as3.MochiSocial;
    import mochi.as3.MochiServices;

	
	[SWF(width="640",height="480",backgroundColor="#000000")]
	//[Frame(factoryClass="Preloader")]

	dynamic public class Tankie extends MovieClip {
		//public function Tankie():void {
			//super(640, 480, MenuState, 1);
			//useDefaultHotKeys = true;
			//EndState.load();
		//}

		
		
		// mochi
		public function Tankie():void
		{
			if (stage)
			{
				init();
			} else {
				addEventListener(Event.ADDED_TO_STAGE, init);
			}
		}

		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			var _mochiads_game_id:String = "d6102fc8803b0b09";
			var game:Game = new Game;

			addChild(game);
		}

	}
}