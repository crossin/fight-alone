package {
	import org.flixel.FlxGame;

	/**
	 * ...
	 * @author Crossin
	 */
	public class Game extends FlxGame {

		public function Game(){
			super(640, 480, MenuState, 1);
			useDefaultHotKeys = true;
			EndState.load();
		}

	}

}