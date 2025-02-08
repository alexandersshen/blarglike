// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_transition(_direction){

	// go through the shuffled pairs and create a bunch of transition
	// objects on the screen.
	
	for (var i = 0; i < array_length(global.transition_array); i++)
	{
		tempTile = global.transition_array[i];
		instance_create_layer(tempTile[0] * global.tile_size,tempTile[1] * global.tile_size,"VFX",obj_transition);
	}
}