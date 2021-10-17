# Introduction to Fiji: Programming and Writing Macros for Image analysis

An *illuminate-virtual* interactive workshop organized by the ABIF, taking place online on October 21 2021.

<br>

# What you need for this workshop

Please make sure you have Fiji downloaded and installed on your computer, or download Fiji for your operating system from [fiji.sc](https://fiji.sc/) - make sure it is Fiji, not simply ImageJ, since Fiji is easier to work with. Installation and updates can take a few minutes, so please have this ready before the start of the class.

<br>

**Please download the demo image sets from this repository** click on the green Code button, and then "Download ZIP". Then, you can extract images (ending in .tif) in Windows / OS X.

<br>

## Why do biologists write macros/script in Fiji?

Fiji allows you to manipulate image data in a myriad of ways to extract biologically relevant information from microscope images. Writing macros can help streamline data processing, extraction and analysis.

Quite simply, the goal of writing macros is the reduce the amount of work and number of clicks required by the user to process images and extract meaningful information. Two main benefits emerge from such streamlining: 1) it makes data processing or analysis much easier, or much less daunting, 2) it can reduce the frequency of human error when analysing multiple images, by reliably applying the same sequence of functions on a set of images. 

As an added indirect benefit, learning how to write macros in Fiji is often an easier and more pragmatic introduction to the basics of programming for scientists without an extensive background in programming or computer science. 

This is a pretty broad goal. This can mean performing the same task over and over on a folder of images, or reduce multiples tasks into a macro that is launched by a single click. Note that the goal is not necessarily to “automate analysis”, though automation is often sought after. 

<br>

## How to write macros in Fiji

<br>

* Launch Fiji
* Click on Plugins > Macros > Record...  -> make sure the drop-down menu next to Record: says Macro
* Click on Plugins > New > Macro  -> Click on Language, and set it to IJ1 Macro

To write a simple macro from scratch, the easiest is to open an image, perform the processing/analysis functions once in order (e.g. reset contrast, apply colours to different channels,  run a gaussian blur on the image, create a projection, etc). Then, try to find each of the relevant commands for each function in the Record window, and copy-paste these commands into the Macro window. Then, we can open another file meant to be processed the same way, and use the newly written macro by selecting the image and then clicking Run in the Macro window, to process the image in this way. 

We'll do this in exercise 1, where we will generate a few commands using the record functions, and paste them into a macro to run all these steps with a single click.

<br>


## Exercise 1 - Make a composite image from multi-channel image files

To get started, we'll write a short script to process 3-channel images. The images are of fixed cells labeled with DAPI, Phalloidin-AF488, and Mitotracker-Orange, and these cells were imaged on a widefield fluorescence microscope. Fluorescence microscope image files such as these ones often encode multiple image planes when imaging multiple fluorophores, acquiring z-stacks, or acquiring timelapses. For example, each file in the demo image folder encodes three images (one for DAPI, one for Phalloidin, and one for Mitotracker orange).

These multi-plane image files cannot be easily opened or read by regular consumer software (Microsoft Powerpoint, Outlook, Adobe Illustrator, etc...). It is often useful to be able to view and share these images with commonly used software, be it for a presentation, a report, or just to quickly sort through a large number of images.

In order to generate images that we can display and visualize in these software, we have to process the image files into more widely compatible image files (.tif, .jpg, .png...) or movie files (.avi, .mov, etc) in the case of timelapse images. 

We'll do this first "manually" in Fiji to record the commands using on of the demo images, then we will paste them into the macro window. 

First, we'll get our Record window and our Macro editor window open:
* Click on Plugins > Macros > Record...  -> make sure the drop-down menu next to Record: says Macro
* Click on Plugins > New > Macro  -> Click on Language, and set it to IJ1 Macro

