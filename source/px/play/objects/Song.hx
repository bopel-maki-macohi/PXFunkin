package px.play.objects;

import haxe.Json;
import px.data.song.SongData;

class Song
{
	public var song(default, null):String;

	public var data(default, null):SongData;

	public function new(id:String)
	{
		this.song = id.toLowerCase();

		final metaFilePath:String = song.getSongPath('meta'.json());

		if (!metaFilePath.exists())
		{
			trace('Missing metadata file path : $metaFilePath', song);
			return;
		}

		data = Json.parse(metaFilePath.getContent());

		if (data.bpmChanges == null)
		{
			trace('Missing metadata "bpmChanges" field', song);
			return;
		}
		else if (data.bpmChanges.length < 1)
		{
			trace('Missing metadata "bpmChanges" entry', song);
			return;
		}

		trace('Loaded metadata file path : $metaFilePath', song);
	}

	public function getInst():String
		return song.getSongPath('Inst').audio();

	public function getVoice(voice:String):String
		return song.getSongPath('Voices-$voice').audio();
}
