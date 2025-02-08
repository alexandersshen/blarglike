// remove the transition objects

	// For each obj_transition that is persistent from the previous room (the title screen)
	// properly set the alarm[1] so it can disappear on its own.
	with(obj_transition)
	{
		alarm[1] = floor(random(global.transition_timer)) + 5;	
	}