
import flixel.FlxObject;
import flixel.group.FlxGroup;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.tweens.FlxTween;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxRect;
import flixel.util.FlxStringUtil;


class LevelManager{
	
	static public function loadLevel(level:Int, state:PlayState){
		switch(level){
			//Level 1 - Eating Carrots
			case 0:
				var map_over_raw:Array<Int> = [
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,0,0,0,0, 0,0,0,0,0, 1,0,0,0,1, 0,0,0,0,1,
				1,0,0,0,0, 0,0,0,0,0, 1,0,0,0,1, 0,0,0,0,1,
				1,0,0,0,0, 0,0,0,0,0, 1,0,0,0,1, 0,0,0,0,1,
				1,1,1,1,1, 1,1,0,0,0, 1,0,0,0,1, 0,0,0,0,1,

				1,0,0,0,0, 0,1,0,0,0, 1,0,0,0,1, 0,0,0,0,1,
				1,0,0,0,0, 0,1,0,0,0, 1,0,0,0,1, 0,0,0,0,1,
				1,0,0,0,0, 0,1,0,0,0, 1,0,0,0,1, 0,0,0,0,1,
				1,0,0,0,0, 0,1,0,0,0, 1,0,0,0,1, 0,0,0,0,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 0,0,0,0,1,
				];

				state.map_over = new FlxTilemap();
				state.map_over.loadMap(FlxStringUtil.arrayToCSV(map_over_raw, 20),"assets/images/tiles.png",16,16,0,0,0);
				state.add(state.map_over);

				var map_under_raw:Array<Int> = [
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,

				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				];

				state.map_under = new FlxTilemap();
				state.map_under.x = state.map_over.x + state.map_over.width;
				state.map_under.loadMap(FlxStringUtil.arrayToCSV(map_under_raw, 20),"assets/images/tiles_under.png",16,16,0,0,0);
				state.add(state.map_under);

				var c:Carrot = new Carrot(4, 2);
				state.carrots.add(c);
				var c:Carrot = new Carrot(6, 2);
				state.carrots.add(c);
				var c:Carrot = new Carrot(8, 2);
				state.carrots.add(c);
				var c:Carrot = new Carrot(8, 4);
				state.carrots.add(c);
				var c:Carrot = new Carrot(8, 6);
				state.carrots.add(c);

				state.player = new Player(32, 32);
				state.turnorder = [state.player];

			//Level 2: Using burrows
			case 1:
				var map_over_raw:Array<Int> = [
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,0,0,0,0, 0,0,0,0,1, 0,0,0,0,1, 0,0,0,0,1,
				1,0,0,0,0, 0,0,0,0,1, 0,0,0,0,1, 0,0,0,0,1,
				1,0,0,0,0, 0,0,0,0,1, 0,0,0,0,1, 0,0,0,0,1,
				1,1,1,1,1, 1,1,1,1,1, 0,0,0,0,1, 0,0,0,0,1,

				1,0,0,0,1, 0,0,0,0,1, 0,0,0,0,1, 0,0,0,0,1,
				1,0,0,0,1, 0,0,0,0,1, 0,0,0,0,1, 0,0,0,0,1,
				1,0,0,0,1, 0,0,0,0,1, 0,0,0,0,1, 0,0,0,0,1,
				1,0,0,0,1, 0,0,0,0,1, 0,0,0,0,1, 0,0,0,0,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 0,0,0,0,1,
				];

				state.map_over = new FlxTilemap();
				state.map_over.loadMap(FlxStringUtil.arrayToCSV(map_over_raw, 20),"assets/images/tiles.png",16,16,0,0,0);
				state.add(state.map_over);

				var map_under_raw:Array<Int> = [
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,0,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,0,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,0,1,1, 1,1,1,1,1, 1,1,1,1,1,

				1,1,1,1,1, 1,1,0,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,0,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,0,0,0, 0,0,0,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				];

				state.map_under = new FlxTilemap();
				state.map_under.x = state.map_over.x + state.map_over.width;
				state.map_under.loadMap(FlxStringUtil.arrayToCSV(map_under_raw, 20),"assets/images/tiles_under.png",16,16,0,0,0);
				state.add(state.map_under);

				var c:Carrot = new Carrot(3, 2);
				state.carrots.add(c);
				var c:Carrot = new Carrot(4, 2);
				state.carrots.add(c);
				var c:Carrot = new Carrot(5, 2);
				state.carrots.add(c);
				var c:Carrot = new Carrot(1, 7);
				state.carrots.add(c);
				var c:Carrot = new Carrot(8, 7);
				state.carrots.add(c);

				var g:Grate = new Grate(7,7);
				state.grates.add(g);
				g = new Grate(7,2);
				state.grates.add(g);
				g = new Grate(2,7);
				state.grates.add(g);
				g = new Grate(7+20, 2, true);
				state.grates.add(g);
				g = new Grate(2+20, 7, true);
				state.grates.add(g);
				g = new Grate(7+20, 7, true);
				state.grates.add(g);

				state.player = new Player(16, 16);
				state.turnorder = [state.player];

			//Avoiding foxes
			case 2:
				var map_over_raw:Array<Int> = [
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,0,0,0,0, 1,0,0,0,0, 1,1,0,0,1, 0,0,0,0,1,
				1,0,0,0,0, 1,0,0,0,0, 1,1,0,0,1, 0,0,0,0,1,
				1,0,0,0,0, 1,0,0,0,0, 1,1,0,0,1, 0,0,0,0,1,
				1,0,0,1,1, 1,1,0,1,1, 1,1,0,0,1, 0,0,0,0,1,

				1,0,0,0,0, 0,0,0,0,0, 1,1,0,0,1, 0,0,0,0,1,
				1,0,0,1,1, 1,1,1,1,0, 1,1,0,0,1, 0,0,0,0,1,
				1,0,0,0,0, 1,1,0,0,0, 1,1,0,0,1, 0,0,0,0,1,
				1,0,0,0,0, 0,0,0,0,0, 1,1,0,0,1, 0,0,0,0,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 0,0,0,0,1,
				];

				state.map_over = new FlxTilemap();
				state.map_over.loadMap(FlxStringUtil.arrayToCSV(map_over_raw, 20),"assets/images/tiles.png",16,16,0,0,0,1);
				state.add(state.map_over);

				var map_under_raw:Array<Int> = [
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,

				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,0,0, 0,0,0,0,0, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				];

				state.map_under = new FlxTilemap();
				state.map_under.x = state.map_over.x + state.map_over.width;
				state.map_under.loadMap(FlxStringUtil.arrayToCSV(map_under_raw, 20),"assets/images/tiles_under.png",16,16,0,0,0);
				state.add(state.map_under);

				var c:Carrot = new Carrot(4, 3);
				state.carrots.add(c);
				c = new Carrot(4, 7);
				state.carrots.add(c);
				c = new Carrot(7, 2);
				state.carrots.add(c);
				c = new Carrot(7, 3);
				state.carrots.add(c);
				c = new Carrot(8, 2);
				state.carrots.add(c);
				c = new Carrot(8, 3);
				state.carrots.add(c);

				var g:Grate = new Grate(5,8);
				state.grates.add(g);
				g = new Grate(9,8);
				state.grates.add(g);
				g = new Grate(5+20, 8, true);
				state.grates.add(g);
				g = new Grate(9+20, 8, true);
				state.grates.add(g);

				state.player = new Player(16, 16);
				

				state.turnorder = [state.player];
				var f = new Fox(5,5);
				state.baddies.add(f);
				state.turnorder.push(f);
				var f = new Fox(8,8);
				state.baddies.add(f);
				state.turnorder.push(f);

			//The farmer
			case 3:
				var map_over_raw:Array<Int> = [
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,0,0,0,0, 1,0,0,0,0, 1,1,0,0,1, 0,0,0,0,1,
				1,0,0,0,0, 1,0,0,0,0, 1,1,0,0,1, 0,0,0,0,1,
				1,0,0,0,0, 1,0,0,0,0, 1,1,0,0,1, 0,0,0,0,1,
				1,0,0,1,1, 1,1,0,1,1, 1,1,0,0,1, 0,0,0,0,1,

				1,0,0,0,0, 0,0,0,0,0, 1,1,0,0,1, 0,0,0,0,1,
				1,0,0,1,1, 1,1,1,1,0, 1,1,0,0,1, 0,0,0,0,1,
				1,0,0,0,0, 1,1,0,0,0, 1,1,0,0,1, 0,0,0,0,1,
				1,0,0,0,0, 0,0,0,0,0, 1,1,0,0,1, 0,0,0,0,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 0,0,0,0,1,
				];

				state.map_over = new FlxTilemap();
				state.map_over.loadMap(FlxStringUtil.arrayToCSV(map_over_raw, 20),"assets/images/tiles.png",16,16,0,0,0,1);
				state.add(state.map_over);
				trace("WIDTH: "+state.map_over.width);
				trace("X: "+state.map_over.x);

				var map_under_raw:Array<Int> = [
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,0,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,0,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,0,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,

				1,1,0,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,0,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,0,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				];

				state.map_under = new FlxTilemap();
				state.map_under.x = state.map_over.x + state.map_over.width;
				state.map_under.loadMap(FlxStringUtil.arrayToCSV(map_under_raw, 20),"assets/images/tiles_under.png",16,16,0,0,0);
				state.add(state.map_under);

				var c:Carrot = new Carrot(4, 3);
				state.carrots.add(c);
				c = new Carrot(4, 7);
				state.carrots.add(c);
				c = new Carrot(7, 2);
				state.carrots.add(c);
				c = new Carrot(7, 3);
				state.carrots.add(c);
				c = new Carrot(8, 2);
				state.carrots.add(c);
				c = new Carrot(8, 3);
				state.carrots.add(c);

				var g:Grate = new Grate(2,2);
				state.grates.add(g);
				g = new Grate(2,7);
				state.grates.add(g);
				g = new Grate(2+20, 2, true);
				state.grates.add(g);
				g = new Grate(2+20, 7, true);
				state.grates.add(g);

				state.player = new Player(16, 16);
				

				state.turnorder = [state.player];
				var f = new Farmer(5,5);
				f.facing = FlxObject.LEFT;
				state.baddies.add(f);
				state.turnorder.push(f);
			
			//Crossfire	
			case 4:
				var map_over_raw:Array<Int> = [
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,0,0,0,0, 1,0,0,0,1, 0,0,0,0,1,
				1,0,0,0,0, 1,0,0,0,0, 1,0,0,0,1, 0,0,0,0,1,
				1,0,0,0,0, 0,0,0,0,0, 1,0,0,0,1, 0,0,0,0,1,
				1,1,0,1,1, 1,1,1,1,1, 1,0,0,0,1, 0,0,0,0,1,

				1,0,0,0,0, 0,0,0,0,0, 1,0,0,0,1, 0,0,0,0,1,
				1,0,0,1,1, 1,1,1,1,1, 1,0,0,0,1, 0,0,0,0,1,
				1,0,0,0,0, 1,1,0,0,0, 1,0,0,0,1, 0,0,0,0,1,
				1,1,1,0,0, 0,1,0,0,0, 1,0,0,0,1, 0,0,0,0,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 0,0,0,0,1,
				];

				state.map_over = new FlxTilemap();
				state.map_over.loadMap(FlxStringUtil.arrayToCSV(map_over_raw, 20),"assets/images/tiles.png",16,16,0,0,0);
				state.add(state.map_over);

				var map_under_raw:Array<Int> = [
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,0,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,0,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,

				1,0,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,0,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,0,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,0,0,0,0, 0,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				];

				state.map_under = new FlxTilemap();
				state.map_under.x = state.map_over.x + state.map_over.width;
				state.map_under.loadMap(FlxStringUtil.arrayToCSV(map_under_raw, 20),"assets/images/tiles_under.png",16,16,0,0,0);
				state.add(state.map_under);

				var c:Carrot = new Carrot(6, 1);
				state.carrots.add(c);
				c = new Carrot(7,1); state.carrots.add(c); 
				c = new Carrot(8,1); state.carrots.add(c); 
				c = new Carrot(9,1); state.carrots.add(c); 

				//HAHA OH GOD OH GOD
				var g:Grate = new Grate(1,3);
				state.grates.add(g);
				g = new Grate(5,8);
				state.grates.add(g);
				g = new Grate(1+20, 3, true);
				state.grates.add(g);
				g = new Grate(5+20, 8, true);
				state.grates.add(g);
				//HAHAHAHAHAHDAOSHDASHDJASHDSAJD

				state.player = new Player(16, 96);
				state.turnorder = [state.player];

				var f = new Farmer(5,5);
				f.facing = FlxObject.LEFT;
				state.baddies.add(f);
				var fox = new Fox(6,3);
				state.baddies.add(fox);
				state.otherAnimals.push(fox);
				state.turnorder.push(fox);
				state.turnorder.push(f);

			case 5:
				var map_over_raw:Array<Int> = [
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,0,0,0,0, 1,0,0,0,0, 1,0,0,0,1, 0,0,0,0,1,
				1,0,0,0,0, 1,0,0,0,0, 1,0,0,0,1, 0,0,0,0,1,
				1,0,0,0,0, 1,0,0,0,0, 1,0,0,0,1, 0,0,0,0,1,
				1,1,1,1,1, 1,1,1,1,1, 1,0,0,0,1, 0,0,0,0,1,

				1,0,0,0,0, 1,0,0,0,0, 1,0,0,0,1, 0,0,0,0,1,
				1,0,0,0,0, 0,0,0,0,0, 1,0,0,0,1, 0,0,0,0,1,
				1,0,0,0,0, 0,0,0,0,0, 1,0,0,0,1, 0,0,0,0,1,
				1,0,0,0,0, 1,0,0,0,0, 1,0,0,0,1, 0,0,0,0,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 0,0,0,0,1,
				];

				state.map_over = new FlxTilemap();
				state.map_over.loadMap(FlxStringUtil.arrayToCSV(map_over_raw, 20),"assets/images/tiles.png",16,16,0,0,0);
				state.add(state.map_over);

				var map_under_raw:Array<Int> = [
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,0,0,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,0,1,1, 1,1,0,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,0,1,1, 1,1,0,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,0,1,1, 1,1,0,1,1, 1,1,1,1,1, 1,1,1,1,1,

				1,1,0,1,1, 1,1,0,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,0,1,1, 1,1,0,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,0,1,1, 1,1,0,0,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				];

				state.map_under = new FlxTilemap();
				state.map_under.x = state.map_over.x + state.map_over.width;
				state.map_under.loadMap(FlxStringUtil.arrayToCSV(map_under_raw, 20),"assets/images/tiles_under.png",16,16,0,0,0);
				state.add(state.map_under);

				var c:Carrot = new Carrot(4, 2);
				state.carrots.add(c);
				c = new Carrot(5, 6);
				state.carrots.add(c);
				c = new Carrot(5, 7);
				state.carrots.add(c);
				c = new Carrot(7, 2);
				state.carrots.add(c);
				c = new Carrot(8, 2);
				state.carrots.add(c);

				var g:Grate = new Grate(2,2,false,true);
				state.grates.add(g);
				var g2:Grate = new Grate(2+20, 2, true,true);
				state.grates.add(g2);
				g.partner = g2; g2.partner = g;
				g= new Grate(2,7,false,true);
				state.grates.add(g);
				g2 = new Grate(2+20, 7, true,true);
				state.grates.add(g2);
				g.partner = g2; g2.partner = g;
				g= new Grate(8,7,false,true);
				state.grates.add(g);
				g2 = new Grate(8+20, 7, true,true);
				state.grates.add(g2);
				g.partner = g2; g2.partner = g;
				g= new Grate(6,1,false,true);
				state.grates.add(g);
				g2 = new Grate(6+20, 1, true,true);
				state.grates.add(g2);
				g.partner = g2; g2.partner = g;

				state.player = new Player(16, 16);
				state.turnorder = [state.player];
			
			//Holes that close
			//The Bridges Of Carrotsberg
			case 6:
				var map_over_raw:Array<Int> = [
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,0,0,0,0, 0,0,0,0,0, 0,1,0,0,1, 0,0,0,0,1,
				1,0,0,0,0, 0,0,0,0,0, 0,1,0,0,1, 0,0,0,0,1,
				1,0,0,0,0, 0,0,0,0,0, 0,1,0,0,1, 0,0,0,0,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,0,0,1, 0,0,0,0,1,

				1,0,0,0,0, 0,1,0,0,0, 0,1,0,0,1, 0,0,0,0,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,0,0,1, 0,0,0,0,1,
				1,0,0,0,0, 0,0,0,0,0, 0,1,0,0,1, 0,0,0,0,1,
				1,0,0,0,0, 0,0,0,0,0, 0,1,0,0,1, 0,0,0,0,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 0,0,0,0,1,
				];

				state.map_over = new FlxTilemap();
				state.map_over.loadMap(FlxStringUtil.arrayToCSV(map_over_raw, 20),"assets/images/tiles.png",16,16,0,0,0);
				state.add(state.map_over);

				var map_under_raw:Array<Int> = [
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,0,0,0, 0,0,0,0,0, 1,1,1,1,1, 1,1,1,1,1,
				1,1,0,1,1, 1,1,1,1,0, 1,1,1,1,1, 1,1,1,1,1,
				1,1,0,1,1, 1,1,1,1,0, 1,1,1,1,1, 1,1,1,1,1,

				1,1,0,1,1, 0,0,0,0,0, 1,1,1,1,1, 1,1,1,1,1,
				1,1,0,1,1, 0,1,1,1,0, 1,1,1,1,1, 1,1,1,1,1,
				1,1,0,1,1, 0,1,1,1,0, 1,1,1,1,1, 1,1,1,1,1,
				1,1,0,0,0, 0,0,0,0,0, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				];

				state.map_under = new FlxTilemap();
				state.map_under.x = state.map_over.x + state.map_over.width;
				state.map_under.loadMap(FlxStringUtil.arrayToCSV(map_under_raw, 20),"assets/images/tiles_under.png",16,16,0,0,0);
				state.add(state.map_under);

				var c:Carrot = new Carrot(1, 2);
				state.carrots.add(c);
				c = new Carrot(1,1); state.carrots.add(c);
				c = new Carrot(2,1); state.carrots.add(c);
				c = new Carrot(1,5); state.carrots.add(c);
				c = new Carrot(7,5); state.carrots.add(c);
				c = new Carrot(1,7); state.carrots.add(c);
				c = new Carrot(1,8); state.carrots.add(c);
				c = new Carrot(2,8); state.carrots.add(c);

				var g:Grate = new Grate(2,2, false, true);
				state.grates.add(g);
				var g2:Grate = new Grate(9,2, false, true);
				state.grates.add(g2);
				var g3:Grate = new Grate(2+20, 2, true, true);
				state.grates.add(g3);
				var g4:Grate = new Grate(9+20, 2, true, true);
				state.grates.add(g4);
				g.partner = g3; g3.partner = g;
				g2.partner = g4; g4.partner = g2;
				//I hate myself
				var g5:Grate = new Grate(9,5,false,true);
				var g6:Grate = new Grate(20+9,5,true,true);
				g5.partner = g6; g6.partner = g5;
				state.grates.add(g5); state.grates.add(g6);
				//And yet I continue to copy past
				g5 = new Grate(5,5,false,true);
				g6 = new Grate(20+5,5,true,true);
				g5.partner = g6; g6.partner = g5;
				state.grates.add(g5); state.grates.add(g6);
				g5 = new Grate(9,8,false,true);
				g6 = new Grate(20+9,8,true,true);
				g5.partner = g6; g6.partner = g5;
				state.grates.add(g5); state.grates.add(g6);
				g5 = new Grate(5,8,false,true);
				g6 = new Grate(20+5,8,true,true);
				g5.partner = g6; g6.partner = g5;
				state.grates.add(g5); state.grates.add(g6);

				state.player = new Player(8*16, 5*16);
				state.turnorder = [state.player];
				//FlxG.camera.follow(state.player);
				//FlxG.camera.deadzone = new FlxRect(0,0,Reg.state.map_over.width,Reg.state.map_under.width);

			//Harder puzzle
			case 7:
				var map_over_raw:Array<Int> = [
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,0,0,0,0, 0,0,0,0,0, 0,0,1,0,1, 0,0,0,0,1,
				1,0,0,0,1, 1,1,1,1,0, 1,0,1,0,1, 0,0,0,0,1,
				1,1,1,1,1, 0,1,0,1,0, 1,1,1,0,1, 0,0,0,0,1,
				1,0,0,0,1, 0,1,0,1,0, 0,0,1,0,1, 0,0,0,0,1,

				1,0,0,0,0, 0,0,0,0,0, 0,0,1,0,1, 0,0,0,0,1,
				1,0,0,0,1, 0,1,0,0,0, 1,0,1,0,1, 0,0,0,0,1,
				1,1,1,1,1, 1,1,1,1,1, 1,0,1,0,1, 0,0,0,0,1,
				1,0,0,0,0, 0,0,0,0,1, 0,0,1,0,1, 0,0,0,0,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 0,0,0,0,1,
				];

				state.map_over = new FlxTilemap();
				state.map_over.loadMap(FlxStringUtil.arrayToCSV(map_over_raw, 20),"assets/images/tiles.png",16,16,0,0,0);
				state.add(state.map_over);

				var map_under_raw:Array<Int> = [
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,0,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,0,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,0,1,1,1, 1,1,1,1,1,

				1,1,1,1,1, 1,1,1,1,1, 1,0,1,1,1, 1,1,1,1,1,
				1,1,0,0,0, 0,0,0,0,0, 0,0,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,0,0, 0,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				];

				state.map_under = new FlxTilemap();
				state.map_under.x = state.map_over.x + state.map_over.width;
				state.map_under.loadMap(FlxStringUtil.arrayToCSV(map_under_raw, 20),"assets/images/tiles_under.png",16,16,0,0,0);
				state.add(state.map_under);

				var c:Carrot = new Carrot(3, 2);
				state.carrots.add(c);
				c = new Carrot(2,2); state.carrots.add(c);
				c = new Carrot(1,2); state.carrots.add(c);

				c = new Carrot(1,5); state.carrots.add(c);
				c = new Carrot(2,5); state.carrots.add(c);
				c = new Carrot(3,5); state.carrots.add(c);

				var g:Grate = new Grate(2,6,false,true); state.grates.add(g);
				var h:Grate = new Grate(20+2,6,true,true); state.grates.add(h);
				g.partner = h; h.partner = g;

				g = new Grate(11,2,false,true); state.grates.add(g);
				h = new Grate(20+11,2,true,true); state.grates.add(h);
				g.partner = h; h.partner = g;
				g = new Grate(11,6,false,true); state.grates.add(g);
				h = new Grate(20+11,6,true,true); state.grates.add(h);
				g.partner = h; h.partner = g;		

				g = new Grate(8,8,false); state.grates.add(g);
				h = new Grate(20+8,8,true); state.grates.add(h);
				g.partner = h; h.partner = g;	

				g = new Grate(10,8,false); state.grates.add(g);
				h = new Grate(20+10,8,true); state.grates.add(h);
				g.partner = h; h.partner = g;		


				/*var g:Grate = new Grate(2,2,false,true);
				state.grates.add(g);
				var g2:Grate = new Grate(2+20, 2, true,true);
				state.grates.add(g2);
				g.partner = g2; g2.partner = g;
				g= new Grate(2,7,false,true);
				state.grates.add(g);
				g2 = new Grate(2+20, 7, true,true);
				state.grates.add(g2);
				g.partner = g2; g2.partner = g;
				g= new Grate(8,7,false,true);
				state.grates.add(g);
				g2 = new Grate(8+20, 7, true,true);
				state.grates.add(g2);
				g.partner = g2; g2.partner = g;
				g= new Grate(6,1,false,true);
				state.grates.add(g);
				g2 = new Grate(6+20, 1, true,true);
				state.grates.add(g2);
				g.partner = g2; g2.partner = g;*/

				state.player = new Player(16, 8*16);
				state.turnorder = [state.player];
				var fx = new Fox(9,2);
				state.baddies.add(fx);
				state.otherAnimals.push(fx);
				state.turnorder.push(fx);
				var f = new Farmer(4,5,true);
				state.baddies.add(f);
				state.turnorder.push(f);
				

			//Dog introduction
			case 8:
				var map_over_raw:Array<Int> = [
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,0,0,0,0, 1,0,0,0,0, 1,0,0,0,1, 0,0,0,0,1,
				1,0,0,0,0, 1,0,0,0,0, 1,0,0,0,1, 0,0,0,0,1,
				1,0,1,1,0, 1,0,0,0,0, 1,0,0,0,1, 0,0,0,0,1,
				1,1,1,0,0, 1,0,0,0,0, 1,0,0,0,1, 0,0,0,0,1,

				1,0,1,0,1, 1,1,0,0,0, 1,0,0,0,1, 0,0,0,0,1,
				1,0,0,0,0, 0,1,0,0,0, 1,0,0,0,1, 0,0,0,0,1,
				1,0,0,0,0, 1,1,0,0,0, 1,0,0,0,1, 0,0,0,0,1,
				1,0,0,0,0, 1,0,0,0,0, 1,0,0,0,1, 0,0,0,0,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 0,0,0,0,1,
				];

				state.map_over = new FlxTilemap();
				state.map_over.loadMap(FlxStringUtil.arrayToCSV(map_over_raw, 20),"assets/images/tiles.png",16,16,0,0,0);
				state.add(state.map_over);

				var map_under_raw:Array<Int> = [
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,0,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,0,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,0,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,

				1,1,0,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,0,0,0, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				];

				state.map_under = new FlxTilemap();
				state.map_under.x = state.map_over.x + state.map_over.width;
				state.map_under.loadMap(FlxStringUtil.arrayToCSV(map_under_raw, 20),"assets/images/tiles_under.png",16,16,0,0,0);
				state.add(state.map_under);

				var c:Carrot = new Carrot(4, 2);
				state.carrots.add(c);
				c = new Carrot(2, 8);
				state.carrots.add(c);

				var g:Grate = new Grate(2,2,false,true);
				state.grates.add(g);
				var g2:Grate = new Grate(2+20, 2, true, true);
				state.grates.add(g2);
				g.partner = g2; g2.partner = g;
				g = new Grate(4,6, false, true);
				state.grates.add(g);
				g2 = new Grate(4+20, 6, true, true);
				state.grates.add(g2);
				g.partner = g2; g2.partner = g;

				state.player = new Player(16, 16);
				state.turnorder = [state.player];
				var f = new Dog(5,6);
				state.baddies.add(f);
				state.turnorder.push(f);

			case 9:
				var map_over_raw:Array<Int> = [
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,0, 0,1,0,0,1, 0,0,0,0,1,
				1,1,0,0,0, 0,0,1,1,0, 0,1,0,0,1, 0,0,0,0,1,
				1,1,0,0,0, 0,0,1,1,0, 0,1,0,0,1, 0,0,0,0,1,
				1,1,0,0,0, 0,0,1,1,0, 0,1,0,0,1, 0,0,0,0,1,

				1,1,0,0,0, 0,0,1,1,0, 0,1,0,0,1, 0,0,0,0,1,
				1,1,1,1,0, 1,1,1,1,1, 1,1,0,0,1, 0,0,0,0,1,
				1,0,1,0,0, 0,1,0,0,0, 0,1,0,0,1, 0,0,0,0,1,
				1,0,1,0,0, 0,1,0,0,0, 0,1,0,0,1, 0,0,0,0,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 0,0,0,0,1,
				];

				state.map_over = new FlxTilemap();
				state.map_over.loadMap(FlxStringUtil.arrayToCSV(map_over_raw, 20),"assets/images/tiles.png",16,16,0,0,0);
				state.add(state.map_over);

				var map_under_raw:Array<Int> = [
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,0,0,0, 0,0,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,0,0,0, 0,0,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,

				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				];

				state.map_under = new FlxTilemap();
				state.map_under.x = state.map_over.x + state.map_over.width;
				state.map_under.loadMap(FlxStringUtil.arrayToCSV(map_under_raw, 20),"assets/images/tiles_under.png",16,16,0,0,0);
				state.add(state.map_under);

				var c:Carrot = new Carrot(4, 7);
				state.carrots.add(c);
				c = new Carrot(3,7); state.carrots.add(c);
				c = new Carrot(5,7); state.carrots.add(c);
				c = new Carrot(3,8); state.carrots.add(c);
				c = new Carrot(4,8); state.carrots.add(c);
				c = new Carrot(5,8); state.carrots.add(c);

				var g:Grate = new Grate(2,3);
				state.grates.add(g);
				g = new Grate(6,3);
				state.grates.add(g);
				g = new Grate(2+20, 3, true);
				state.grates.add(g);
				g = new Grate(6+20, 3, true);
				state.grates.add(g);

				state.player = new Player(32, 32);
				state.turnorder = [state.player];
				var d = new Dog(4,6);
				state.turnorder.push(d);
				state.baddies.add(d);


			case 10:
				var map_over_raw:Array<Int> = [
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,0, 1,0,0,0,1, 0,0,0,0,1,
				1,1,1,0,0, 0,0,1,1,0, 1,0,0,0,1, 0,0,0,0,1,
				1,1,1,0,1, 0,1,1,1,0, 1,1,0,0,1, 0,0,0,0,1,
				1,1,1,0,0, 0,1,0,0,0, 0,1,0,0,1, 0,0,0,0,1,

				1,1,1,0,1, 1,1,0,0,0, 0,1,0,0,1, 0,0,0,0,1,
				1,1,1,0,1, 1,1,1,0,0, 0,1,1,0,1, 0,0,0,0,1,
				1,1,0,0,0, 0,0,0,0,0, 0,0,1,0,1, 0,0,0,0,1,
				1,1,0,0,1, 1,1,1,0,0, 1,1,1,0,1, 0,0,0,0,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 0,0,0,0,1,
				];

				state.map_over = new FlxTilemap();
				state.map_over.loadMap(FlxStringUtil.arrayToCSV(map_over_raw, 20),"assets/images/tiles.png",16,16,0,0,0);
				state.add(state.map_over);

				var map_under_raw:Array<Int> = [
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,0,0, 0,0,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,0,0, 0,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,0,0, 0,1,0,0,0, 1,1,1,1,1, 1,1,1,1,1,

				1,1,1,1,1, 1,1,0,0,0, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,0,0,0, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,0,0,0, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,0,0,0, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				];

				state.map_under = new FlxTilemap();
				state.map_under.x = state.map_over.x + state.map_over.width;
				state.map_under.loadMap(FlxStringUtil.arrayToCSV(map_under_raw, 20),"assets/images/tiles_under.png",16,16,0,0,0);
				state.add(state.map_under);

				var c:Carrot = new Carrot(3, 8);
				state.carrots.add(c);
				c = new Carrot(2,8); state.carrots.add(c);
				c = new Carrot(2,7); state.carrots.add(c);

				c = new Carrot(7,5); state.carrots.add(c);
				c = new Carrot(8,6); state.carrots.add(c);
				c = new Carrot(9,5); state.carrots.add(c);
				c = new Carrot(11,7); state.carrots.add(c);
				c = new Carrot(9,2); state.carrots.add(c);

				var g:Grate = new Grate(3,2);
				state.grates.add(g);
				g = new Grate(6,2);
				state.grates.add(g);
				g = new Grate(3+20, 2, true);
				state.grates.add(g);
				g = new Grate(6+20, 2, true);
				state.grates.add(g);
				g = new Grate(5, 4);
				state.grates.add(g);
				g = new Grate(5+20, 4, true);
				state.grates.add(g);

				var g2:Grate;
				g = new Grate(8,7,false,true);
				g2 = new Grate(20+8,7,true,true);
				g.partner = g2; g2.partner = g; 
				state.grates.add(g); state.grates.add(g2);

				g = new Grate(7,4,false,true);
				g2 = new Grate(20+7,4,true,true);
				g.partner = g2; g2.partner = g;
				state.grates.add(g); state.grates.add(g2);

				g = new Grate(9,4,false,true);
				g2 = new Grate(20+9,4,true,true);
				g.partner = g2; g2.partner = g;
				state.grates.add(g); state.grates.add(g2);

				g = new Grate(9,7,false,true);
				g2 = new Grate(20+9,7,true,true);
				g.partner = g2; g2.partner = g; 
				state.grates.add(g); state.grates.add(g2);

				state.player = new Player(5*16, 2*16);
				//state.player = new Player(6*16, 6*16);
				state.turnorder = [state.player];
				var d = new Dog(3,6);
				state.turnorder.push(d);
				state.baddies.add(d);
				d = new Dog(10,6);
				state.turnorder.push(d);
				state.baddies.add(d);
			case 11:
				var map_over_raw:Array<Int> = [
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,0,0,0,0, 0,0,0,0,0, 0,0,0,0,1, 0,0,0,0,1,
				1,0,0,0,0, 0,0,0,0,0, 0,0,0,0,1, 0,0,0,0,1,
				1,0,0,0,0, 0,0,0,0,0, 0,0,0,0,1, 0,0,0,0,1,
				1,0,0,0,0, 0,0,0,0,0, 0,0,0,0,1, 0,0,0,0,1,

				1,0,0,0,0, 0,0,0,0,0, 0,0,0,0,1, 0,0,0,0,1,
				1,0,0,0,0, 0,0,0,0,0, 0,0,0,0,1, 0,0,0,0,1,
				1,0,0,0,0, 0,0,0,0,0, 0,0,0,0,1, 0,0,0,0,1,
				1,0,0,0,0, 0,0,0,0,0, 0,0,0,0,1, 0,0,0,0,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 0,0,0,0,1,
				];

				state.map_over = new FlxTilemap();
				state.map_over.loadMap(FlxStringUtil.arrayToCSV(map_over_raw, 20),"assets/images/tiles.png",16,16,0,0,0);
				state.add(state.map_over);

				var map_under_raw:Array<Int> = [
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,

				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
				];

				state.map_under = new FlxTilemap();
				state.map_under.x = state.map_over.x + state.map_over.width;
				state.map_under.loadMap(FlxStringUtil.arrayToCSV(map_under_raw, 20),"assets/images/tiles_under.png",16,16,0,0,0);
				state.add(state.map_under);

				var c:Carrot = new Carrot(4, 2);
				state.carrots.add(c);

				var g:Grate = new Grate(2,2);
				state.grates.add(g);
				g = new Grate(2,7);
				state.grates.add(g);
				g = new Grate(2+20, 2, true);
				state.grates.add(g);
				g = new Grate(2+20, 7, true);
				state.grates.add(g);

				state.player = new Player(16, 16);

		}
	}

}