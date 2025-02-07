// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_render_title(){
	console("script: scr_render_title");
	tile_size = global.tile_size;

	// draw this damned map bro
	for (var _col = 0; _col < global.map_width; _col++)
	{
		for (var _row = 0; _row < global.map_height; _row++)
		{
			tempTile = global.title_map[_row,_col];
			
			switch (tempTile)
			{
				case global.icon_wall:
					instance_create_layer(_col*tile_size+global.offsetX,_row*tile_size+global.offsetY,"Instances",obj_wall);
				break;
				
				case global.icon_floor:
					instance_create_layer(_col*tile_size+global.offsetX,_row*tile_size+global.offsetY,"Instances",obj_grass);
				break;
			}
		}
	}
}