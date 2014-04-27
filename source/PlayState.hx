package;

import flixel.FlxObject;
import flixel.tweens.FlxEase;
import flixel.group.FlxGroup;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.tweens.FlxTween;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxStringUtil;
import flixel.util.FlxTimer;


/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{

	public var levelend:Bool = false;
	public var levelcomplete:Bool = false;
	public var playersturn:Bool;

	public var player:Player;
	public var turnorder:Array<FlxSprite>; public var next:Int = 0;
	public var grates:FlxGroup;
	public var carrots:FlxGroup;
	public var baddies:FlxGroup;
	public var otherAnimals:Array<Agent>;

	public var map_over:FlxTilemap;
	public var map_under:FlxTilemap;

	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		Reg.state = this;

		grates = new FlxGroup();
		carrots = new FlxGroup();
		baddies = new FlxGroup();
		otherAnimals = [];

		LevelManager.loadLevel(Reg.level, this);

		add(grates);
		add(carrots);
		add(player);
		add(baddies);

		FlxG.worldBounds.width = map_over.width*2;

		FlxG.camera.bgColor = Reg.COLOR_GRASS;
		FlxG.camera.fade(0xff000000,0.5,true);

		FlxTimer.start(2+Std.random(5), sing,1);


	}

	public function sing(t){
		FlxG.sound.play("assets/sounds/birdsong"+(Std.random(6)+1)+"."+Reg.ms,1,false,true); 
		FlxTimer.start(2+Std.random(5), sing,1);
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	var tweenspeed:Float = 0.2;

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();

		if(levelcomplete){
			if(FlxG.keys.anyJustPressed(["SPACE"])){
				FlxG.camera.fade(0xff000000,1,false,function(){Reg.level++;FlxG.switchState(new Prelevel());});
			}
			return;
		}

		if(FlxG.keys.anyJustPressed(["R"])){
			if(!player.over){
				FlxTween.tween(FlxG.sound.music,{volume:FlxG.sound.music.volume*10},0.5);
			}
			FlxG.camera.fade(0xff000000,1,false,function(){FlxG.switchState(new PlayState());});
		}
		if(levelend && FlxG.keys.anyJustPressed(["SPACE"])){
			FlxG.camera.fade(0xff000000,1,false,function(){FlxG.switchState(new Prelevel());});
		}
		

		if(next == 0){
			if(player.over){
				if(FlxG.keys.anyJustPressed(["RIGHT"])){
					if(map_over.getTile(Std.int((player.x+16)/16), Std.int((player.y/16))) == 0){
						player.animation.play("run");
						player.facing = FlxObject.RIGHT;
						FlxTween.tween(player, {x:player.x+16}, tweenspeed, {complete:this.endTurn});
						next = -1;
					}
				}
				else if(FlxG.keys.anyJustPressed(["LEFT"])){
					if(map_over.getTile(Std.int((player.x-16)/16), Std.int((player.y/16))) == 0){
						player.animation.play("run");
						player.facing = FlxObject.LEFT;
						FlxTween.tween(player, {x:player.x-16}, tweenspeed, {complete:this.endTurn});
						next = -1;
					}
				}
				if(FlxG.keys.anyJustPressed(["UP"])){
					if(map_over.getTile(Std.int((player.x)/16), Std.int(((player.y-16)/16))) == 0){
						player.animation.play("run");
						FlxTween.tween(player, {y:player.y-16}, tweenspeed, {complete:this.endTurn});
						next = -1;
					}
				}
				else if(FlxG.keys.anyJustPressed(["DOWN"])){
					if(map_over.getTile(Std.int((player.x)/16), Std.int(((player.y+16)/16))) == 0){
						player.animation.play("run");
						FlxTween.tween(player, {y:player.y+16}, tweenspeed, {complete:this.endTurn});
						next = -1;
					}
				}
			}
			else{
				var offpx = player.x - map_over.width;
				if(FlxG.keys.anyJustPressed(["RIGHT"])){
					if(map_under.getTile(Std.int((offpx+16)/16), Std.int((player.y/16))) == 0){
						player.animation.play("run");
						player.facing = FlxObject.RIGHT;
						FlxTween.tween(player, {x:player.x+16}, tweenspeed, {complete:this.endTurn});
						next = -1;
						FlxG.sound.play("assets/sounds/gravelwalk"+(Std.random(2)+1)+"."+Reg.ms,0.8);
					}
				}
				else if(FlxG.keys.anyJustPressed(["LEFT"])){
					if(map_under.getTile(Std.int((offpx-16)/16), Std.int((player.y/16))) == 0){
						player.animation.play("run");
						player.facing = FlxObject.LEFT;
						FlxTween.tween(player, {x:player.x-16}, tweenspeed, {complete:this.endTurn});
						next = -1;
						FlxG.sound.play("assets/sounds/gravelwalk"+(Std.random(2)+1)+"."+Reg.ms,0.8);
					}
				}
				if(FlxG.keys.anyJustPressed(["UP"])){
					if(map_under.getTile(Std.int((offpx)/16), Std.int(((player.y-16)/16))) == 0){
						player.animation.play("run");
						FlxTween.tween(player, {y:player.y-16}, tweenspeed, {complete:this.endTurn});
						next = -1;
						FlxG.sound.play("assets/sounds/gravelwalk"+(Std.random(2)+1)+"."+Reg.ms,0.8);
					}
				}
				else if(FlxG.keys.anyJustPressed(["DOWN"])){
					if(map_under.getTile(Std.int(offpx/16), Std.int(player.y/16)+1) == 0){
						player.animation.play("run");
						FlxTween.tween(player, {y:player.y+16}, tweenspeed, {complete:this.endTurn});
						next = -1;
						FlxG.sound.play("assets/sounds/gravelwalk"+(Std.random(2)+1)+"."+Reg.ms,0.8);
					}
				}
			}
		}

		if(FlxG.keys.anyJustPressed(["Q"])){
			playersturn = true;
		}

		FlxG.overlap(carrots, player, function(ii, jj){
			ii.kill();
			trace("NOM");
			//play a noise
			FlxG.sound.play("assets/sounds/munch1"+(Std.random(7)+1)+"."+Reg.ms);
		});

		FlxG.collide(map_over, player);
		FlxG.collide(map_under, player);
		player.changed = false;
		if(next == 0 && FlxG.keys.anyJustPressed(["SPACE"])){
			if(player.over){
				(FlxG.overlap(grates, player, 
					function(hole, player){
						if(!hole.closed && !player.changed){
							if(hole.closes)
								cast(hole,Grate).close();
							FlxG.camera.flash(0xff000000,0.2);
							player.x += map_over.width;
							trace(map_over.width);
							FlxG.camera.scroll.x += map_over.width;
							player.over = false;
							player.changed = true;
							//FlxG.sound.playMusic("assets/music/under.ogg",0.3,true);
							//Reg.undermusic.play(false);
							//Reg.overmusic.pause();
							FlxTween.tween(FlxG.sound.music,{volume:FlxG.sound.music.volume/10},0.5);
							//endTurn();
						}
					}));
			}
			else{
				(FlxG.overlap(grates, player, 
					function(hole, player){
						if(!hole.closed && !player.changed){
							if(hole.closes)
								cast(hole,Grate).close();
							FlxG.camera.flash(0xff000000,0.2);
							player.x -= Std.int(map_over.width);
							trace(map_over.width);
							FlxG.camera.scroll.x -= map_over.width;
							player.over = true;
							player.changed = true;
							FlxTween.tween(FlxG.sound.music,{volume:FlxG.sound.music.volume*10},0.5);
							//Reg.overmusic.play(false);
							//Reg.undermusic.pause();
							//FlxG.sound.playMusic("assets/music/main.ogg",0.3,true);
							//endTurn();
						}
					}));
			}
		}

		if(carrots.countLiving() == 0){
			levelcomplete = true;
			var wintext:FlxText = new FlxText(0,-100,200,"Level Complete!");
			wintext.alignment = "center";
			wintext.font = "assets/data/font.ttf";
			add(wintext);
			FlxTween.tween(wintext, {y:32},1, {ease: FlxEase.quadInOut,complete:carrotslap});
			var wintext:FlxText = new FlxText(0,-100,200,"Press Space To Continue");
			wintext.alignment = "center";
			wintext.font = "assets/data/font.ttf";
			add(wintext);
			FlxTween.tween(wintext, {y:96},1, {ease: FlxEase.quadInOut});
		}

		(FlxG.overlap(baddies,player,function(ii,jj){cast(ii,Agent).taunt(); die();}));

		if(FlxG.keys.anyJustPressed(["Q"]))
			trace(player.x+","+player.y);
	}	

	var the_carrot:FlxSprite;

	public function carrotslap(tween:FlxTween){
		var carrotbig:FlxSprite = new FlxSprite(FlxG.width/2-32, -100, "assets/images/carrotstrip.png");
		carrotbig.loadGraphic("assets/images/carrotstrip.png",true,false,64,64);
		carrotbig.animation.add("idle",[0]);
		carrotbig.animation.add("munch",[0,1,2,3],2, false);
		carrotbig.animation.play("idle");
		the_carrot = carrotbig;
		add(carrotbig);
		FlxTween.tween(carrotbig, {y:(FlxG.height-64)/2},0.5,{ease: FlxEase.quadInOut, complete:munchcarrot});
	}

	public function munchcarrot(tween:FlxTween){
		the_carrot.animation.play("munch");
		FlxTimer.start(0.5, function(i){
			crunchdown();
			},3
		);
	}
	

	public function crunchdown(){
		//FlxG.sound.play("assets/sounds/eat_carrot"+(Std.random(3)+1)+"."+Reg.ms);
		FlxG.sound.play("assets/sounds/crunch"+(Std.random(6)+1)+"."+Reg.ms);
	}

	public function endTurn(tween:FlxTween){
		//for(actor in )
		if(next == -1){
			next = 0;
			player.animation.play("idle_move");
		}
		next++;
		if(next >= turnorder.length){
			next = 0;
			return;
		}
		if(next > 0 && !levelcomplete && !levelend){
			cast(turnorder[next],Agent).takeTurn();
		}
		
	}

	public function die(){
		player.kill();
		levelend = true;
		var wintext:FlxText = new FlxText(0,32,200,"Hare Was Caught");
		wintext.alignment = "center";
		wintext.alpha = 0;
		wintext.font = "assets/data/font.ttf";
		add(wintext);
		FlxTween.tween(wintext, {alpha:1},1, {ease: FlxEase.quadInOut});
		var wintext:FlxText = new FlxText(0,64,200,"Press R To Retry");
		wintext.alignment = "center";
		wintext.alpha = 0;
		wintext.font = "assets/data/font.ttf";
		add(wintext);
		FlxTween.tween(wintext, {alpha:1},1, {ease: FlxEase.quadInOut});
	}
}