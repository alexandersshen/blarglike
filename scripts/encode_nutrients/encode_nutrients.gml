// Function to encode nutrients to add a layer of obfuscation
function encode_nutrients(nutrients) {
    return (nutrients * 3 + 151) % 10000; // Simple encoding method for nutrients
}