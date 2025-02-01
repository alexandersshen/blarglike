// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_init_game(){
	
	console("script: scr_init_game()");
	
	global.map_width = 30;
	global.map_height = 20;

	global.icon_player = "@";
	global.icon_enemy = "E";
	global.icon_food = "A";
	global.icon_wall = "#";
	global.icon_floor = ".";
	global.icon_exit = "X";

	global.player_health = 20;
	global.player_health_max = 25;
	global.player_hunger = 10;
	global.player_hunger_max = 15;
	global.player_xp = 0;
	global.player_floor = 1;
	global.player_atk = 1;

	global.map = [];
	global.map_entities = [];
	global.rooms = [];
	global.emptyTiles = [];
	global.map_enemies = [];
	
	global.enemies_per_floor = 3;
	global.food_per_floor = 3;
	
	global.rooms_to_generate = 6;
	
	global.tile_size = 16;
	global.offsetX = 32;
	global.offsetY = 32;	
	
	// generate the empty map
	scr_generate_map();
	
	// place entities
	scr_place_entities();
	
	// render the map
	scr_render_map();
	
}