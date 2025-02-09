/// @description Insert description here
// You can write your code in this editor
if (global.sound_enabled)
{
	// turn it off now
	audio_master_gain(0);
	global.sound_enabled = false;
} else {
	audio_master_gain(1);
	global.sound_enabled = true;
}