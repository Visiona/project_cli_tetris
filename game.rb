
class Game

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
        # check if space under - if false call add new block to board
        # display score
        # break if game_over?
        # end loop
        quit
    end

    def game_over?
        # the game is finished if the board is full or the user presses 'q'
        # returns true if the game is over, otherwise false
    end

end