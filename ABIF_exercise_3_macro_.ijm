// ABIF Fiji macro workshop - Exercise 3
// Manual analysis / quality control template

// help steamline manual analysis or quality control check...
// iterate through a folder
// open an image
// allow user to do something
// once that's done
// close image
// open next image...

// commands to choose folders
// waitForUser() command....

input = getDirectory("Choose a source folder");

list_of_files = getFileList(input);
  
number_of_files = list_of_files.length;


for (k = 0; k < number_of_files; k++) {
    
    open(input+list_of_files[k]);

    filename = getTitle();
    print(filename);
    
    // adjust contrast for each channel
    Stack.setChannel(1);
    run("Enhance Contrast", "saturated=0.35");
    

    Stack.setChannel(2);
    run("Enhance Contrast", "saturated=0.35");
    

    Stack.setChannel(3);
    run("Enhance Contrast", "saturated=0.35");

    

    waitForUser("Make a measurement or check for quality control, then click OK");
    
    close();

    
}
