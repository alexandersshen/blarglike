// Function to encode floor to add a layer of obfuscation
function encode_moves(_moves) {
    return (_moves * 3 + 746) % 10000; // Simple encoding method for floor
}