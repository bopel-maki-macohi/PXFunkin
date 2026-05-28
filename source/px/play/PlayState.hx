package px.play;

import flixel.FlxG;
import flixel.FlxState;
import px.play.objects.Character;

class PlayState extends FlxState
{
	var character:Character;

	override public function create()
	{
		character = new Character();
		add(character);
		character.screenCenter();

		super.create();
	}

	override public function update(elapsed:Float)
	{
		if (FlxG.keys.anyJustPressed([A, LEFT]))
			character.playSingAnimation(LEFT);
		if (FlxG.keys.anyJustPressed([S, DOWN]))
			character.playSingAnimation(DOWN);
		if (FlxG.keys.anyJustPressed([W, UP]))
			character.playSingAnimation(UP);
		if (FlxG.keys.anyJustPressed([D, RIGHT]))
			character.playSingAnimation(RIGHT);

		super.update(elapsed);
	}
}
