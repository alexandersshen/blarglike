/// @description Insert description here
// You can write your code in this editor
if (global.map_entities[_y,_x] == global.icon_enemy)
{
	x = _x * global.tile_size + global.offsetX;
	y = _y * global.tile_size + global.offsetY;	
} else {
	instance_destroy();
}