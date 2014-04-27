import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxObject;

class Player extends FlxSprite{

	public var over:Bool = true;
	public var changed:Bool = false;
	
	var speed:Float;
	public var tx:Float;
	public var ty:Float;

	public function new(x:Float, y:Float){
		super(x, y);
		tx = x; ty = y;
		loadGraphic("assets/images/rabbit_strip_2.png",true,true,16,16);
		animation.add("idle", [0]);
		animation.add("idle_move", [0,1], 4, true);
		animation.play("idle_move");
		animation.add("run", [2,3], 10, true);
	}

	override public function update(){
		super.update();
	}

}