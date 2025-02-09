/// @description Insert description here
// You can write your code in this editor

var gp_num = gamepad_get_device_count();
for (var i = 0; i < gp_num; i++)
{
    if gamepad_is_connected(i)
	{
		numControllers++;
        global.gp[i] = true
		console("Connected. id: " + string(i));
	} else {
        global.gp[i] = false;
		console("Not connected id. " + string(i));
	}
}

if gamepad_button_check_pressed(0, gp_face1)
{
    console("X");
}