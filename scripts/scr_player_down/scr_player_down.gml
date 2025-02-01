// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_down(){
	if (obj_player._y < global.map_height)
	{
		tempTile = global.map[obj_player._y+1,obj_player._x];
		
		switch tempTile
		{
			case global.icon_exit:
				global.player_floor += 1;
				scr_reset_map();
			break;
			
			case global.icon_floor:
				// remove the player from the entities map
				global.map_entities[obj_player._y,obj_player._x] = global.icon_floor;
			
				obj_player._y += 1;
				obj_player.y += global.tile_size;
			
				global.map_entities[obj_player._y,obj_player._x] = global.icon_player;
			break;
		}
	}
}