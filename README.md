ECE281_Lab3
===========

Elevator Lab


I accidentally added all of the files from my Lab3 folder on my computer, instead of just the files needed.

# Schematic
![alt text] (https://raw.github.com/CassieMcPeek/ECE281_Lab3/master/Schematic.jpg "Schematic")


# Main Lab
For the first part of this lab, I had to take the Nexys2_top_shell code given to us by Capt Silva and create a component for the MooreElevator code that I did in CE3. I also needed to make an instantiation statement for the Moore Elevator code, so I simply used the view instantiation template option in ISE project manager. After I had placed both of those into the shell program, I had to make sure I had the correct signals for the ouputs. Then I ran the generate programming task to check the overall program. I did end up with a few warnings, which I later found out was okay to have for this lab. I spent a while trying to figure out how to fix the warnings, but I was never able to determine proper solutions to those. After that was done, I programmed my FPGA and tested to ensure that my elevator moved up and down from floor 1 to floor 4 and back, and that it stopped and reset properly. I successfully demonstrated the functionality for my Moore Machine on 11 MAR 2014 at 1100 to Capt Silva.

For the next part, I had to do the same process as above except for the Mealy Elevator code from CE3. The main difference between the Moore and the Mealy machines was that the mealy accounted for the current floor as well as the next floor. I needed to add an extra signal to make sure that the output for next floor was assigned to something. I made the instantiation of the Mealy code the same way I did for the Moore code above. Once I had created that, I placed it into the Nexys_top_shell code and assigned the outputs. After I checked the syntax of my code to ensure there were no errors, I configured the target device, tested my FPGA and demonstrated functionality of my Mealy Machine to Capt Silva at 1045 on 13 MAR 2014.

After the basic functionality was working, I began work on the behavioral code for the B functionality of more floors. This code incorporated all of thIe prime numbered floors from 0 to 20. This code was pretty straight forward, I had 4 inputs and 2 outputs. The tricky part was figuring out the syntax of the process and case options in VHDL. I had to refer back to my class notes as well as previous labs/CE's to ensure that I was incorporating those into my code properly. For each floor, I accounted for whether or not the up_down button was pushed, and which way the elevator was traveling. I also accounted for whether or not the stop button was pushed. Depending on whether either of these buttons were pushed, I made sure the code sent the elevator to the correct floor. This was done for every floor. After the behavioral was done and the syntax was correct on it. I placed the component into the Nexys top shell code and also instatiated it like the first two. I had to create 2 different signals to account for the outputs and then ensure that the outputs were assigned the correct signal. After I completed the syntax check, I programed my FPGA and demostrated more floors functionality on 13 MAR at 1100 to Capt Silva.

The next part of the B functionality was the change floors VHDL. This was was much harder in the respect that there were many more states to account for while at each floor. I followed along with the syntax of the more floors code to use the process and case options again. And for each floor, I had to make sure that I examined every possible scenario that could take place at that floor. That accounted for a lot of code, but once I got the first couple of floors done, I was able to get through the final ones pretty easily. I then checked the behavioral syntax, placed the component and the instantation into the top shell code, created the correct signal for the ouputs and programmed my FPGA. I demonstrated change inputs functionality to Capt Silva on 13 MAR at 1130.

I am still working on getting the A functionality to this lab. 


Documentation: I used my class notes as well as previous lab/CE's to ensure that I was doing my VHDL properly. 
