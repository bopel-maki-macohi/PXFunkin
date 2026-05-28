package px.play;

import flixel.FlxG;
import flixel.addons.sound.FlxRhythmConductorUtil;
import px.play.objects.Character;
import px.play.objects.Song;

class PlayState extends ConductorState
{
	var character:Character;

	var song:Song;

	override public function create()
	{
		song = new Song('bopeebo');

		resetConductor();

		FlxG.sound.playMusic(song.getInst());

		conductor.setupTimeChanges(FlxRhythmConductorUtil.parseTimeChanges(song.data?.bpmChanges ?? []));

		character = new Character();
		add(character);
		character.screenCenter();

		super.create();
	}

	override public function update(elapsed:Float)
	{
		conductor.update(null);

		if (FlxG.keys.anyPressed([A, LEFT]))
			character.playSingAnimation(LEFT);
		if (FlxG.keys.anyPressed([S, DOWN]))
			character.playSingAnimation(DOWN);
		if (FlxG.keys.anyPressed([W, UP]))
			character.playSingAnimation(UP);
		if (FlxG.keys.anyPressed([D, RIGHT]))
			character.playSingAnimation(RIGHT);

		super.update(elapsed);
	}

	override function onBeatHit(beat:Int, backward:Bool)
	{
		super.onBeatHit(beat, backward);

		character.dance();
	}
}
