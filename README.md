# Introduction to Fiji: Programming and Writing Macros for Image analysis

An *illuminate-virtual* interactive workshop offered by the ABIF   

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

First, we'll get or Record window, and our Macro editor window open:
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








