/// @description Insert description here
// You can write your code in this editor

if (global.player_health > 0)
{
	sprite_index = spr_player;
	image_speed = 1;
} else {
	sprite_index = spr_player_dead;
	if (image_index >= sprite_get_number(sprite_index)-1)
	{
		image_speed = 0;
	}
}

draw_self();