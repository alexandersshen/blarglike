// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_do_the_things(){
	// set the random seed for the day
	// random_set_seed(global.current_date);
	
	// generate the empty map
	scr_generate_map();
	
	// place entities
	scr_place_entities();
	
	// render the map
	scr_render_map();
}