// Function to encode floor to add a layer of obfuscation
function encode_battery(_floor) {
    return (_floor * 9 + 2626) % 10000; // Simple encoding method for floor
}