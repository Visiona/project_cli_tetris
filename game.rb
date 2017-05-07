require_relative 'board.rb'
require_relative 'player.rb'
require_relative 'stats.rb'


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
        while !@board.is_board_full? || move == "q"
            puts "Please provide move: a,d,s,q"
            move = @player.ask_for_coordinates
            # puts "DBG: move = #{move}"
            @board.move_block(move)
            coord = @board.current_coord
            # puts "DBG: coord = #{coord}"
            @board.add_block_to_board unless @board.check_if_space_under?
            @board.render_board
            increment_score if @board.clear_row_if_full
            display_score
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
# quit doesn't work
# check to space is under 









