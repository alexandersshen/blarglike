/// @description Insert description here
// You can write your code in this editor

draw_set_font(font_courier);
draw_set_color(c_white);
draw_text(10,10,"Health: " + string(global.player_health) + 
				" | Hunger: " + string(global.player_hunger) +
				" | XP: " + string(global.player_xp) +
				" | ATK: " + string(global.player_atk) + 
				" | Floor: " + string(global.player_floor));
				
draw_text(10,680,string(global.console_text));