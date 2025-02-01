// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_place_entities(){
	console("script: scr_place_entities");
	// Go through and randomly select some tiles. Check if
	// they are floor ties.
	
	global.emptyTiles = [];
	
	for (var col = 0; col < global.map_width; col++)
	{
		for (var row = 0; row < global.map_height; row++)
		{
			if (global.map[row][col] == global.icon_floor)
			{
				tempTile = [col,row];
				array_push(global.emptyTiles,tempTile);
			}
		}
	}
	
//	console_array(global.emptyTiles);

	// Player Selection
	// randomly select an empty tile
	playerRandomIndex = floor(random(array_length(global.emptyTiles)));
	playerTile = global.emptyTiles[playerRandomIndex];
	array_delete(global.emptyTiles,playerRandomIndex,1);
	
	console(">> playerTile: " + string(playerTile));
	
	// Place the Player on the Entity Map
	// global.map[playerTile[1],playerTile[0]] = global.icon_player;
	global.map_entities[playerTile[1],playerTile[0]] = global.icon_player;
	
	// Enemy Selection
	// randomly select an empty tile
	for (var p = 0; p < global.enemies_per_floor; p++)
	{
		enemyRandomIndex = floor(random(array_length(global.emptyTiles)));
		enemyTile = global.emptyTiles[enemyRandomIndex];
		array_delete(global.emptyTiles,enemyRandomIndex,1);
	
		console(">> enemyTile: " + string(enemyTile));
	
		// Place the Enemy on the Entity Map
		// global.map[enemyTile[1],enemyTile[0]] = global.icon_enemy;
		global.map_entities[enemyTile[1],enemyTile[0]] = global.icon_enemy;
	}
	
	// Food Selection
	// randomly select an empty tile
	for (var food = 0; food < global.food_per_floor; food++)
	{
		foodRandomIndex = floor(random(array_length(global.emptyTiles)));
		foodTile = global.emptyTiles[foodRandomIndex];
		array_delete(global.emptyTiles,foodRandomIndex,1);
	
		console(">> foodTile: " + string(foodTile));
	
		// Place the Enemy on the Entity Map
		// global.map[foodTile[1],foodTile[0]] = global.icon_food;
		global.map_entities[foodTile[1],foodTile[0]] = global.icon_food;
	}
	
	// debug
	console("-- updated map with entities location --");
	console_array(global.map_entities);
	console("----------------------------------------");
}