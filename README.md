Darek Biskupski

assignment_tetris
=================
rack 'em and stack 'em!

[An Object-Oriented Ruby project from the Viking Code School](http://www.vikingcodeschool.com)

You might approach the problem in the following way, though it's really up to you:

Set up the basic board and constraints
Begin with a simple square piece and set up "turns"
Run the game and include victory/loss conditions
Add additional pieces and their rotations
Make the user input more "realtime" by not requiring the ENTER key. You can check out this Stack Overflow Post and this library for some help doing this.

- Class Player

- Class Board

- Class AI

- Class Game

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











COMMENTS:
- continues movement - gem


