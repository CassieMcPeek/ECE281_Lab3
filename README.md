ECE281_Lab3
===========

Elevator Lab


I accidentally added all of the files from my Lab3 folder on my computer, instead of just the files needed.

# Schematic
![alt text] (https://raw.github.com/CassieMcPeek/ECE281_Lab3/master/Schematic.jpg "Schematic")


# Main Lab
For the first part of this lab, I had to take the Nexys2_top_shell code given to us by Capt Silva and create a component for the MooreElevator code that I did in CE3. I also needed to make an instantiation statement for the Moore Elevator code, so I simply used the view instantiation template option in ISE project manager. After I had placed both of those into the shell program, I had to make sure I had the correct signals for the ouputs. Then I ran the generate programming task to check the overall program. I did end up with a few warnings, which I later found out was okay to have for this lab. I spent a while trying to figure out how to fix the warnings, but I was never able to determine proper solutions to those. After that was done, I programmed my FPGA and tested to ensure that my elevator moved up and down from floor 1 to floor 4 and back, and that it stopped and reset properly. I successfully demonstrated the functionality for my Moore Machine on 11 MAR 2014 at 1100 to Capt Silva.

For the next part, I had to do the same process as above except for the Mealy Elevator code from CE3.
