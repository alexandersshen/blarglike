// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_render_tile_asset(){
	console("script: scr_render_tile_asset");
	tile_size = global.tile_size;

	// draw this damned map bro
	for (var _col = 0; _col < global.map_width; _col++)
	{
		for (var _row = 0; _row < global.map_height; _row++)
		{
			tempTile = choose(obj_floor,obj_floor,obj_grass,obj_wall,obj_wall,obj_wall);
			

					instance_create_layer(_col*tile_size+global.offsetX,_row*tile_size+global.offsetY,"Instances",tempTile);

			}
		}
	}
