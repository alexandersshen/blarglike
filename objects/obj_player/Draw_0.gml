/// @description Insert description here
// You can write your code in this editor

if (global.player_health > 0)
{
	sprite_index = spr_player;
} else {
	sprite_index = spr_player_dead;
}

draw_self();