#Task Instruction
Write a program that parses a dictionary file for unique sequences of letters.

Requirements:

    The program should generate two output files, "sequences" and "words".
    The sequences file should contain every unique sequence of four letters that are unique and appear in exactly one word of the dictionary file.
    Differences in casing should not reflect a unique sequence.
    Numbers and special characters should not create a unique sequence.
    The words file should contain the corresponding words that contain the sequence, in the same order, again one per line.

For example, given the trivial dictionary containing only

arrows
18th
carrots
give
me
Isn't

The outputs should be:

'sequences'             'words'

carr                    carrots
give                    give
rots                    carrots
rows                    arrows
rrot                    carrots
rrow                    arrows

'arro' does not appear in the output since it is found in more than one word. 18th does not appear in the output because it contains numbers.

# Code

Comment markers have been placed throughout the code that indicate where each requirement is implemented. 
So to find where each requirement point is, do a site wide with the search term "Task: "

# To Run

To run the sequence word matcher, be sure you are in the path of the app.
Then in the console, run the command:
    ```
   ruby -I . -r "engine" -e "Engine.run"
    ```
Note that the word list file is already included in this package (location: 'words_test/words')

You'll see a log status of the process as seen at location 'words_test/screenshot_of_process_log.png'

# Note on Performance

Given more development time, an array cache for words previously found would allow words_test to run faster, 
but even better would be for words_test to be rewritten to use ruby Ractors. This would allow parallel execution. 
Analysis would be done for where Ractor blocks would be placed and its messaging to output the 
sequence word pairs to be ordered to meet that specific requirement.


