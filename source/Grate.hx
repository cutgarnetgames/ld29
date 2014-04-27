import flixel.FlxSprite;
import flixel.FlxG;

class Grate extends FlxSprite{

	public var under:Bool = false;
	public var closed:Bool = false;
	public var closes:Bool = false;
	public var partner:Grate = null;
	
	public function new(x:Float, y:Float, ?under:Bool=false, ?closes=false){
		super(x*16, y*16, "assets/images/grate.png");
		this.under = under;
		if(closes && under){
			loadGraphic("assets/images/hole_up_strip.png",true);
			animation.add("idle", [0]);
			animation.play("idle");
			animation.add("close", [0,1,2,3,4,5,6], 6, false);
		}
		else if(closes && !under){
			loadGraphic("assets/images/hole_soft_strip.png",true);
			animation.add("idle", [0]);
			animation.play("idle");
			animation.add("close", [1]);
		}
		else if(!closes && under){
			loadGraphic("assets/images/hole_up.png");
		}
		else if(!closes && !under){
			loadGraphic("assets/images/grate.png");
		}
		this.closes = closes;
	}

	public function close(?cycling:Bool = false){
		if(closes){
			FlxG.sound.play("assets/sounds/gravelfall"+(Std.random(2)+1)+"."+Reg.ms);
			closed = true;
			animation.play("close");
			if(partner != null && !cycling)
				partner.close(true);

			trace(Std.int((this.x-Reg.state.map_over.width)/16)+","+
				Std.int((this.y-Reg.state.map_over.height)/16));
			if(under)
				Reg.state.map_under.setTile(
					Std.int((this.x-Reg.state.map_over.width)/16),
					Std.int((this.y)/16),
					1, true);
		}

	}

}