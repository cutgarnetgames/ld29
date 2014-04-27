
import flixel.util.FlxPoint;
import flixel.*;
import flixel.tweens.*;


class Dog extends Agent{
	
	var path:Array<FlxPoint> = null;

	public function new(x:Float, y:Float){
		super(x*16, y*16);
		loadGraphic("assets/images/dog_strip.png",true,true);
		animation.add("idle",[0]);
		animation.add("idle_anim",[0,1],4,true);
		animation.play("idle_anim");
	}

	override public function taunt(){
		FlxG.sound.play("assets/sounds/bark"+(Std.random(3)+1)+"."+Reg.ms,0.7);
	}

	override public function takeTurn(){
		if(canSensePlayer() && Reg.state.player.over){
			if(path == null)
				FlxG.sound.play("assets/sounds/snarl"+(Std.random(3)+1)+"."+Reg.ms,0.7);
			trackPlayer();
		}
		else{
			if(path == null){
				Reg.state.endTurn(null);
				return;
			}
		}
		if(path != null){
			if(path.length == 0){
				path = null;
				//super.takeTurn();
				Reg.state.endTurn(null);
				return;
			}

			var dx = (path[0].x-this.x);
			var dy = (path[0].y-this.y);
			
			if(dx != 0 && dy != 0){
				path.insert(0, new FlxPoint(path[0].x, this.y));
			}
			if(super.takeTurnWithMove(new FlxPoint(path[0].x-this.x,path[0].y-this.y))){
				if(dx < 0){
					facing = FlxObject.LEFT;
				}
				else if(dx > 0){
					facing = FlxObject.RIGHT;
				}
				path.shift();	
			}
			else{
				//super.takeTurn();
				Reg.state.endTurn(null);
			}
		}
		else{
			Reg.state.endTurn(null);
		}
	}

	public function trackPlayer(){
		this.path = Reg.state.map_over.findPath(new FlxPoint(this.x,this.y), new FlxPoint(Reg.state.player.x, Reg.state.player.y), false);
		for(i in 1...path.length-1){
			path[i].x -= 8;
			path[i].y -= 8;
		}
		//trace(path);
		if(this.path != null)
			this.path.shift();
	}

}