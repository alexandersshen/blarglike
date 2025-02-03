// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_connect_rooms(room1,room2){
	console("script: scr_connect_rooms");
	
	// room is an array of 4 values: x, y, width, height
	// x1, y1 = center of room 1
	// x2, y2 = center of room 2
	
	x1 = room1[0] + floor(room1[2] / 2);
	y1 = room1[1] + floor(room1[3] / 2);
	x2 = room2[0] + floor(room2[2] / 2);
	y2 = room2[1] + floor(room2[3] / 2);
	
	/*
	while (x1 != x2 || y1 != y2)
	{
		if (x1 != x2)
		{
			x1 += x1 < x2 ? 1 : -1;
        } else if (y1 != y2) {
            y1 += y1 < y2 ? 1 : -1;
        }
	*/
	
	while (x1 != x2 || y1 != y2)
	{
		if (x1 != x2)
		{
			if (x1 != x2) 
			{
				x1 += sign(x2 - x1); // Moves by 1 in the correct direction
			}
        } else if (y1 != y2) {
            // Move y1 toward y2 if they are not equal
			if (y1 != y2) 
			{
				y1 += sign(y2 - y1); // Moves by 1 in the correct direction
			}
        }
    
	// Set the path in the tunnel to a floor tile
	global.map[y1][x1] = global.icon_floor;
	
    }
}