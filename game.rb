
class Game

    def initialize
        @board = Board.new
        @player = Player.new
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
        move = ""
        welcome
        @board.render_board
        while @board.is_board_full? || move = "q"
            @player.get_user_name
            puts "Please provide move: a,d,s,q"
            move = @player.ask_for_coordinates
            @board.move_block(move)
            coord = @board.current_coord
            @board.add_block_to_board unless @board.check_if_space_under?
            @board.render_board    
            # Pass user coordinates to the board class
            # Board class - generate the block and update array with block moved
            # display score
            break if game_over?
            # quit
        end
    end

    def game_over?
        @board.is_board_full?
        # the game is finished if the board is full or the user presses 'q'
    end

end