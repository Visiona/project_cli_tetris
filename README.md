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




- Class Player

store player's running total

#ask for coordinates
player enters left, right, rotate right

#add to current score
increment score based on rows/lines removed



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

#check if block is seated
checking if the block has reached another block below it

#check row is full
check if the row is full

#remove full row
removes the full row at the bottom of the board 
adds an empty array at the top of the board

#board full
the board is full when a block has reached the top row

#display score
score is displayed after each turn

#move block
Move block to the bottom of the board



- Class BlockGenerator

#generate block
["x"]

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
#initialize
Initialize Board, player

#welcome
welcome screen/message

#display top ten list

#play
loop until board is full
request move from player

#check if game over
the game is finished if the board is full or the user presses 'q'



- Class Statistics
#load file
load the saved top ten scores

#save file
save the latest score to the top ten scores

#check position 
compare the current points with the scroes in the list







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


