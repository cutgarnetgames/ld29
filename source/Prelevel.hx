import flixel.group.FlxGroup;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tile.FlxTileblock;
import flixel.tile.FlxTilemap;
import flixel.tweens.FlxTween;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxStringUtil;

class Prelevel extends FlxState{

	var story:FlxText;
	var guide:FlxText;
	var end:FlxText;
	
	override public function create():Void
	{
		if(Reg.music == null){
			//Reg.music = FlxG.sound.load("assets/music/main_quieter.ogg",0.4,true,false);
			//Reg.music.play(false);
		}
		if(Reg.level == 3){
			//Reg.music = FlxG.sound.load("assets/music/main_quieter.ogg",0.4,true,false);
			FlxG.sound.playMusic("assets/music/under3."+Reg.ms,0.6,true);
		}
		if(Reg.level == 8){
			//Reg.music = FlxG.sound.load("assets/music/main_quieter.ogg",0.4,true,false);
			FlxG.sound.playMusic("assets/music/farmer."+Reg.ms,0.4,true);
		}
		

		FlxG.camera.bgColor = Reg.COLOR_GRASS;

		var hedges:FlxTileblock = new FlxTileblock(-8,Std.int(FlxG.height/3),FlxG.width+16,16);
		hedges.loadTiles("assets/images/hedge_single.png");

		add(hedges);

		var dado:FlxTilemap = new FlxTilemap();
		dado.y = 16+FlxG.height/3;
		dado.x = -12;
		var map:Array<Int> = [
		1,1,1,1,1,1,1,1,1,1,1,1,1,1,
		1,1,0,0,0,0,0,0,0,0,0,0,1,1,
		1,1,0,0,0,0,0,0,0,0,0,0,1,1,
		1,1,0,0,0,0,0,0,0,0,0,0,1,1,
		1,1,0,0,0,0,0,0,0,0,0,0,1,1,
		1,1,0,0,0,0,0,0,0,0,0,0,1,1,
		1,1,0,0,0,0,0,0,0,0,0,0,1,1,
		1,1,0,0,0,0,0,0,0,0,0,0,1,1,
		];
		dado.loadMap(FlxStringUtil.arrayToCSV(map, 14), "assets/images/tiles_under.png",16,16,0,0,0);
		add(dado);

		story = new FlxText(8, 16, FlxG.width-16, Reg.story[Reg.level]);
		story.alignment = "center";
		story.font = "assets/data/font.ttf";
		add(story);

		guide = new FlxText(16, 8+FlxG.height/2, FlxG.width-32, Reg.guide[Reg.level]);
		guide.alignment = "center";
		guide.font = "assets/data/font.ttf";
		guide.color = Reg.GRASS_LIGHT;
		add(guide);

		end = new FlxText(16, FlxG.height-16, FlxG.width-32, "Press Space");
		end.alignment = "center";
		end.font = "assets/data/font.ttf";
		//end.color = Reg.GRASS_LIGHT;
		add(end);

		FlxG.camera.fade(0xff000000,0.5,true);
	}

	override public function update():Void
	{
		super.update();
		if(FlxG.keys.anyJustPressed(["SPACE"])){
			if(Reg.level == 11){
				FlxG.camera.fade(0xff000000,0.5,false,function(){FlxG.switchState(new EndState());});
			}
			else
				FlxG.camera.fade(0xff000000,0.5,false,function(){FlxG.switchState(new PlayState());});
		}
	}

}