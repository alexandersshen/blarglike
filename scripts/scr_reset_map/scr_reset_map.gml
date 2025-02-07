// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_reset_map(_restart){
	console("script: scr_reset_map");
	
	global.map = [];
	global.rooms = [];
	global.emptyTiles = [];
	
	instance_destroy(obj_wall);
	instance_destroy(obj_floor);
	instance_destroy(obj_exit);
	instance_destroy(obj_grass);
	
	instance_destroy(obj_player);
	instance_destroy(obj_enemy);
	instance_destroy(obj_food);
	
	if (_restart)	// full game restart
	{
		random_set_seed(real(global.current_date));
		
		global.player_health = 50;
		global.player_health_max = 50;
		global.player_nutrients = 1;
		global.player_nutrients_max = 999;
		global.player_xp = 0;
		global.player_floor = 1;
		global.player_atk = 1;
	} else {	// regular next map
		random_set_seed(real(global.current_date) + real(global.player_floor));
	}
	
	scr_do_the_things();
}