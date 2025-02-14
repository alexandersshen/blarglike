scr_init_game();

// console(">>> PASSWORD: " + string(validate_and_extract_password("402182-844-154-130-2671-914-2635")));

global.high_score = 0;
global.sound_enabled = true;

audio_play_sound(snd_music,1,true);

global.title_map = array_create(20, array_create(30, "#"));

// If you want a specific map layout:
global.title_map[3]  = ["#", "F", "#", "#", "#", "F", "#", "F", "F", "F", "#", "#", "#", "#", "F", "F", "F", "#", "F", "#", "#", "F", "#", "F", "#", "F", "#", "F", "F", "#"];
global.title_map[4]  = ["#", "F", "#", "#", "#", "F", "#", "#", "#", "F", "#", "F", "F", "#", "F", "#", "#", "#", "F", "#", "#", "F", "#", "F", "#", "F", "#", "F", "#", "#"];
global.title_map[5]  = ["#", "F", "F", "F", "#", "F", "#", "F", "F", "F", "#", "F", "#", "#", "F", "#", "F", "#", "F", "#", "#", "F", "#", "F", "F", "#", "#", "F", "F", "#"];
global.title_map[6]  = ["#", "F", "#", "F", "#", "F", "#", "F", "#", "F", "#", "F", "#", "#", "F", "#", "F", "#", "F", "#", "#", "F", "#", "F", "#", "F", "#", "F", "#", "#"];
global.title_map[7]  = ["#", "F", "F", "F", "#", "F", "#", "F", "F", "F", "#", "F", "#", "#", "F", "F", "F", "#", "F", "F", "#", "F", "#", "F", "#", "F", "#", "F", "F", "#"];

global.title_map[14] = ["#", "#", "#", "#", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", "#", "#", "#", "#"];
global.title_map[15] = ["#", "#", "#", "#", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", "#", "#", "#", "#"];
global.title_map[16] = ["#", "#", "#", "#", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", "#", "#", "#", "#"];

console_array(global.title_map);

scr_render_title();
// scr_render_tile_asset();

// --------------------------
// generate transition blocks
// --------------------------
global.transition_array = [];
var _index = 0;

for (var _row = 0; _row < 22; _row++)
{
	for (var _col = 0; _col < 32; _col++)
	{
		tempArray = [];
		tempArray[0] = _col;
		tempArray[1] = _row;
		global.transition_array[_index] = tempArray;
		_index += 1;
	}
}

// console(">> before transition_array: " + string(global.transition_array));

// Shuffle the ARRAY to randomize the pairs
shuffleArray(global.transition_array);

// console(">> after transition_array: " + string(global.transition_array));
