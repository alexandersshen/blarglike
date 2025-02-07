/// @description Insert description here
// You can write your code in this editor

draw_set_font(font_courier);
draw_set_color(c_white);
draw_text(10,10,"Battery: " + string(global.player_health) + " / " + string(global.player_health_max) +
				" | Nutrients: " + string(global.player_nutrients) +
				" | Floor: " + string(global.player_floor) +
				" | Stardate: " + string(global.current_date) +
				" | Score: " + string(global.player_score)
		 );
				
draw_text(10,680,string(global.console_text));

if (global.player_health == 0)
{
	global.console_text = "=== MISSION SUCCESS == You have successfully deployed the seed bomb. Press 'R' to restart! ===";
}