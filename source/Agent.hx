import flixel.*;
import flixel.tweens.FlxTween;
import flixel.util.FlxPoint;

class Agent extends FlxSprite{
	
	public function new(x:Float, y:Float){
		super(x, y);
	}

	public function takeTurnWithMove(tryMove:FlxPoint=null){
		if(Reg.state.map_over.getTile(Std.int((this.x+tryMove.x)/16), Std.int(((this.y+tryMove.y)/16))) == 0){
			FlxTween.tween(this, {x:this.x+tryMove.x, y:this.y+tryMove.y}, Reg.tweenspeed, {complete:Reg.state.endTurn});
			if(tryMove.x < 0)
				this.facing = FlxObject.LEFT;
			if(tryMove.x > 0)
				this.facing = FlxObject.RIGHT;
			return true;
		}
		else{
			return false;
		}
	}

	public function taunt(){}

	public function takeTurn(){
		var move:Int = Std.random(3);
		if(move == 0){
			if(Reg.state.map_over.getTile(Std.int((this.x+16)/16), Std.int((this.y/16))) == 0){
				FlxTween.tween(this, {x:this.x+16}, Reg.tweenspeed, {complete:Reg.state.endTurn});
				this.facing = FlxObject.RIGHT;
				return;
			}
		}
		else if(move == 1){
			if(Reg.state.map_over.getTile(Std.int((this.x-16)/16), Std.int((this.y/16))) == 0){
				FlxTween.tween(this, {x:this.x-16},  Reg.tweenspeed, {complete:Reg.state.endTurn});
				this.facing = FlxObject.LEFT;
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
		takeTurn();
	}

	public function canSeeOther():Agent{
		for(p in Reg.state.otherAnimals){
			if(!p.alive)
				continue;
			if(p.x == this.x){
				if(p.y < this.y){
					for(i in Std.int(p.y/16) ... Std.int(this.y/16)){
						if(Reg.state.map_over.getTile(Std.int(this.x/16), i) > 0)
							return null;
					}
					return p;
				}
				else{
					for(i in Std.int(this.y/16) ... Std.int(p.y/16)){
						if(Reg.state.map_over.getTile(Std.int(this.x/16), i) > 0)
							return null;
					}
					return p;
				}
			}
			else if(p.y == this.y){
				if(p.x < this.x){
					for(i in Std.int(p.x/16) ... Std.int(this.x/16)){
						if(Reg.state.map_over.getTile(i,Std.int(this.y/16)) > 0){
							return null;
						}
					}
					return p;
				}
				else{
					for(i in Std.int(this.x/16) ... Std.int(p.x/16)){
						if(Reg.state.map_over.getTile(i,Std.int(this.y/16)) > 0)
							return null;
					}
					return p;
				}
			}
		}
		return null;
	}

	public function canSeePlayer(){
		var p:Player = Reg.state.player;
		if(p.x == this.x){
			if(p.y < this.y){
				for(i in Std.int(p.y/16) ... Std.int(this.y/16)){
					if(Reg.state.map_over.getTile(Std.int(this.x/16), i) > 0)
						return false;
				}
				return true;
			}
			else{
				for(i in Std.int(this.y/16) ... Std.int(p.y/16)){
					if(Reg.state.map_over.getTile(Std.int(this.x/16), i) > 0)
						return false;
				}
				return true;
			}
		}
		else if(p.y == this.y){
			if(p.x < this.x){
				for(i in Std.int(p.x/16) ... Std.int(this.x/16)){
					if(Reg.state.map_over.getTile(i,Std.int(this.y/16)) > 0)
						return false;
				}
				return true;
			}
			else{
				for(i in Std.int(this.x/16) ... Std.int(p.x/16)){
					if(Reg.state.map_over.getTile(i,Std.int(this.y/16)) > 0)
						return false;
				}
				return true;
			}
		}
		return false;
	}

	public function canSensePlayer(){
		var p:Player = Reg.state.player;
		var dx = Math.abs(p.x - this.x)/16;
		var dy = Math.abs(p.y - this.y)/16;
		if(dx <= 2 && dy <= 2){
			return true;
		}
		return false;
	}

	override public function update(){
		super.update();
	}

}