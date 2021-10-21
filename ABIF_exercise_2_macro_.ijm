// ABIF Fiji macros workshop - exercise 2
//
// Segment DAPI stained nuclei (channel 1), measure intensity in nuclei area in channel 2
// input: need an open raw image
// output: data in the Results Table

// Goals:
// recor a few more lines
// store an image in a variable
// adjust for changing active windows/images
// manage ROIs, store the number of ROIs in a variable
// write a for loop!


// delete previous ROIs...
roiManager("reset");

// store raw image in a variable to recall later in the script
raw_image = getImageID();

// selecting DAPI channel, and duplicating just that slice
Stack.setChannel(1);
run("Duplicate...", " ");

// applying Median filter to suppress noise a little bit
run("Median...", "radius=1");

// using Otsu threshold, and creating a binary image
setAutoThreshold("Otsu dark");
run("Convert to Mask");


// get ROIs for each object and store in ROI Manager
run("Analyze Particles...", "size=2500-Infinity pixel exclude add");

// go back to raw image
//selectWindow("demo_DAPI_Phalloidin_Mitotracker_001.tif");
selectImage(raw_image);

// get the current number of ROIs in the ROI manager
numROI = roiManager("count");

//for loop: a programming expression to repeat a sequence of commands in an iterative fashion
for (i = 0; i < numROI; i++) {

    roiManager("Select", i);
    Stack.setChannel(2);
    run("Measure");

}

