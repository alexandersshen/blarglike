// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_render_map(){
	console("script: scr_render_map");
	
	global.map_enemies = [];
	
	tile_size = global.tile_size;
	//global.offsetX = 32;
	//global.offsetY = 32;
	
	// draw this damned map bro
	for (var _col = 0; _col < global.map_width; _col++)
	{
		for (var _row = 0; _row < global.map_height; _row++)
		{
			tempTile = global.map[_row,_col];
			
			switch (tempTile)
			{
				case global.icon_wall:
					instance_create_layer(_col*tile_size+global.offsetX,_row*tile_size+global.offsetY,"Instances",obj_wall);
				break;
				
				case global.icon_floor:
					instance_create_layer(_col*tile_size+global.offsetX,_row*tile_size+global.offsetY,"Instances",obj_floor);
				break;
				
				case global.icon_exit:
					instance_create_layer(_col*tile_size+global.offsetX,_row*tile_size+global.offsetY,"Instances",obj_exit);
				break;
			}
		}
	}
	
	// draw those entities on top baby
	for (var _col = 0; _col < global.map_width; _col++)
	{
		for (var _row = 0; _row < global.map_height; _row++)
		{
			tempTile = global.map_entities[_row,_col];
			
			switch (tempTile)
			{
				case global.icon_player:
					tempPlayer = instance_create_layer(_col*tile_size+global.offsetX,_row*tile_size+global.offsetY,"Entities",obj_player);
					tempPlayer._x = _col;
					tempPlayer._y = _row;
				break;
				
				case global.icon_enemy:
					tempEnemy = instance_create_layer(_col*tile_size+global.offsetX,_row*tile_size+global.offsetY,"Entities",obj_enemy);
					tempEnemy._x = _col;
					tempEnemy._y = _row;
					array_push(global.map_enemies,tempEnemy);
				break;
				
				case global.icon_food:
					tempFood = instance_create_layer(_col*tile_size+global.offsetX,_row*tile_size+global.offsetY,"Entities",obj_food);
					tempFood._x = _col;
					tempFood._y = _row;
				break;
			}
		}
	}
}