// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function play_sound(_index){
	if (global.sound_enabled)
	{
		audio_play_sound(_index,1,false);
	}
}