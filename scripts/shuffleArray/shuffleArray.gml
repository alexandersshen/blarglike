// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function shuffleArray(myArray){

	var length = array_length(myArray);

	for (var i = length - 1; i > 0; i--) {
	    var j = irandom(i); // Random index from 0 to i
	    var temp = myArray[i];
	    myArray[i] = myArray[j];
	    myArray[j] = temp;
	}
	
	return myArray;
}