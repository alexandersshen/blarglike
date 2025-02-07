// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_move_enemies(){
	console("script: scr_move_enemies");
	
	for (var i = 0; i < array_length(global.map_enemies); i++)
	{
		possibleDirections = [];
		tempEnemy = global.map_enemies[i];
		
		// if the enemy is "Free" to move around
		if (tempEnemy._status == "free")
		{
		
			// ==============================
			// Enemy Possible Direction Check
			// =-============================
			// check up
			if ((global.map[tempEnemy._y-1,tempEnemy._x] == global.icon_floor) 
			    && (tempEnemy._y > 0)
			    && (global.map_entities[tempEnemy._y-1,tempEnemy._x] == global.icon_floor))
			{
				array_push(possibleDirections,"up");
			}
		
			// check down
			if ((global.map[tempEnemy._y+1,tempEnemy._x] == global.icon_floor) 
			    && (tempEnemy._y < global.map_height)
			    && (global.map_entities[tempEnemy._y+1,tempEnemy._x] == global.icon_floor))
			{
				array_push(possibleDirections,"down");
			}
		
			// check left
			if ((global.map[tempEnemy._y,tempEnemy._x-1] == global.icon_floor) 
			    && (tempEnemy._x > 0)
			    && (global.map_entities[tempEnemy._y,tempEnemy._x-1] == global.icon_floor))
			{
				array_push(possibleDirections,"left");
			}
		
			// check right
			if ((global.map[tempEnemy._y,tempEnemy._x+1] == global.icon_floor) 
			    && (tempEnemy._y < global.map_width)
			    && (global.map_entities[tempEnemy._y,tempEnemy._x+1] == global.icon_floor))
			{
				array_push(possibleDirections,"right");
			}
		
			// console(">> possibleDirections Before: " + string(possibleDirections))
			possibleDirections = shuffleArray(possibleDirections);
			// console(">> possibleDirections After: " + string(possibleDirections))
		
			// ERROR CHECK (?) - seem to get an out of bounds error here sometimes
			if (array_length(possibleDirections) > 0)
			{
				// move the enemy
				switch (possibleDirections[0])
				{
					case "up":
						console(">> up");
						global.map_entities[tempEnemy._y-1,tempEnemy._x] = global.icon_enemy;
						global.map_entities[tempEnemy._y,tempEnemy._x] = global.icon_floor;
						tempEnemy._y -= 1;
					break;
			
					case "down":
						console(">> down");
						global.map_entities[tempEnemy._y+1,tempEnemy._x] = global.icon_enemy;
						global.map_entities[tempEnemy._y,tempEnemy._x] = global.icon_floor;
						tempEnemy._y += 1;
					break;
			
					case "left":
						console(">> left");
						global.map_entities[tempEnemy._y,tempEnemy._x-1] = global.icon_enemy;
						global.map_entities[tempEnemy._y,tempEnemy._x] = global.icon_floor;
						tempEnemy._x -= 1;
					break;
			
					case "right":
						console(">> right");
						global.map_entities[tempEnemy._y,tempEnemy._x+1] = global.icon_enemy;
						global.map_entities[tempEnemy._y,tempEnemy._x] = global.icon_floor;
						tempEnemy._x += 1;
					break;
				} 
			} else {
					console("!! Error: possibleDirection out of bounds error !!");
				}
		}
		
		// if the enemy is actually dead
		if (tempEnemy._status == "dead")
		{
			// make that tile on the entities array a floor
			global.map_entities[tempEnemy._y,tempEnemy._x] = global.icon_floor;		
			
			// mark for deletion
			global.map_enemies[i] = "remove";
			
			// create the sparkle zap death enemy
			instance_create_layer(tempEnemy.x,tempEnemy.y,"Entities",obj_enemy_zap);
			
			// delete the object
			instance_destroy(tempEnemy);
		}
		
	}
	
	// clean up enemies array
	for (var j = array_length(global.map_enemies)-1; j >= 0; j--)
	{
		// delete the entry from map_enemies[j] if == "removed"
		if (global.map_enemies[j] == "remove")
		{
			array_delete(global.map_enemies,j,1);
		}
	}
}