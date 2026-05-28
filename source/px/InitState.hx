package px;

import flixel.FlxG;
import flixel.FlxState;
import px.util.logging.Log;

class InitState extends FlxState
{
	override function create()
	{
		Log.trace = haxe.Log.trace;
		haxe.Log.trace = Log.log;
		
		trace('Initalized Logger');

		FlxG.switchState(() -> new px.play.PlayState());
	}
}
