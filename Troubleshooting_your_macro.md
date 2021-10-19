### Troubleshooting your macro

<br> Most of the time, once your scripts get a little bit elaborate, your script will not run perfectly on its first run. There are almost always bugs which throw errors, or you identify potential improvements while testing it.

*this guide is still in progress of being written, and should be available in time for the workshop* 

<br>

We have a lot of people registered for this workshop, so it is possible we don't address everyone's questions. Please refer to these guidelines if your macro doesn't run properly, or if it throws an error and terminates.

<br>

**Important** if you get an error window, please read the error! Even if it appears cryptic, it will help you solve the error, and usually indicate the line where the error occured!
Even if you don't fully understand what the error message means, it'll be easier to get help either from a colleague or with Google if you read the error message!

<br>

## First: check the language!

In the macro editor window, please make sure you have the appropriate language selected. For this workshop, we will write in the ImageJ Macro Language.

To this end, in the macro editor window, please click on Language > IJ1 macro

Also, when using the recorder, please make sure the Record drop-down menu is set to "Macro"

## Check the colors!

You'll notice that the Macro editor uses different coloured text depending on the language and how it detects the expressions you paste in. 

For example: 
* functions are yellow
* Strings are in pink
* Numbers are in purple
* Comments are in green
* Statements (for, if else, while) are blue
* Brackets, square brackets, and curly braces are red
* variables are in black  

While this might be a bit abstract at first, you'll slowly get used to recognising these colours.

<br>

## Check for semi-colons at the end of each line

This may have changed by now, but it was required to have a ; at the end of each line, except for statements such as for, if, else, while, which use curly braces {}


<br>

## error message: "Undefined variable"

<br>

If the script can't find a variable called in a function, it will throw an Undefined variable error, and indicate the line at which this error occurred.

This happens when a variable is called in a function, but that variable doesn't yet exist. This can happen when copy-pasting bits of code from different sources and forgetting to create a variable, or if you made a typo when calling a variable.

For example:

```
// first let's create a variable called "my_variable" in which we will store the string "This is a string"

my_variable = "This is a string";


//let's print this variable in the log window

print(my_variable); // this will work
print(my_Variable); // this would throw an "Undefined variable" error - variable names are case-sensitive
```

<br>


## error message: "Unregonised command"

If the script can't find a command, it will throw an "Unrecognised command", usually due to a typo while typing the command.

For example:
```
run("Green"); // this will work, since "Green" is a command that exists in 
run("green"); // this would throw a Unrecognised command error, due to the lower case g
```

## error message: ")" expected

The script is indicating that a certain function requires a bracket to close the arguments, and that bracket is somehow missing...

For example, if you try each line individually:
```
print("this is a string"); // this will work

print("this is a string"; // this will not work, since the closing bracket ) is missing
print("this is a string)"; // this will not work, since the closing bracket ) is inside the string and will not be read as closing the arguments to that function
print("this is a string); // this will not work, since the closing bracket ) is inside an incomplete string (missing quotes to close the string)
```

<br>

...more error examples to come!
