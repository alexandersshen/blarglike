// Function to obfuscate the date in YYYYMMDD format
function obfuscate_date(date_number) {
    var year = date_number div 10000;
    var month = (date_number div 100) mod 100;
    var day = date_number mod 100;
    
    // Adjust for zero-based encoding (subtract 1 from the day)
    var date_value = (year - 2000) * 372 + ((month - 1) * 31) + (day - 1); // Zero-based
    var obf_value = (date_value * 41 + 19283) mod 1000000; // Modulo for obfuscation
    return obf_value;
}