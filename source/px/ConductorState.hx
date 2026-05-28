package px;

import flixel.FlxState;
import flixel.addons.sound.FlxRhythmConductor;

class ConductorState extends FlxState
{
	public var conductor(get, never):FlxRhythmConductor;

	function get_conductor():FlxRhythmConductor
		return FlxRhythmConductor.instance;

	public function resetConductor()
	{
		FlxRhythmConductor.reset();

		conductor.onBeatHit.add(onBeatHit);
		conductor.onBpmChange.add(onBpmChange);
		conductor.onMeasureHit.add(onMeasureHit);
		conductor.onStepHit.add(onStepHit);
	}

	function onBeatHit(beat:Int, backward:Bool) {}

	function onBpmChange(bpm:Float, backward:Bool) {}

	function onMeasureHit(measure:Float, backward:Bool) {}

	function onStepHit(step:Int, backward:Bool) {}
}
