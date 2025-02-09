// Function to generate a daily password based on date, nutrients, floor, and score
function generate_daily_password(date_number, nutrients, floor, _score,_battery,_moves,_grabbed) {
    var obf_date = obfuscate_date(date_number); // Obfuscate the date
    var encoded_score = encode_score(_score); // Encode score
    var encoded_nutrients = encode_nutrients(nutrients); // Encode nutrients
    var encoded_floor = encode_floor(floor); // Encode floor
	var encoded_battery = encode_battery(_battery);	// encode battery
	var encoded_moves = encode_moves(_moves); // encode moves
	var encoded_grabbed = encode_battery(_grabbed); // encode batteries grabbed
	
    return (string(obf_date) + "-" + string(encoded_score) + "-" 
	+ string(encoded_nutrients) + "-" 
	+ string(encoded_floor) 
	+ "-" + string(encoded_battery) + "-"
	+ string(encoded_moves) + "-"
	+ string(encoded_grabbed)); // Combine encoded date, score, nutrients, and floor
}