Then we'll open and process one image file:
* Open an image from the demo images (e.g demo_DAPI_Phalloidin_Mitotracker_001.tif)
* Open the Channels Tool in Image > Colors > Channels Tool... 
* In the Channels Tool drop-down menu, select Color

At this point, you'll notice that the first channel is display with a red lookup table (LUT). This first channel is DAPI, and so typically it's more intuitive to display it in blue (or Cyan). If you check the second channel, it is green, which is fine, and then the third channel for Mitotracker is blue, which isn't ideal. 

You'll also notice that each image appears to be dim, which we will adjust as well. Click on Image > Adjust > Brightness & Contrast

* In the Channels Tool, Select Channel 1
* Click on More >> and then select Blue
* In the B&C window, click Auto
* In the Channels Tool, Select Channel 2
* Click on More >> and then select Green (*even if already green...*)
* In the B&C window, click Auto
* In the Channels Tool, Select Channel 3
* Click on More >> and then select Magenta (*easier to see for colour-blind people*)
* In the B&C window, click Auto
* In the Channels Tool drop-down menu, select Composite

Now, this image is still a multi-plane image file - it is simply *displayed* as a composite by Fiji. To generate a single-plane image from this, click on Image > Type > RGB Color
This will generate a new image, which is single-plane with encoded color. You can now save this locally on your computer (File > Save As > Tiff...). This saved image should open is a more useful manner in most common software.

Ideally, you would want to do this on many images, not just the first one you opened. This whole process, while relatively easy, turns out to be about 15 clicks, thus, to do this on 10, 20 or 100 images would be time-consuming and tedious. So, using the information in our Record window, let's generate a macro to launch all those commands with a single click. 

<br>

First, in the Macro editor, on line 1, let's type in some information for us humans:

<br>

`// Macro to set Blue, Green and Magenta LUTs to three-channel image files and make a composite RGB image`

<br>

Make sure you include the two forward slashes: `//` -> this tells Fiji that this line is a comment, and will not be read as a command by Fiji. It is super useful to leave explanations or what you wrote, and why!

<br>

Now, let's **copy** each of these commands from our Record window and **paste** into to our Macro editor window, making sure to copy the whole line including the semi-colon `;` at the end of each line: 

<br>

`Stack.setChannel(1);`

`run("Blue");`

`run("Enhance Contrast", "saturated=0.35");`

<br>

`Stack.setChannel(2);`

`run("Green");`

`run("Enhance Contrast", "saturated=0.35");`

<br>

`Stack.setChannel(3);`

`run("Magenta");`

`run("Enhance Contrast", "saturated=0.35");`

<br>

`Stack.setDisplayMode("composite");`

<br>

`run("RGB Color");`


**Importantly**, as much as possible, **please copy-paste** commands from the Record window, or other macros that work. The syntax, including the semi-colon at the end of each line, the double-quotes, and upper- vs lower-case usage needs to be exact, and the macro will not run if typos slip in due to retyping.

<br>

Let's try it out. Open another image from the demo-images folder (e.g demo_DAPI_Phalloidin_Mitotracker_009.tif), click on the Macro editor window, and click Run. 

<br>

For this simple macro, that simply generates a new image file, it can be run on a folder of images using the Batch function in Fiji. Batch processing reduces the amount of clicks and potential human mistakes even further, since it will apply the same function to a whole folder, and saves the resulting images in a new folder, with the same filenames.

<br>

* Click on Process > Batch > Macro
* Click on Input, and navigate to the folder containing the demo images
* Click on Output, and create a new folder to store the RGB images that will be created
* Output format: TIFF, and leave the two other dropdown menus unchanged
* In the Macro editor, select all the lines of code, and copy them (Ctrl-C or Edit > Copy)
* Paste the code into the large text field in the Batch Process window
* Click Process

Fiji will then apply apply this function to all images in the selected input folder, and save as new Tiff images in the Output folder. 

<br>

*Et voilà*, you just wrote a very simple macro and managed to run it on a folder of images! 

