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
        while move != "q" && !@board.no_space_for_block?
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
        end
        quit
    end

    def game_over?
        @board.no_space_for_block?
    end

end


# TASKS TO DO

# no freeze frame game but flawless
