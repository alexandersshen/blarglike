// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_init_game(){
	global.debugMode = true;
	
	console("script: scr_init_game()");
	
	var todays_date = date_current_datetime();
	var year = string(date_get_year(todays_date));
	var month = string(date_get_month(todays_date));
	var day = string(date_get_day(todays_date));

	// Ensure two-digit formatting
	if (string_length(month) == 1) month = "0" + month;
	if (string_length(day) == 1) day = "0" + day;

	var formatted_date = year + month + day;

	global.current_date = real(formatted_date);

	// formatted_date = real(formatted_date); // Convert back to a number if needed

	global.player_score = 0;
	
	global.map_width = 30;
	global.map_height = 20;
	
	global.console_text = "";

	global.icon_player = "@";
	global.icon_enemy = "E";
	global.icon_food = "A";
	global.icon_wall = "#";
	global.icon_floor = ".";
	global.icon_exit = "X";

	global.player_health = 99;
	global.player_health_max = 99;
	global.player_nutrients = 1;
	global.player_nutrients_max = 999;
	global.player_xp = 0;
	global.player_floor = 1;
	global.player_atk = 1;
	
	global.player_recharge = 5;	// how much battery gives you
	global.player_nutrients_recharge = 1;	// how much nutrients give you

	global.map = [];
	global.map_entities = [];
	global.rooms = [];
	global.emptyTiles = [];
	global.map_enemies = [];
	
	global.enemies_per_floor = 3;
	global.food_per_floor = 3;
	
	global.rooms_to_generate = 6;
	
	// overall tile sizes
	global.tile_size = 32;
	global.offsetX = 32;
	global.offsetY = 32;	
	
	global.moveSpeed = 8;
	
	random_set_seed(global.current_date);
	
}