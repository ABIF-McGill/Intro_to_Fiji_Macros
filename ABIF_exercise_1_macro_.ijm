// ABIF Fiji Macro workshop - exercise 1
// Create a composite image, and save in a format readable by Powerpoint, Illustrator, etc..

// Goals:
// Simply record a few commands to assemble a basic macro

// Bonus: run a command to get the dimensions of the image,
// and use an if statement to only run the script if the image has 3 channels


Stack.setChannel(1);
run("Blue");
run("Enhance Contrast", "saturated=0.35");

Stack.setChannel(2);
run("Green");
run("Enhance Contrast", "saturated=0.35");

Stack.setChannel(3);
run("Magenta");
run("Enhance Contrast", "saturated=0.35");


Stack.setDisplayMode("composite");

run("RGB Color"); 