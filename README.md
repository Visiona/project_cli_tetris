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
        # e.g. a = left, d = right, s = down, q = quit
        # get coordinates from player
        # if not "q" then validate coordinates
        # return coordinates
    end

    def validate_coordinates
        # check if length of input is 1 and it is a, d or s
        # return error message if the reuslt is false
        # return true or false
    end
end

BOARD 10 x 10
[['_','_','_','_','_','_','_','_','_','_'], - ROW 0
['_','_','_','_','_','_','_','_','_','_'], - ROW 1
['_','_','_','_','_','_','_','_','_','_'],
['_','_','_','_','_','_','_','_','_','_'],
['_','_','_','_','_','_','_','_','_','_'],
['_','_','_','_','_','_','_','_','_','_'],
['_','_','_','_','_','_','_','_','_','_'],
['_','_','_','_','_','_','_','_','_','_'],
['_','_','_','_','_','_','_','_','_','_'],
['_','_','_','_','_','_','_','_','_','_']] - ROW 9

[,,,,,'X',,,,]

Class Board

def initialize
# initialize array 20 by 10 board (or 10 by 10)
# initialize block generator - ????
# coordinates of block (middle of board, top row)
end

def render_board
# we loop through array/board rows
  # we loop through every place in row aka columns
  # if any blank then next
end

def add_block_to_board
# check if coordinates_available?(coord_of_new_block)
# add piece ('X') to first row, middle column
end

def coordinates_available?(coord) # ie. coord = [1,2]
# check if coord is nil
end

def coordinates_valid?(coord)
# if (0..9).include?(coords[0]) && (0..9).include?(coords[1])
# true
end

def is_row_full?(coord)
# if coord[0].all?{|cell| cell == 'X' }
# true
end

def clear_row
empty_row = [nil,nil,nil,nil,nil,nil,nil,nil,nil,nil]
# loop through the rows # in advanced version we need to remove pecific row rather then alway the bottom one and previous row to the deleted one
# if is_row_full?(coord) ie. row 3
# board[9].pop
# board.unshift(empty_row)
end

def is_board_full?
# check if top row is full - is_row_full(row 0,0) 
end


def move_block(mov)
# if mov = "s"
# update board arr[x+1, y], clear current cell

# if left 
# update board arr[x, y-1], clear current cell

#if right
# update board arr[x, y+1], clear current cell

# update current block coordinates - global variable
end

def check_if_block_seated
# get current block coordinates
# if coordinates arr[x+1, y] is not nil?
end



Class Game

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
# Display final score when game lost and bye message
end


def increment_score
    # add to current score
    # increment score based on rows/lines removed (from board class)
end

def display_score
# get current score
end

#display top ten list

def play
    # loop until board is full or break if user quits
    # generate new block, check_if_block_seated?
    # Board class - render
    # Player class - ask_for_coordinates
    # if coordinates == "q" then break
    # Pass user coordinates to the board class
    # Board class - generate the block and update array with block moved
    # display score
    # break if game_over?
    # end loop
    quit
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



# For next time - start coding and fill in statistics class from file loader previous exercise



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







COMMENTS:
- continues movement - gem


