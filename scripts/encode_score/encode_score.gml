// Function to encode the score based on score
function encode_score(_score) {
    return (_score * 17 + 827) % 10000; // Create more varied encoding
}