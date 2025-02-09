// Function to encode floor to add a layer of obfuscation
function encode_floor(_floor) {
    return (_floor * 7 + 123) % 10000; // Simple encoding method for floor
}