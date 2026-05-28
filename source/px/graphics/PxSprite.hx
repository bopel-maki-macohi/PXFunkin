package px.graphics;

import flixel.FlxSprite;

class PxSprite extends FlxSprite
{
	public function playAnim(anim:String)
	{
		animation.play(anim);
	}

	public function setScale(scale:Float = 4)
	{
		this.scale.set(scale, scale);
		updateHitbox();
	}

	override public function new(?x:Float = 0, ?y:Float = 0)
	{
		super(x, y);

		setScale();
	}
}
