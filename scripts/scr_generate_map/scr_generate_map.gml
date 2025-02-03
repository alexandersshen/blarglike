// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_generate_map(){
	// fill the array with all walls to start.
	console("script: scr_generate_map");
	
	// fill the map with just walls
	// do the same for the entity map
	for (var _height = 0; _height < global.map_height; _height++)
	{
		for (var _width = 0; _width < global.map_width; _width++)
		{
			global.map[_height,_width] = global.icon_wall;
			global.map_entities[_height,_width] = global.icon_floor;
		}
	}
	
	console(" == map before generating rooms ==");
	console_array(global.map);
	console(" =================================");
	
	// Generate a bunch of rooms and connect them
	for (var i = 0; i < global.rooms_to_generate; i++)
	{
		console(">> digging a room #" + string(i));
		
		// _width = 3;
		// _height = 4;
		
		_width = floor(random(5)) + 4;	// how wide the room can be
		_height = floor(random(4)) + 3;	// how tall the room can be
		
		// randomly select where this room should appear
		// the +1 ensures that it doesn't appear on the edge - i.e. _col = 0
		_x = floor(random(global.map_width - _width - 1) + 1);
		_y = floor(random(global.map_height - _height - 1) + 1);
		
		// create the room object
		_room = [_x,_y,_width,_height];
		
		// add this room object to the rooms array
		array_push(global.rooms,_room);
		
		// dig the room - i.e. place it inside the map
		scr_dig_room(_x,_y,_width,_height);
	}
	
	console("== list the rooms ==");
	console_array(global.rooms);
	console("====================");
	
	// Connect the rooms together
	for (var j = 1; j < array_length(global.rooms); j++)
	{
		scr_connect_rooms(global.rooms[j-1],global.rooms[j]);
	}

	// Place a random exit
	lastRoom = global.rooms[array_length(global.rooms)-1];
	exitCol = lastRoom[0] + floor(lastRoom[2] / 2);
	exitRow = lastRoom[1] + floor(lastRoom[3] / 2);
	global.map[exitRow][exitCol] = global.icon_exit;

    console("== map after all the goodies ==");
	console_array(global.map);
	console("===============================");
}