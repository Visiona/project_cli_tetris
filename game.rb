require_relative 'board.rb'
require_relative 'player.rb'
require_relative 'stats.rb'
require_relative 'block.rb'


class Game

    attr_accessor :board

    def initialize
        @board = Board.new
        @player = Player.new
        @stats = Stats.new
    end

    def welcome
        puts "Welcome to Tetris."
        puts "You will move a block on the board."
        puts "You can quit the game at any time by entering 'q'."
    end

    def quit
        puts "Your final score is #{@player.total_score}"
        puts "Goodbye."
    end

    def increment_score
        @player.total_score += 1
    end

    def display_score
        @player.total_score
    end

    def display_top_ten
        @stats.get_players
    end

    def play
        move = ""
        welcome
        @player.get_user_name
        @board.add_block_to_board
        @board.render_board
        while move != "q" && !@board.is_board_full? 
            puts "Please provide move: a,d,s,q"
            move = @player.ask_for_coordinates
            @board.move_block(move)
            @board.add_block_to_board unless @board.check_if_space_under?
            increment_score if @board.clear_row_if_full
            @board.render_board
            puts "Player score #{@player.total_score}"
            display_score
            break if @board.is_adjacent_full?
            puts "Move is #{move}"
            break if game_over?
        end
        quit
    end

    def game_over?
        @board.is_board_full?
        # the game is finished if the board is full or the user presses 'q'
    end

end


# TASKS TO DO
# Game doesn't stop when block reaches the top of the board, even if board is not full

# Random shape is not generated, seems to create the same shape throughout the game

# Do rotation





