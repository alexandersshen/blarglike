// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function console(_msg){
	if (global.debugMode)
	{
		show_debug_message(string(_msg));
	}
}