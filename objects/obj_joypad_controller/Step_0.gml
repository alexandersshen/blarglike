/// @description Handle gamepad inputs, including D-pad and left analog stick
//if (numControllers > 0)
//{
	if (global.joyPadUsage)
	{
		// Thwak (button action)
		if gamepad_button_check_pressed(0, gp_face1) {
		    scr_playerThwak();
		}

		if (room != rm_title) {
			// =========================
		    // Deadzone for analog stick
			// Deadzone defined as the space between "direct direction" And the wiggle
			// room before the other direction is to be applied. For example a deadzone of 0
			// would mean that if you're going up, the slightest right would start to
			// make it go diagonal. A wider deadzone is more forgiving.
			// -------------------------
		    var deadzone = 0.4;
		    var stick_x = gamepad_axis_value(0, gp_axislh); // Horizontal axis (-1 to 1)
		    var stick_y = gamepad_axis_value(0, gp_axislv); // Vertical axis (-1 to 1)

		    // Flags to prevent conflicts between D-pad and analog stick
		    var dpad_active = false;

		    // D-pad controls (prioritize these over analog stick)
		    if gamepad_button_check(0, gp_padu) {
		        scr_playerUpPressed();
		        dpad_active = true;
		    } else if gamepad_button_check_released(0, gp_padu) {
		        scr_playerUpReleased();
		    }

		    if gamepad_button_check(0, gp_padd) {
		        scr_playerDownPressed();
		        dpad_active = true;
		    } else if gamepad_button_check_released(0, gp_padd) {
		        scr_playerDownReleased();
		    }

		    if gamepad_button_check(0, gp_padl) {
		        scr_playerLeftPressed();
		        dpad_active = true;
		    } else if gamepad_button_check_released(0, gp_padl) {
		        scr_playerLeftReleased();
		    }

		    if gamepad_button_check(0, gp_padr) {
		        scr_playerRightPressed();
		        dpad_active = true;
		    } else if gamepad_button_check_released(0, gp_padr) {
		        scr_playerRightReleased();
		    }

		    // Analog stick controls (only if D-pad is not active)
		    if !dpad_active {
		        // Check the dominant direction based on the larger axis magnitude
				if (stick_x < deadzone) && (stick_x > -deadzone) && (stick_y < deadzone) && (stick_y > -deadzone)
				{
					// console("dead zone");
					scr_playerUpReleased();
					scr_playerDownReleased();
					scr_playerLeftReleased();
					scr_playerRightReleased();
				} else {
					// show_debug_message("Stick X: " + string(stick_x) + ", Stick Y: " + string(stick_y) + " dz: " + string(deadzone));
			
					// horizontal lane
					if (stick_x < deadzone) && (stick_x > -deadzone)
					{
						scr_playerLeftReleased();
						scr_playerRightReleased();
				
						// up
						if (stick_y) < deadzone
						{
							scr_playerDownReleased();
							scr_playerUpPressed();
						}
		
						// down
						if (stick_y) > -deadzone
						{
							scr_playerUpReleased();
							scr_playerDownPressed();
						}
					} else {
						// up
						if (stick_y) < deadzone
						{
							scr_playerDownReleased();
							scr_playerUpPressed();
						}
		
						// down
						if (stick_y) > -deadzone
						{
							scr_playerUpReleased();
							scr_playerDownPressed();
						}				
					}	
			
					// horizontal lane
					if (stick_y < deadzone) && (stick_y > -deadzone)
					{
						scr_playerUpReleased();
						scr_playerDownReleased();
				
						// right
						if (stick_x) > deadzone
						{
							scr_playerLeftReleased();
							scr_playerRightPressed();
						}
		
						// left
						if (stick_x) < -deadzone
						{
							scr_playerRightReleased();
							scr_playerLeftPressed();
						}
					} else {
						// right
						if (stick_x) > deadzone
						{
							scr_playerLeftReleased();
							scr_playerRightPressed();
						}
		
						// left
						if (stick_x) < -deadzone
						{
							scr_playerRightReleased();
							scr_playerLeftPressed();
						}
					}
				}
		    }

		    // Pause button
		    if gamepad_button_check_pressed(0, gp_start) {
		        scr_playerPause();
		    }
		} else {
			// title screen
			if (room == rm_title)
			{
				if gamepad_button_check_pressed(0, gp_face1) {
					scr_generateBlueCurtain();
				}
			}
		}
	}
//}