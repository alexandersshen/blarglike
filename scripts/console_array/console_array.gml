// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function console_array(my_array){
	// Assuming you have a 2D array called my_array
	for (var i = 0; i < array_length(my_array); i++) { // Loop through rows
	    var row_message = ""; // String to build the row
	    for (var j = 0; j < array_length(my_array[i]); j++) { // Loop through columns
	        row_message += string(my_array[i][j]) + " "; // Add each element to the row
	    }
	    // Output the row
	    show_debug_message("Row " + string(i) + ": " + row_message);
	}

}