package px.util.logging;

import haxe.PosInfos;

class Log
{
	public static function log(message:Dynamic, ?posInfos:PosInfos)
	{
		var classNameSplit = posInfos.className.split('.');
		final cls = classNameSplit[classNameSplit.length - 1];

		var appendedData:String = '';

		if (posInfos.customParams != null)
			for (param in posInfos.customParams)
				appendedData += ':$param';

		Sys.println('[${cls.toUpperCase()}$appendedData] : ${Std.string(message)}');
	}

	public static var trace:Dynamic->?PosInfos->Void;
}
