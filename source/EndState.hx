import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tile.FlxTileblock;
import flixel.tweens.FlxTween;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.tile.FlxTilemap;
import flixel.util.FlxStringUtil;
import flixel.FlxObject;
import flixel.util.FlxTimer;

class EndState extends FlxState{

	public var map_over:FlxTilemap;
	var rabbit:FlxSprite;
	var carrots:Array<Carrot>;
	var nextcarrot:Int = 0;

	public function hopfirst(){
		FlxTween.tween(rabbit,{x:rabbit.x-8},0.2,{complete:munch});
		rabbit.animation.play("run");
	}

	public function hop(jj){
		FlxTween.tween(rabbit,{x:carrots[nextcarrot].x+12},0.2,{complete:munch});
		rabbit.animation.play("run");
	}

	public function munch(jj){
		if(nextcarrot >= 11){
			FlxTimer.start(1.2,function(i){FlxG.sound.play("assets/sounds/eat_carrot"+(Std.random(3)+1)+"."+Reg.ms,1);},100);
			return;
		}
		rabbit.animation.play("idle");
		FlxTween.tween(carrots[nextcarrot], {alpha:0},1,{complete:hop});
		nextcarrot++;
		FlxG.sound.play("assets/sounds/eat_carrot"+(Std.random(3)+1)+"."+Reg.ms,1);
	}

	override public function create():Void
	{

		FlxG.camera.bgColor = Reg.COLOR_GRASS;
		FlxG.camera.fade(0xff000000,0.5,true,hopfirst);
		FlxG.sound.playMusic("assets/music/main."+Reg.ms,0.2,true);

		var map_over_raw:Array<Int> = [
		1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
		0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,1, 0,0,0,0,1,
		0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,1, 0,0,0,0,1,
		0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,1, 0,0,0,0,1,
		0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,1, 0,0,0,0,1,

		0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,1, 0,0,0,0,1,
		0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,1, 0,0,0,0,1,
		0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,1, 0,0,0,0,1,
		0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,1, 0,0,0,0,1,
		1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 0,0,0,0,1,
		];

		map_over = new FlxTilemap();
		map_over.loadMap(FlxStringUtil.arrayToCSV(map_over_raw, 20),"assets/images/tiles.png",16,16,0,0,0);
		add(map_over);

		for(i in 0...13){
			for(j in 1...9){
				if((j == 4) || (j == 8 && i > 0) || (j == 1 && i > 0)
					|| (i%3 == 0 && (j == 2 || j == 3 || j == 6 || j == 7))
					|| i == 6 || i == 12 || i == 0){
					continue;
				}
				var c:Carrot = new Carrot(i,j);
				add(c);
			}
		}

		carrots = [];
		for(i in -2...13){
			if(i == 6 || i == 12 || i == 0)
				continue;
			var carrot = new Carrot(i,4); add(carrot);
			carrots.insert(0,carrot);
		}

		rabbit = new FlxSprite(12*16,4*16);
		rabbit.loadGraphic("assets/images/rabbit_strip_2.png",true,true,16,16);
		//rabbit.animation.add("idle", [0]);
		rabbit.animation.add("idle", [0,1], 4, true);
		rabbit.animation.play("idle");
		rabbit.animation.add("run", [2,3], 10, true);
		rabbit.facing = FlxObject.LEFT;
		add(rabbit);

		var end:FlxText = new FlxText(0,16,FlxG.width,"Thanks for playing!",8);
		end.font = "assets/data/font.ttf";
		end.alignment = "center";
		add(end);

		end = new FlxText(0,FlxG.height-24,FlxG.width,"Press Escape to end",8);
		end.font = "assets/data/font.ttf";
		end.alignment = "center";
		add(end);
	}	

	override public function update():Void
	{
		super.update();

		if(FlxG.keys.anyJustPressed(["ESCAPE","SPACE","ENTER"])){
			FlxG.camera.fade(0xff000000,0.5,false,function(){FlxG.switchState(new MenuState());});
		}
	}
	

}