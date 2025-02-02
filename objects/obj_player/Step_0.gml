/// @description Insert description here
// You can write your code in this editor

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
	   
	   /*
	   x = _x * global.tile_size + global.offsetX;
	   y = _y * global.tile_size + global.offsetY;
	   */
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
