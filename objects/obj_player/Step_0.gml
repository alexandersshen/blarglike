/// @description Insert description here
// You can write your code in this editor

// ========================
// This code is for smoooooth movement
// ========================
if (x != _x * global.tile_size + global.offsetX)
{
	   console(">> obj_player -> moving");
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
