import flixel.util.FlxPoint;

import flixel.*;
import flixel.tweens.*;

class Fox extends Agent{
	
	public function new(x:Float, y:Float){
		super(x*16, y*16);
		loadGraphic("assets/images/fox_strip.png",true,true);
		animation.add("idle",[0,1,2,1], 4,true);
		animation.play("idle");
	}

	override public function takeTurn(){
		if(!alive){
			Reg.state.endTurn(null);
			return;
		}

		var thing = null;
		if(Reg.state.player.over && canSeePlayer()){
			trace("I SEE YOU");
			trace(thing);
			/*var path:Array<FlxPoint> = Reg.state.map_over.findPath(new FlxPoint(this.x, this.y), new FlxPoint(Reg.state.player.x, Reg.state.player.y),false);
			if(path == null){ //Jesus what is it with Flixel and raycasting
				super.takeTurn();
				return;
			}
			var next:FlxPoint = path[1];*/
			var p:Player = Reg.state.player;
			var move:Int = 0;
			if(p.x == this.x){
				if(p.y < this.y)
					move = 2;
				else
					move = 3;
			}
			else{
				if(p.x < this.x)
					move = 1;
				else
					move = 0;
			}
			if(move == 0){
				if(Reg.state.map_over.getTile(Std.int((this.x+16)/16), Std.int((this.y/16))) == 0){
					FlxTween.tween(this, {x:this.x+16}, Reg.tweenspeed, {complete:Reg.state.endTurn});
					facing = FlxObject.RIGHT;
					return;
				}
			}
			else if(move == 1){
				if(Reg.state.map_over.getTile(Std.int((this.x-16)/16), Std.int((this.y/16))) == 0){
					FlxTween.tween(this, {x:this.x-16},  Reg.tweenspeed, {complete:Reg.state.endTurn});
					facing = FlxObject.LEFT;
					return;
				}
			}
			else if(move == 2){
				if(Reg.state.map_over.getTile(Std.int((this.x)/16), Std.int(((this.y-16)/16))) == 0){
					FlxTween.tween(this, {y:this.y-16},  Reg.tweenspeed, {complete:Reg.state.endTurn});
					return;
				}
			}
			else if(move == 3){
				if(Reg.state.map_over.getTile(Std.int(this.x/16), Std.int(this.y/16)+1) == 0){
					FlxTween.tween(this, {y:this.y+16},  Reg.tweenspeed, {complete:Reg.state.endTurn});
					return;
				}
			}
			//super.takeTurn();
		}
		//Sometimes move randomly
		//if(Std.random(5) == 1)
		//	super.takeTurn();
		//else
			Reg.state.endTurn(null);

		
	}

}