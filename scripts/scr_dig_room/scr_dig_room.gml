// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_dig_room(_x, _y, width, height){
	console("script: scr_dig_room");
	
	for (var _col = _x; _col < _x + width; _col++)
	{
		for (var _row = _y; _row < _y + height; _row++)
		{
			// if the room to dig fits inside the size of the map based on
			// where _x and _y are, then go and dig it.
			if (_col >= 0 && _col < global.map_width && _row >= 0 && _row < global.map_height)
			{
				global.map[_row,_col] = global.icon_floor;
			}
		}
	}

}