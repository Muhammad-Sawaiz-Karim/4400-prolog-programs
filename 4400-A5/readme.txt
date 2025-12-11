To compile, first run generator.c with arguments 'words.txt binpattern.txt'.
Then run the Prolog file using a SWIPL interpreter, with predicate "solve." and finally, run display.c to generate the CSV file.


generator.c:
generator reads the arguments from the command line, and defines some arrays to store the words, and the grid.
A special struct is defined for each slot, storing its index, length, direction, and its starting row and column coordinates.
We instantiate two of these structs, one for horizontal slots, and one for vertical slots.

There are functions defined for reading the words and patterns into the previously defined arrays.
Next, we calculate the slots, both horizontal and vertical slots are calculated similarly, by storing the start coordinates, and the length, of consecutive strings of 1s.
This function slots also returns a bit-packed value which is used to keep track of how many vertical and horizontal slots there are.
Next, we start writing the Prolog code, and here we've defined a lot of functions to write them out.
To generate intersections, we brute force check for H and V slots that overlap at any of their coordinates. Any of these intersections is then written to the step2.pl file.


Prolog:
Once the Prolog file is written, it has a few helper predicates defined, namely nth, all_unique, write_word, and print_slot.
The word dictionary is also defined, and the slots that were calculated by the C program.
The actual solver works by first binding the lengths, then binding words, and ensuring the intersection rules are followed.
Once solved, it then will open a file for writing, and write the output to it, in the format of the slot ID, the start x coordinate, the start y coordinate, and the word that was chosen.

display.c:
First, it initializes the grid of characters. Then it will read the slots defined in selectedwords.txt and place the letters in their correct grid position.
Finally, it prints out the grid in CSV format.