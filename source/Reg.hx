package;

import flixel.system.FlxSound;
import flixel.util.FlxSave;

/**
 * Handy, pre-built Registry class that can be used to store 
 * references to objects and other things for quick-access. Feel
 * free to simply ignore it or change it in any way you like.
 */
class Reg
{

	static public var music:FlxSound = null;
	static public var overmusic:FlxSound = null;
	static public var undermusic:FlxSound = null;

	static public var COLOR_HARE:Int = 0xffCB9F72;
	static public var COLOR_GRASS:Int = 0xff60CE54;
	static public var GRASS_LIGHT:Int = 0xff78B48C;
	static public var C_CARROT:Int = 0xffFC701C;

	static public var tweenspeed:Float = 0.15;
	static public var state:PlayState;

	static public var ms:String = "mp3";

	static public var story:Array<String> = [
		"Hare was hungry.",
		"Hare knew where to find food.",
		"Hare knew when to run.",
		"Farmer was angry.",
		"Farmer hated animals.",
		"Farmer stomped on Hare's burrows.",
		"Hare had to be careful",
		"But Hare always found a way",
		"So Farmer bought Dog",
		"Dog made life hard \nfor Hare",
		"But Hare was smart",
		"Hare found his way past"
	];

	static public var guide:Array<String> = [
		"Move with the arrow keys. R to restart",
		"Enter and exit holes with spacebar",
		"Foxes chase on sight",
		"The Farmer shoots if he's facing Hare.",
		"The Farmer shoots other animals too.",
		"Stomped burrows collapse after one use.",
		"Press R to restart a level",
		"The Farmer changes direction every 4 turns",
		"Dogs chase you if you are near, even unseen",
		"Dogs can't chase Hare into burrows",
		"Dogs can only sense Hare 2 tiles away",
		"And Hare was hungry no more"
	];

	/**
	 * Generic levels Array that can be used for cross-state stuff.
	 * Example usage: Storing the levels of a platformer.
	 */
	static public var levels:Array<Dynamic> = [];
	/**
	 * Generic level variable that can be used for cross-state stuff.
	 * Example usage: Storing the current level number.
	 */
	static public var level:Int = 0;
	/**
	 * Generic scores Array that can be used for cross-state stuff.
	 * Example usage: Storing the scores for level.
	 */
	static public var scores:Array<Dynamic> = [];
	/**
	 * Generic score variable that can be used for cross-state stuff.
	 * Example usage: Storing the current score.
	 */
	static public var score:Int = 0;
	/**
	 * Generic bucket for storing different <code>FlxSaves</code>.
	 * Especially useful for setting up multiple save slots.
	 */
	static public var saves:Array<FlxSave> = [];
}