<br>

A few things to note. Fiji will attemps to run your script *as is* on the image files in your folder. In this regard, the script we just wrote is not very robust, since if you try to run it on an image that does not read have at least three channels, it will fail. For example, if you try to run this exact macro on an image with two channels, it will throw an error when it reaches the command:

`Stack.setChannel(3);`

because Channel number 3 does not exist in a two-channel image...

Other potential issues with copy-pasting from the Recorder will be further discussed as we go. In most cases, these are relatively easily addressed by making the scripts a bit more general...

<br>


<br>

## Exercise 2 - Segmentation of DAPI stained nuclei, and intensity measurements from other channels

In this exercise, we'll go through a commonly used sequence of functions to perform segmentation of objects (in this case, nuclei), store the shapes of the nuclei, and then measure intensity information within the are of those nuclei in other channels.

<br>


Like in the previous exercise, we'll get need our Record window and our Macro editor window open. If Macro editor is already open and you already have a macro going, simply create a new macro tab with File > New, and make sure the language is IJ1 Macro

Then we'll open and process one image file:
* Open an image from the demo images (e.g demo_DAPI_Phalloidin_Mitotracker_001.tif)


It is often easier to work on images separately from their original stack. Since we'll be applying a threshold to the DAPI image only, we'll duplicate that image from the stack, and apply functions there.

* With the image open, make sure you set the first channel (with the scroll bar below the image), showing DAPI nuclei. 
* Click on Image > Duplicate, and uncheck the "Duplicate Hyperstack" box - then click OK

This will create a new image with only one channel, which should be DAPI.

Usually, for segmentation purposes, we tend to apply a few convolution filters to help deal with noise (Median filter), or to blur the image to accentuate objects of a certain size (Gaussian blur). We will not be discussing convolution filters such as these in this workshop, so please make sure you are somewhat familiar with these...

* On the newly duplicated image, we'll apply a Median Filter: Process > Filters > Median...
* In the window, change the size to 1 pixel (make sure pixel units are selected), and click OK

The median filter will help suppress noise in the image. While it is not critically important for these demo images, it is a commonly used processing step that is worth being aware of. 

Then, we will apply a Gaussian Blur filter, which will substantially blur the image - don't worry, this is ok!

* Click Process > Filters > Gaussian Blur... 
* Change the size to 7 pixels (make sure pixel units are selected), and click OK

This generates a much more blurry image, which quells small objects and noise, thereby accentuating larger objects.

Now we'll apply a threshold, using the Otsu algorithm. The Otsu algorithm tries to find the trough/valley between a population of low-intensity pixels (such as the low-intensity space between cells) and a population of high-intensity pixels (in this case, the DAPI nuclei). 

* Click on Image > Adjust > Threshold
* Make sure Dark Background is selected
* From the method menu, select Otsu
* Click Apply

This will generate a binary image, where each pixel has either a value of 0 (representing background) or 255 if they were above the calculated threshold. It is now easy for the computer to find objects when there are only two values -> objects will have a value of 255.

From here, we want to have each closed continuous structure identified as an object, and store the position and shape of these objects, to then measure intensity in other channels.

* Click on Analyze > Analyze Particles...
* It's worth setting a size limit: for today, let's say 900-Infinity, and check the Pixel Units box
* Check "Add to Manager" and "Exclude on edges"
* Click OK

This will find all continuous objects within the given size limits, and store their position and information as Regions Of Interest (ROIs) in the ROI manager.

Now, let's go measure the intensity of the phalloidin channel within those nucleus areas!

* Click on the original three-channel image
* Select channel 2 using the horizontal scroll bar at the bottom of the image
* Click on the first ROI in the ROI manager, and click the Measure button

A Results Table will pop up, containing intensity information within the ROI

* Click again on the original image
* Click on the second ROI in the ROI manager, and click Measure...

Repeat this with each ROI! 






