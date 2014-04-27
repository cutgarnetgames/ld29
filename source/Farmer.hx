import flixel.util.FlxPoint;

import flixel.*;
import flixel.tweens.*;

class Farmer extends Agent{

	public var turnsUntilNextTurn:Int = 4;
	public var fired:Bool = false;
	public var glancing:Bool = false;
	public var shotOther:Bool = false;
	public var target:FlxSprite;
	
	public function new(x:Float, y:Float, ?glancing:Bool=false){
		super(x*16, y*16);
		this.glancing = glancing;
		loadGraphic("assets/images/farmerstrip.png",true,true,16,16);
		animation.add("idle",[7,8],4,true);
		animation.play("idle");
		animation.add("fire",[0,1,2,3,4,5,6,2,1,0], 12,false);

	}

	override public function takeTurn(){
		var thing = null;
		if(Reg.state.player.over && canSeePlayer()){
			if(Reg.state.player.x < this.x && this.facing == FlxObject.LEFT){
				animation.play("fire");
				fired = true;
				FlxG.sound.play("assets/sounds/gunshot."+Reg.ms);
			}
			else if(Reg.state.player.x > this.x && this.facing == FlxObject.RIGHT){
				animation.play("fire");
				fired = true;
				FlxG.sound.play("assets/sounds/gunshot."+Reg.ms);
			}
			else{
				turnsUntilNextTurn--;
				if(glancing && turnsUntilNextTurn <= 0){
					if(this.facing == FlxObject.LEFT){
						this.facing = FlxObject.RIGHT;
					}
					else if(this.facing == FlxObject.RIGHT){
						this.facing = FlxObject.LEFT;
					}
					animation.play("fire");
					fired = true;
					FlxG.sound.play("assets/sounds/gunshot."+Reg.ms);
					turnsUntilNextTurn = 4;
				}
				else
					Reg.state.endTurn(null);
			}
			
		}
		else if(Reg.state.player.over && canSeeOther() != null){
			target = canSeeOther();
			if(target.x < this.x && this.facing == FlxObject.LEFT){
				animation.play("fire");
				shotOther = true;
				FlxG.sound.play("assets/sounds/gunshot."+Reg.ms);
			}
			else if(target.x > this.x && this.facing == FlxObject.RIGHT){
				animation.play("fire");
				shotOther = true;
				FlxG.sound.play("assets/sounds/gunshot."+Reg.ms);
			}
			else{
				turnsUntilNextTurn--;
				if(glancing && turnsUntilNextTurn <= 0){
					if(this.facing == FlxObject.LEFT){
						this.facing = FlxObject.RIGHT;
					}
					else if(this.facing == FlxObject.RIGHT){
						this.facing = FlxObject.LEFT;
					}
					animation.play("fire");
					shotOther = true;
					FlxG.sound.play("assets/sounds/gunshot."+Reg.ms);
					turnsUntilNextTurn = 4;
				}
				else
					Reg.state.endTurn(null);
			}
		}
		else{
			//Can't see anyone
			turnsUntilNextTurn--;
			if(glancing && turnsUntilNextTurn <= 0){
				if(this.facing == FlxObject.LEFT){
					this.facing = FlxObject.RIGHT;
				}
				else if(this.facing == FlxObject.RIGHT){
					this.facing = FlxObject.LEFT;
				}
				turnsUntilNextTurn = 4;
			}
			Reg.state.endTurn(null);
		}
	}



	override public function update(){
		super.update();
		if(fired && animation.curAnim == null){
			Reg.state.die();
		}
		if(shotOther && animation.curAnim == null){
			//target.kill();
			target.alive = false;
			FlxTween.tween(target, {alpha:0},0.5,{complete:function(ii){target.kill();}});
			//target = null;
			shotOther = false;
			Reg.state.endTurn(null);
		}
	}

}