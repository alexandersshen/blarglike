/// @description Insert description here
// You can write your code in this editor

if (global.player_health == 0)
{
	global.console_text = "";
	global.player_score = 0;
	
	global.transition_count = 32 * 22;
	
	// create all the transition objects
	scr_transition("out");
	
} else {
	// scr_reset_map(false);
}