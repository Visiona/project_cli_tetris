require 'io/console'

class Player
    attr_accessor :total_score, :name
    # store player's running total - maybe keep in Game class

    def initialize
        @name = name
        @total_score = 0
    end

    def get_user_name
        puts "Please enter your name"
        @name = gets.chomp
    end

    def ask_for_coordinates
        loop do
            puts "Enter your move coordinates"
            puts "e.g. a = left, d = right, s = down, q = quit"
            input = STDIN.getch
            print "            \r"
            return input if validate_coordinates(input)
        end
    end

    def validate_coordinates(input)
        valid_input = ["a", "d", "s", "q"]
        input.length == 1 && (valid_input.include? input) ? true : (puts "Invalid input")
    end
end
