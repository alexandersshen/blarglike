/// @description Insert description here
// You can write your code in this editor

// ========================
// This code is for smoooooth movement
// ========================
if (x != _x * global.tile_size + global.offsetX)
{
		console(">> obj_player -> moving x");
		_moving = true;
	   // if x
	   if (x < _x * global.tile_size + global.offsetX)
	   {
		    x += global.moveSpeed;
	   }
	   
	   if (x > _x * global.tile_size + global.offsetX)
	   {
			x -= global.moveSpeed;
	   }
}
   
if (y != _y * global.tile_size + global.offsetY)
{
		console(">> obj_player -> moving y");
		_moving = true;
	   // if y
	   if (y < _y * global.tile_size + global.offsetY)
	   {
		    y += global.moveSpeed;
	   }
	   
	   if (y > _y * global.tile_size + global.offsetY)
	   {
			y -= global.moveSpeed;
	   }		
}

if ((y == _y * global.tile_size + global.offsetY) &&
	(x == _x * global.tile_size + global.offsetX))
	{
		_moving = false;
	}
