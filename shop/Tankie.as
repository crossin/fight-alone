package {
	import org.flixel.*;

	[SWF(width="640",height="480",backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")]

	public class Tankie extends FlxGame {
		public function Tankie():void {
			super(320, 240, MenuState);
			FlxState.bgColor = 0xff333c3b;
			useDefaultHotKeys = true;
		}
	}
}