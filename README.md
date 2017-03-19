Darek Biskupski and Andrea A

assignment_tetris
=================
rack 'em and stack 'em!

[An Object-Oriented Ruby project from the Viking Code School](http://www.vikingcodeschool.com)

=======
You might approach the problem in the following way, though it's really up to you:

Set up the basic board and constraints
Begin with a simple square piece and set up "turns"
Run the game and include victory/loss conditions
Add additional pieces and their rotations
Make the user input more "realtime" by not requiring the ENTER key. You can check out this Stack Overflow Post and this library for some help doing this.




class Player
    def initialize
        # store player's running total - maybe keep in Game class
        # name of player
    end

    def get_user_name
        # display message to ask user for name
        # get user name
        # store name
    end


    def ask_for_coordinates
        # loop through the following
        # message to ask for coordinates
        # e.g. a = left, d = right, s = down
        # get coordinates from player
        # validate coordinates
        # return coordinates
    end

    def validate_coordinates
        # check if length of input is 1 and it is a, d or s
        # return error message if the reuslt is false
        # return true or false
    end
end



- Class Board

#initialize
    initialize blank 20 by 10 board
    initialize block generator

#render
display current state of the board

#add new block to board
the block is added to top of board in the middle

#coordinates available
check the space is free

#coordinates_valid
check the coordinates are within the board

#check row is full
check if the row is full

#remove full row
removes the full row at the bottom of the board 
adds an empty array at the top of the board

#board full
the board is full when a block has reached the top row
game ends

#display score
score is displayed after each turn

#move block in steps
Move block down 1 square - press enter

#move block to bottom
Move block to the bottom of the board

# Board generator class - generate block
# Loop/condition the block generation 
# while block is seated - generate new block


#check if block is seated - trigger to create a new block
checking if the block has reached another block below it


- Class BlockGenerator

#generate block
["x"]

#move_block

----Advanced----
#random block
will generate a random number between 1 and 4
and each number will represent a particular shape

square - 1
["x", "x"]
["x", "x"]

l-shape - 2
["", "",  "x"]
["x", "x", "x"]

#rotate shape
calculate new orientation of shape





- Class Game

def initialize
    # Initialize Board, player
    # Initialize Block Generator
    # Initialize Statistics
    # Player Score = 0
end

def welcome
    # display welcome message
    # display instructions and how to quit
end

def quit

end

def increment_score
    # add to current score
    # increment score based on rows/lines removed
end

#display top ten list

def play
    # loop until board is full or break id user quits
    # Board class - render
    # Player class - ask_for_coordinates
    # Board class - generate the block and update array with block moved
    # display score
    # break if game_over
    # end loop
    # Display final score when game lost
end

def game_over?
    # the game is finished if the board is full or the user presses 'q'
    # returns true if the game is over, otherwise false
end



- Class Statistics
#load file
load the saved top ten scores

#save file
save the latest score to the top ten scores

#check position 
compare the current points with the scores in the list







1. Welcome Screen
    a) Upon a new game being started, display the top-10 list
2. Create Player
3. Create blank Board - initialize size of the board
    a)Simple Statistics - ie. lines completed, time, points
4. Create square block on the top of the board
    a) OPTIONAL - Create random object block
5. Allow the player to make a movement
    a) Each turn, the player's current piece falls down a square
    b) Any turn, the player can opt to "drop" the block to the bottom level immediately (to avoid manually dropping the block for X additional turns) - press down to speed up movement
    c) Blocks can be rotated by the user any number of times per turn
    d) Blocks can be moved left-or-right any number of times per turn
6. A new turn starts after the move is entered
    a) Score is displayed each turn
7. If the player's block ends the turn atop an existing row, it stays there and a new block is generated
    a) If a block is rotated such that it overlaps with the tallest existing line, it is placed atop that line in that last configuration. This triggers loss if required as normal.
8. When a line is completed, it disappears the next turn ()
    a) Each time a line is completed, the score is incremented
9. Game is over when the board is full - loosing
a) Once the player finally loses, final score is displayed
b) Add Line complete to statistics
c) If the player is a top-ten score, prompt for their name to add to the list
d) A top-ten scores list is kept in a file


From tic tac toe
Set up the game initially
    Create a game board
    Create a couple players
Start the game loop
    Render the board
    Ask for and validate the current player's coordinates
    If the game should end
        Display the proper victory / draw message
        Stop looping
    Else
        Switch to the next player and keep looping








COMMENTS:
- continues movement - gem


