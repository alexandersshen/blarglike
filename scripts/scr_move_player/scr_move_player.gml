// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_move_player(_direction){
	var just_got_battery = false;
	
	if (global.player_health > 0) && (!obj_player._moving)
	{
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
		
		// update player moves
		global.player_moves += 1;
		console(">> player moves: " + string(global.player_moves));
	
		// console(">> tempTile: " + string(tempTile));
	
		if (tempTileEntities == global.icon_floor)
		{
			// TempTile represents where the player is going
			switch (tempTile)
			{
				// You've reached the exit
				case global.icon_exit:
					global.player_floor += 1;
					global.console_text = "You've reached an exit!";
					
					// create the disappearing sprite
					instance_create_layer(obj_player.x,obj_player.y,"Entities",obj_player_exit);
					
					play_sound(snd_exit);
					
					scr_reset_map(false);
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
					
					play_sound(snd_walk);
				break;
		
				case global.icon_wall:
					// console("Ooof! You're run into a wall.");
					global.console_text = "Ooof! You've run into a wall.";
					play_sound(snd_wall);
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
			
					console("You got some food!");
					global.console_text = "You recharged some of your battery! (+" + string(global.player_recharge) + " Battery)";
					
					if (global.player_health + global.player_recharge >= global.player_health_max)
					{ 
						global.player_health = global.player_health_max;
					} else {
						global.player_health += global.player_recharge + 1;
					}
					
					// password purposes
					global.player_battery_total += global.player_recharge;
					global.player_battery_grabbed += 1;
					
					// set the flag
					just_got_battery = true;
			
					// replace the food with the player
					global.map_entities[obj_player._y,obj_player._x] = global.icon_player;
					
					// play the sound
					play_sound(snd_battery);
					
					// create the little special FX
					instance_create_layer((obj_player._x * global.tile_size) + global.offsetX,obj_player._y * global.tile_size,"Entities",obj_food_get);
				break;	
			
				case global.icon_enemy:
					console("Ouch! An enemy!");
					global.console_text = "You picked up some nutrients! (+" + string(global.player_recharge*2) + " Battery, +" + string(global.player_nutrients_recharge) + " Nutrients)";
					
					// iterate through the different enemies to see which one you actually ran into
					// using where the player is going to move to determine which enemy we're looking for
					for (var i = 0; i < array_length(global.map_enemies); i++)
					{
						if (global.map_enemies[i]._y == obj_player._y + yMove)
							&& (global.map_enemies[i]._x == obj_player._x + xMove)
							{
								global.map_enemies[i]._status = "dead";	
							}
					}
					
					// play the sound
					play_sound(snd_nutrient);
					
					// update the nutrients value
					if (global.player_nutrients + global.player_nutrients_recharge < global.player_nutrients_max)
					{
						global.player_nutrients += global.player_nutrients_recharge;
					} else {
						global.player_nutrients = global.player_nutrients_max;
					}
					
					if (global.player_health + (global.player_recharge * 2) >= global.player_health_max)
					{ 
						global.player_health = global.player_health_max;
					} else {
						global.player_health += (global.player_recharge * 2) + 1;
					}
					
					// password purposes
					global.player_battery_total += (global.player_recharge * 2);
					
				break;
			}
		}
		
		// update health
		global.player_health -= 1;
		
		if (!just_got_battery)
		{
			// == special FX ==
			// CREATE GRASS
			// If the player is dead. explode a bunch of plants/grass
			// in all directions = nutrient amount
			// == special FX ==
			grassCounter = 10;
			
			if (global.player_health <= 0)
			{
				console(">> creating grass now");
				
				obj_player.sprite_index = spr_player_dead;
				
				// update high score
				if (global.player_score > global.high_score)
				{
					global.high_score = global.player_score;
				}
				
				// generate password
				global.password = generate_daily_password(global.current_date, 
															global.player_nutrients, 
															global.player_floor, 
															global.player_score,
															global.player_battery_total, 
															global.player_moves,
															global.player_battery_grabbed);
				
				// play the deaht sound
				play_sound(snd_died);
				
				// change all the floors around it into grass tiles as far
				// as nutrients go
				for (var i = 1; i < global.player_nutrients+1; i++)
				{

						console(">>> creating some grass - counter: " + string(grassCounter) + " x " + string(i));
						// up floors
						tempGrassUp = instance_create_layer((obj_player._x * global.tile_size) + global.offsetX,
															(obj_player._y*global.tile_size) - (i * global.tile_size) + global.offsetY,
															"Instances",obj_grass);
						tempGrassUp.depth = -tempGrassUp.y;
						tempGrassUp._counter = grassCounter * i;
				
						// up-right floors
						tempGrassUR = instance_create_layer((obj_player._x * global.tile_size) + (i * global.tile_size) + global.offsetX,
															(obj_player._y*global.tile_size) - (i * global.tile_size) + global.offsetY,
															"Instances",obj_grass);
						tempGrassUR.depth = -tempGrassUR.y;
						tempGrassUR._counter = grassCounter * i;
				
						// right floors
						tempGrassRight = instance_create_layer((obj_player._x * global.tile_size) + (i * global.tile_size) + global.offsetX,
																(obj_player._y * global.tile_size) + global.offsetY,
																"Instances",obj_grass);
						tempGrassRight.depth = -tempGrassRight.y;
						tempGrassRight._counter = grassCounter * i;
				
						// down-right floors
						tempGrassDR = instance_create_layer((obj_player._x * global.tile_size) + (i * global.tile_size) + global.offsetX,
															(obj_player._y*global.tile_size) + (i * global.tile_size) + global.offsetY,
															"Instances",obj_grass);
						tempGrassDR.depth = -tempGrassDR.y;
						tempGrassDR._counter = grassCounter * i;
				
						// down floors
						tempGrassDown = instance_create_layer((obj_player._x * global.tile_size) + global.offsetX,
																(obj_player._y * global.tile_size) + (i * global.tile_size) + global.offsetY,
																"Instances",obj_grass);
						tempGrassDown.depth = -tempGrassDown.y;
						tempGrassDown._counter = grassCounter * i;
				
						// down-left floors
						tempGrassDL = instance_create_layer((obj_player._x * global.tile_size) - (i * global.tile_size) + global.offsetX,
															(obj_player._y*global.tile_size) + (i * global.tile_size) + global.offsetY,
															"Instances",obj_grass);
						tempGrassDL.depth = -tempGrassDL.y;
						tempGrassDL._counter = grassCounter * i;
				
						// left floors
						tempGrassLeft = instance_create_layer((obj_player._x * global.tile_size) - (i * global.tile_size) + global.offsetX,
																(obj_player._y * global.tile_size) + global.offsetY,
																"Instances",obj_grass);
						tempGrassLeft.depth = -tempGrassLeft.y;
						tempGrassLeft._counter = grassCounter * i;
				
						// up-left floors
						tempGrassUL = instance_create_layer((obj_player._x * global.tile_size) - (i * global.tile_size) + global.offsetX,
															(obj_player._y*global.tile_size) - (i * global.tile_size) + global.offsetY,
															"Instances",obj_grass);
						tempGrassUL.depth = -tempGrassUL.y;
						tempGrassUL._counter = grassCounter * i;
					
				}
			}
		}
		
		// update player score
		scr_update_player_score();
	
		// move enemies
		scr_move_enemies();
	
		// unfreeze all enemies
		for (var i = 0; i < array_length(global.map_enemies); i++)
		{
			global.map_enemies[i]._status = "free";
		}
	} else {
		
	}
}