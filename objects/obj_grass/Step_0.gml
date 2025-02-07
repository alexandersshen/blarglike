/// @description Insert description here
// You can write your code in this editor

if (_counter > 0)
{
	_counter -= 1;
} else {
	image_alpha = 1;
}

// ===--===-==-===-===--===-===-===--==-===
// hacky way to clean up these grass floors
// if they go outside of the map area
// ===--===-==-===-===--===-===-===--==-===
if (x < 0 + global.offsetY)
{
	instance_destroy();
}

if (y < 0 + global.offsetX)
{
	instance_destroy();
}

if (x > (global.map_width * global.tile_size) - global.offsetX)
{
	instance_destroy();
}

if (y > (global.map_height * global.tile_size) - global.offsetY)
{
	instance_destroy();
}