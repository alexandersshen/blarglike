/// @description Insert description here
// You can write your code in this editor

// As each obj_transition is created, it subtracts from
// the global count. Once it has reached 0, meaning the
// whole screen is full, go to the next room.

if (global.transition_count <= 0)
{
	room_goto(maingame);
}