/// @description Insert description here
// You can write your code in this editor

draw_set_font(font_courier);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_text(10,10,"Battery: " + string(global.player_health) + " / " + string(global.player_health_max) +
				" | Nutrients: " + string(global.player_nutrients) +
				" | Floor: " + string(global.player_floor) +
				" | Score: " + string(global.player_score) +
				" | High Score: " + string(global.high_score)
		 );
				
draw_text(10,680,string(global.console_text));

if (global.player_health == 0)
{
	// global.console_text = "== MISSION SUCCESS == Press 'R' to restart! == Password: " + string(global.password);
	global.console_text = "== MISSION SUCCESS == Press 'R' to restart! ==";
}

draw_set_halign(fa_right);
draw_text(1014,10,"Daily Run: " + string(global.current_date));