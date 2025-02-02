// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_move_player(_direction){
	console("script: scr_move_player");
	
	switch (_direction)
	{
		case "up":
			tempTile = global.map[obj_player._y-1,obj_player._x];
			tempTileEntities = global.map_entities[obj_player._y-1,obj_player._x];
			xMove = 0;
			yMove = -1;
			xMoveTile = 0;
			yMoveTile = -1 * global.tile_size;
			//scr_player_up();
		break;
		
		case "down":
			tempTile = global.map[obj_player._y+1,obj_player._x];
			tempTileEntities = global.map_entities[obj_player._y+1,obj_player._x];
			xMove = 0;
			yMove = 1;
			xMoveTile = 0;
			yMoveTile = 1 * global.tile_size;
			//scr_player_down();
		break;
		
		case "left":
			tempTile = global.map[obj_player._y,obj_player._x-1];
			tempTileEntities = global.map_entities[obj_player._y,obj_player._x-1];
			xMove = -1;
			yMove = 0;
			xMoveTile = -1 * global.tile_size;
			yMoveTile = 0;
			//scr_player_left();
		break;
		
		case "right":
			tempTile = global.map[obj_player._y,obj_player._x+1];
			tempTileEntities = global.map_entities[obj_player._y,obj_player._x+1];
			xMove = 1;
			yMove = 0;
			xMoveTile = 1 * global.tile_size;
			yMoveTile = 0;
			//scr_player_right();
		break;
	}
	
	console(">> tempTile: " + string(tempTile));
	
	if (tempTileEntities == global.icon_floor)
	{
		// TempTile represents where the player is going
		switch (tempTile)
		{
			// You've reached the exit
			case global.icon_exit:
				global.player_floor += 1;
				global.console_text = "You've reached an exit!";
				scr_reset_map();
			break;
		
			// You've reached a floor tile
			case global.icon_floor:
				// remove the player from the entities map
				global.map_entities[obj_player._y,obj_player._x] = global.icon_floor;
			
				// update the location of the player
				obj_player._x += xMove;
				obj_player._y += yMove;
				// obj_player.x += xMoveTile;
				// obj_player.y += yMoveTile;
			
				// re-add new location of player from entities map
				global.map_entities[obj_player._y,obj_player._x] = global.icon_player;	
				
				global.console_text = "";
			break;
		
			case global.icon_wall:
				console("Ooof! You're run into a wall.");
				global.console_text = "Ooof! You've run into a wall.";
			break;
		}
	} else {	
		// TempTileEntities - this is an icon (., E, A, etc)
		switch (tempTileEntities)
		{
			// You've reached a health
			case global.icon_food:
				// remove the player from the entities map
				global.map_entities[obj_player._y,obj_player._x] = global.icon_floor;
			
				// update the location of the player
				obj_player._x += xMove;
				obj_player._y += yMove;
				// obj_player.x += xMoveTile;
				// obj_player.y += yMoveTile;
			
				console("You got some food!");
				global.console_text = "You got some food!";
				global.player_hunger += 1;
			
				// replace the food with the player
				global.map_entities[obj_player._y,obj_player._x] = global.icon_player;
			break;	
			
			case global.icon_enemy:
				console("Ouch! An enemy!");
				global.console_text = "Ow! You ran into an enemy!";
				for (var i = 0; i < array_length(global.map_enemies); i++)
				{
					if (global.map_enemies[i]._y == obj_player._y + yMove)
						&& (global.map_enemies[i]._x == obj_player._x + xMove)
						{
							global.map_enemies[i]._status = "stunned";	
						}
				}
			break;
		}
	}
	
	// move enemies
	scr_move_enemies();
	
	// unfreeze all enemies
	for (var i = 0; i < array_length(global.map_enemies); i++)
	{
		global.map_enemies[i]._status = "free";
	}
}