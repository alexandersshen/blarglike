/// @description Insert description here
// You can write your code in this editor

// full screen check
if os_browser != browser_not_a_browser
{
	if display_get_width()!=window_get_width() {
	    // resize window to display
	    window_set_size(display_get_width(),display_get_height());
	}
}