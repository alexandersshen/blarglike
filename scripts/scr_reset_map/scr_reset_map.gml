// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_reset_map(){
	console("script: scr_reset_map");
	
	global.map = [];
	global.rooms = [];
	global.emptyTiles = [];
	
	instance_destroy(obj_wall);
	instance_destroy(obj_floor);
	instance_destroy(obj_exit);
	
	instance_destroy(obj_player);
	instance_destroy(obj_enemy);
	instance_destroy(obj_food);
	
	scr_generate_map();
	
	scr_place_entities();
	
	scr_render_map();
}