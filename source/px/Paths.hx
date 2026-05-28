package px;

import sys.FileSystem;
import sys.io.File;

class Paths
{
	public static inline function exists(path:String):Bool
		return FileSystem.exists(path);

	public static inline function getContent(path:String):String
		return File.getContent(path);

	public static inline function audio(path:String):String
		return '$path.ogg';

	public static inline function png(path:String):String
		return '$path.png';

	public static inline function json(path:String):String
		return '$path.json';

	public static inline function getPath(path:String):String
		return 'assets/$path';

	public static inline function getPlayPath(path:String):String
		return getPath('play/$path');

	public static inline function getCharacterPath(path:String):String
		return getPlayPath('characters/$path');

	public static inline function getSongsPath(path:String):String
		return getPlayPath('songs/$path');

	public static inline function getSongPath(song:String, path:String):String
		return getSongsPath('${song.toLowerCase()}/$path');
}
