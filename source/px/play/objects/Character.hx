package px.play.objects;

import flixel.util.FlxDirection;
import haxe.Json;
import px.data.characters.CharacterData;
import px.graphics.PxSprite;

using StringTools;

class Character extends PxSprite
{
	var data:CharacterData;

	override public function new(character:String = 'boyfriend', ?x:Float = 0, ?y:Float = 0)
	{
		super(x, y);

		final metaFilePath = '$character/meta'.json().getCharacterPath();
		final imgFilePath = '$character/image'.png().getCharacterPath();

		if (!metaFilePath.exists())
		{
			trace('Missing metadata file path : $metaFilePath', character);
			return;
		}

		data = Json.parse(metaFilePath.getContent());

		if (data.frameDimensions == null)
		{
			trace('Missing metadata "frameDimensions" field', character);
			return;
		}

		if (data.anims == null)
		{
			trace('Missing metadata "anims" field', character);
			return;
		}

		trace('Loaded metadata file path : ${metaFilePath}', character);

		loadGraphic(imgFilePath, true, data.frameDimensions[0], (data.frameDimensions[1] ?? data.frameDimensions[0]));

		for (a in data.anims)
		{
			if (a.name == null || a.frames == null || a.frames.length == 0 || a.name.trim().length == 0)
				continue;

			animation.add(a.name, a.frames, a?.fps ?? 8, false);
		}
	}

	public function playSingAnimation(direction:FlxDirection, ?suffix:String = '')
	{
		switch (direction)
		{
			case LEFT:
				playAnim('singLEFT$suffix');
			case DOWN:
				playAnim('singDOWN$suffix');
			case UP:
				playAnim('singUP$suffix');
			case RIGHT:
				playAnim('singRIGHT$suffix');
		}
	}
}
