require 'block.rb'

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


  def coordinates_available?(coords) # ie. coord = [1,2]
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





  def move_block(mov)
    # @board_arr[x][y] = nil # @board_arr[coords[0]][coords[1]] = piece
    @current_coord.each do |coord|
      x = @current_coord[0]
      y = @current_coord[1]

      temp = []

      if mov == "a" # left
        @current_coord.each do |coord|
          temp << [coord[0], coord[1] - 1]
        end
      end

      if we move left then create temporary coordinates which is at current coord after movement
      Check if coordinates valid
       for this move for temporary coordinates
       coordinates_available and if true then clear current shape from board
       Put shape into new location
    end



    if mov == "a" # left
      if coordinates_valid?([x,y-1]) && coordinates_available?([x,y-1])
        @board_arr[x][y] = nil
        @board_arr[x][y - 1] = "X"
        @current_coord = [x, y-1]
      end
    elsif mov == "d" # right
      if coordinates_valid?([x,y+1]) && coordinates_available?([x,y+1])
        @board_arr[x][y] = nil
        @board_arr[x][y + 1] = "X"
        @current_coord = [x, y+1]
      end
    elsif mov == "s" # down
      if coordinates_valid?([x+1,y]) && coordinates_available?([x+1,y])
        @board_arr[x][y] = nil
        @board_arr[x + 1][y] = "X"
        @current_coord = [x+1, y]
      end
    end
  end

  def is_adjacent_full?
    x = @current_coord[0]
    y = @current_coord[1]
     # if moving left, right or down and there are no moves possible, the game should end
    if board_arr[x][y-1] == "X" && board_arr[x][y+1] == "X"
      puts "You can't move. You lost!! HAHAHA"
      return true
    end
  end
 

  def check_if_space_under?
    x = @current_coord[0]
    y = @current_coord[1]

    if coordinates_valid?([x+1,y])
      @board_arr[x+1][y].nil?
    else
      false
    end
  end
end
