/// @description Insert description here
// You can write your code in this editor

// If the game has not started yet, create the map
// and set it to started.
if (!_gameStarted)
{
	scr_reset_map(true);	
	_gameStarted = true;
}

// if the global transition count has reached 0, meaning
// all the transition objects have been made, go to the main
// game room
if (global.transition_count <= 0)
{
	room_goto(maingame);
}