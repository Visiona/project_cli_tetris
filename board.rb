require_relative 'block.rb'

class Board
  attr_accessor :current_coord, :board_arr, :shapes, :block, :rand_block

  def initialize
    @board_arr = 
                [[nil,nil,nil,nil,nil,nil,nil,nil,nil,nil], # ROW 0
                [nil,nil,nil,nil,nil,nil,nil,nil,nil,nil], # ROW 1
                [nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],
                [nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],
                [nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],
                [nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],
                [nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],
                [nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],
                [nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],
                [nil,nil,nil,nil,nil,nil,nil,nil,nil,nil]] # ROW 9

    # @board_arr = 
    #             [["X","X","X",nil,nil,nil,nil,nil,"X","X"], 
    #             [nil,"X","X","X","X","X","X","X","X","X"], 
    #             ["X",nil,"X","X","X","X","X","X","X","X"],
    #             ["X","X",nil,"X","X","X","X","X","X","X"],
    #             ["X","X","X",nil,"X","X","X","X","X","X"],
    #             ["X","X","X","X",nil,"X","X","X","X","X"],
    #             ["X","X","X","X","X",nil,"X","X","X","X"],
    #             ["X","X","X","X","X","X",nil,"X","X","X"],
    #             ["X","X","X","X","X","X","X",nil,"X","X"],
    #             ["X","X","X","X","X","X","X","X",nil,"X"]] 
     @block = Block.new
     @rand_block = @block.get_random_shape
     @current_coord = nil
  end

  def render_board
    @board_arr.each do |x|
      x.each do |y|
        y == nil ? (print "|_") : (print "|#{y}")
      end
      puts 
    end
  end

  def add_block_to_board
    coords = @block.shape_coords(@rand_block)
    if coordinates_available?(coords) #updating this method
      @current_coord = coords
      update_board_with_shape(coords)
    end
  end

  def update_board_with_shape(coords)
    coords.each {|coord| @board_arr[coord[0]][coord[1]] = "X"}
  end


  def coordinates_available?(coords) # checks all coords nil
    coords.all?{|coord| @board_arr[coord[0]][coord[1]].nil?}
  end

  def coordinates_valid?(coords)
    coords.all?{|coord| (0..9).include?(coord[0]) && (0..9).include?(coord[1])}
  end

  def is_row_full?(coord)
    @board_arr[coord[0]].all?{|cell| cell == 'X' }
  end

  def clear_row_if_full
    empty_row = [nil,nil,nil,nil,nil,nil,nil,nil,nil,nil]
   # loop through the rows # in advanced version we need to remove specific row rather then alway the bottom one and previous row to the deleted one
    if is_row_full?([9,nil])
      puts "Row is full"
      @board_arr.pop
      @board_arr.unshift(empty_row)
      true
    else
      false
    end
  end

  def is_board_full?
    is_row_full?([0,nil])
  end

  def clear_old_coords(coords)
    coords.each {|coord| @board_arr[coord[0]][coord[1]] = nil}
  end

  # Lets continue here, overlapping issue as below outcome from code shows
  def process_movement(temp) 
    if coordinates_valid?(temp) && can_move?(temp)
      puts "DBG: @current_coord first = #{@current_coord.inspect}"
      # @current_coord first = [[0, 4], [0, 5], [1, 4], [1, 5]]
      puts "DBG: temp in process_movement = #{temp.inspect}"
      # DBG: temp in process_movement = [[0, 6], [1, 6]]
      clear_old_coords(@current_coord)
      puts "DBG: @current_coord second = #{@current_coord.inspect}"
      update_board_with_shape(temp)
      @current_coord = temp
    end
  end

  def can_move?(temp_arr) #checks only not overlapped coords if nil
    @current_coord.each {|coord| temp_arr.delete(coord) if temp_arr.include?(coord) }
    temp_arr.all?{|temp_coord| @board_arr[temp_coord[0]][temp_coord[1]].nil?}
    #NoMethodError: undefined method `[]' for nil:NilClass from /Users/Visiona/Documents/Viking_School/Ruby/project_cli_tetris/board.rb:103:in `block in can_move?'
  end


  def move_block(mov)
    temp = []

    if mov == "a" # left
      @current_coord.each { |coord| temp << [coord[0], coord[1] - 1] }
      process_movement(temp)
    elsif mov == "d" # right
      @current_coord.each { |coord| temp << [coord[0], coord[1] + 1] }
      process_movement(temp)
    elsif mov == "s" # down
      @current_coord.each { |coord| temp << [coord[0] + 1, coord[1]] }
      puts "DBG: temp = #{temp.inspect}"
      process_movement(temp)
    end
  end

  def is_adjacent_full?
    temp = []
    @current_coord.each { |coord| temp << [coord[0], coord[1] - 1] }
    @current_coord.each { |coord| temp << [coord[0], coord[1] + 1] }
    # we only need to check spaces that are not already in current coordinates
    @current_coord.each {|coord| temp.delete(coord) if temp.include?(coord) }
    if temp.all? {|coord| @board_arr[coord[0]][coord[1]] == "X" }
      puts "You can't move. You lost!! HAHAHA"
      return true
    end
  end
 

    # add a check if coordinates are valid
  def check_if_space_under?
    temp = []
    @current_coord.each { |coord| temp << [coord[0] + 1, coord[1]] }
    # we only need to check spaces that are not already in current coordinates
    can_move?(temp)
  end

end




