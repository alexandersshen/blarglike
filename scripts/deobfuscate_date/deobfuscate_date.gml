// Function to decode the obfuscated date back to YYYYMMDD format
function deobfuscate_date(obf_value) {
    var date_value = (obf_value - 19283) div 41; // Reverse obfuscation
    var year = (date_value div 372) + 2000;
    var remaining = date_value mod 372;
    var month = (remaining div 31) + 1;
    var day = (remaining mod 31) + 1;  // Adjust back to 1-based day
    
    // Validate date
    if (month < 1 || month > 12 || day < 1 || day > 31) {
        return "Invalid date";
    }

    return (year * 10000) + (month * 100) + day;
}