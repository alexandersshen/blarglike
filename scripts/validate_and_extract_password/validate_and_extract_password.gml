// Function to validate and extract the original date, nutrients, floor, and score from the password
function validate_and_extract_password(password) {
    var parts = string_split(password, "-");  // Split the password by the dash
    if (array_length(parts) != 7) {
        return "Invalid password format";
    }

    var obf_date = real(parts[0]);  // First part is the obfuscated date
    var encoded_score = real(parts[1]);  // Second part is the encoded score
    var encoded_nutrients = real(parts[2]);  // Third part is the encoded nutrients
    var encoded_floor = real(parts[3]);  // Fourth part is the encoded floor
	var encoded_battery = real(parts[4]);	// 5th part is encoded battery
	var encoded_moves = real(parts[5]);	// 6th part is encoded moves
	var encoded_grabbed = real(parts[6]);	// 7th part is batteries grabbed

    var decoded_date = deobfuscate_date(obf_date);  // Decode the date
    if (decoded_date == "Invalid date") {
        return "Invalid date";
    }

    var _score = decode_score(encoded_score);  // Decode the score
    var nutrients = decode_nutrients(encoded_nutrients);  // Decode the nutrients
    var _floor = decode_floor(encoded_floor);  // Decode the floor
	var _battery = decode_battery(encoded_battery); // decode the battery
	var _moves = decode_moves(encoded_moves); // decode the moves
	var _grabbed = decode_battery(encoded_grabbed);	// decode batteries grabbed
	
	if (_moves == ((_grabbed * 5) + ((nutrients - 1) * 10)) + 50 + (_grabbed + (nutrients - 1)))
	{
		return "VALID RUN for date: " + string(decoded_date) + ", Score: " + string(_score);
	} else {
		return "INVALID RUN";
	}

/*
    return "Date: " + string(decoded_date) + ", Score: " + string(_score)
	+ ", Nutrients: " + string(nutrients) + ", Floor: " + string(_floor)
	+ ", Battery: " + string(_battery) + ", Moves: " + string(_moves)
	+ ", Grabbed: " + string(_grabbed);
*/

}