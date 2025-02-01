// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_move_enemies(){
	console("script: scr_move_enemies");
	
	for (var i = 0; i < array_length(global.map_enemies); i++)
	{
		possibleDirections = [];
		tempEnemy = global.map_enemies[i];
		
		if (tempEnemy._status = "free")
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
		}
		
	}
}