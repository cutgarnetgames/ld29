package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tile.FlxTileblock;
import flixel.tweens.FlxTween;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;


/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{

	public var showingCredits:Bool = false;

	public var title:FlxText;
	public var option_start:FlxText;
	public var option_exit:FlxText;
	public var option_credits:FlxText;
	public var credits:FlxText;

	public var sel:FlxSprite;
	public var selected:Int = 0;
	public var sellimit:Int = 1;

	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();

		#if desktop
			Reg.ms = "ogg";
			sellimit = 2;
		#end

		FlxG.camera.fade(0xff000000,0.5,true);

		FlxG.camera.bgColor = 0xff7A491E;

		var t:FlxTileblock = new FlxTileblock(0,0,FlxG.width*2,FlxG.height);
		t.loadTiles("assets/images/dirt_single.png");
		add(t);

		title = new FlxText(16,16,FlxG.width-32,"Hare's Harvest",16);
		title.font = "assets/data/font.ttf";
		title.color = 0xff33A617;
		add(title);

		//FlxTween.tween(title, {y:12}, 1, {type:FlxTween.PINGPONG});

		var carrot:FlxSprite = new FlxSprite(2*FlxG.width/3,12,"assets/images/carrot_single.png");
		add(carrot);
		FlxTween.tween(carrot, {y:24}, 1, {type:FlxTween.PINGPONG});

		option_start = new FlxText(16,80,FlxG.width-32,"Start Game", 8);
		option_start.alignment = "center";
		option_start.font = "assets/data/font.ttf";
		add(option_start);
		option_credits = new FlxText(16,96,FlxG.width-32,"Credits", 8);
		option_credits.alignment = "center";
		option_credits.font = "assets/data/font.ttf";
		add(option_credits);
		option_exit = new FlxText(16,112,FlxG.width-32,"Exit", 8);
		option_exit.font = "assets/data/font.ttf";
		option_exit.alignment = "center";
		#if desktop
			add(option_exit);
		#end

		sel = new FlxSprite(32,80);
		sel.loadGraphic("assets/images/rabbit_strip_2.png",true);
		sel.animation.add("idle",[0,1],4,true); sel.animation.play("idle");
		add(sel);

		var credits_header = new FlxText(FlxG.width,8,FlxG.width,"Hare's Harvest",8);
		credits_header.alignment = "center";
		credits_header.font = "assets/data/font.ttf";
		credits_header.color = Reg.C_CARROT;
		add(credits_header);
		credits = new FlxText(FlxG.width,24,FlxG.width,
			"Made in 48 hours for Ludum Dare 29\n"+
			"by Michael Cook\n"+
			"www.cutgar.net/games\n"+
			"\n"+
			"With huge thanks to\n"+
			"Azalea Raad\n"+
			"For sound advice\n"+
			"(and sound advice)\n"+
			"and years of help and love\n"+
			"\n"+
			"Press Escape to return"
			,8);
		credits.alignment = "center";
		//credits.font = "assets/data/font.ttf";
		add(credits);

		FlxG.sound.playMusic("assets/music/main."+Reg.ms,0.15,true);
		/*Reg.music = FlxG.sound.load("assets/music/main_quieter.ogg",0.4,true,false);
		Reg.overmusic = FlxG.sound.load("assets/music/main.ogg",0.4,true,false);
		Reg.undermusic = FlxG.sound.load("assets/music/under.ogg",0.4,true,false);
		Reg.overmusic.play(true);
		Reg.undermusic.play(true);
		Reg.undermusic.volume = 0;*/

	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();


		if(!showingCredits && FlxG.keys.anyJustPressed(["UP"]) && selected > 0){
			selected--;
			sel.y -= 16;
			sel.x -= 16;
			FlxG.sound.play("assets/sounds/gravelwalk1."+Reg.ms);
		}
		else if(!showingCredits && FlxG.keys.anyJustPressed(["DOWN"]) && selected < sellimit){
			selected++;
			sel.y += 16;
			sel.x += 16;
			FlxG.sound.play("assets/sounds/gravelwalk2."+Reg.ms);
		}

		if(!showingCredits && FlxG.keys.anyJustPressed(["ENTER","SPACE"])){
			if(selected == 0){
				Reg.level = 0;
				FlxG.sound.play("assets/sounds/eat_carrot1."+Reg.ms);
				FlxG.camera.fade(0xff000000,1,false,function(){FlxG.switchState(new Prelevel());});
			}
			if(selected == 1){
				showingCredits = true;
				//credits.y = FlxG.height;
				FlxG.camera.scroll.x += FlxG.width;
				//FlxTween.tween(credits,{y:-FlxG.height},15);
			}
			if(selected == 2){
				#if desktop
					Sys.exit(0);
				#end
			}
		}
		else if(showingCredits && FlxG.keys.anyJustPressed(["ENTER","SPACE","ESCAPE"])){
			showingCredits = false;
			FlxG.camera.scroll.x -= FlxG.width;
			showingCredits = false;
		}
	}	
}