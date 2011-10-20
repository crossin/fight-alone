package {
	import org.flixel.*;
	import org.flixel.data.*;

	[SWF(width="640",height="480",backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")]

	public class Tankie extends FlxGame {
		public function Tankie():void {
			super(640, 480, EndState, 1);
			//FlxState.bgColor = 0xffc8a46d;
			useDefaultHotKeys = true;
			EndState.load();
		}
	}
}