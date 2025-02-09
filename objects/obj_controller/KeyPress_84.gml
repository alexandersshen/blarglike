/// @description Insert description here
// You can write your code in this editor
if (global.player_health <= 0)
{
	console(">> twitter post");

	// Define the base URL for Twitter intent
	var base_url = "https://twitter.com/intent/tweet?text=";

	// Format the tweet content
	var tweet_text = "BLARGLIKE Daily Run: " + string(global.high_score) + "%0A"
                  + "Score: " + string(global.player_score) + "%0A"
                  + "🌿 🌿 🤖 🌿 🌿%0A"
                  + "Play BLARGLIKE: https://www.shenbotmakes.com";

	// Construct the full URL
	var share_url = base_url + tweet_text;

	// Open the share URL in the browser
	url_open(share_url);
}