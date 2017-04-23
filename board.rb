class Board
  attr_accessor :current_coord, :board_arr

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
    @current_coord = [0,5]            
  end

  def render_board
    @board_arr.each do |x|
      x.each do |y|
        print "|#{y}"
      end
      puts 
    end
  end

  # we loop through array/board rows
    # we loop through every place in row aka columns
    # if any blank then next
  end

  def add_block_to_board
    if coordinates_available?([0,5])
      @current_coord = [0,5]
      @board_arr[0][5] = "X"
    end
  end

  def coordinates_available?(coord) # ie. coord = [1,2]
    @board[coord[0], coord[1]].nil?
  end

  def coordinates_valid?(coord)
    (0..9).include?(coord[0]) && (0..9).include?(coord[1])
  end

  def is_row_full?(coord)
    @board[coord[0]].all?{|cell| cell == 'X' }
  end

  def clear_row
    empty_row = [nil,nil,nil,nil,nil,nil,nil,nil,nil,nil]
   # loop through the rows # in advanced version we need to remove pecific row rather then alway the bottom one and previous row to the deleted one
    if is_row_full?([9,nil])
      @board[9].pop
      @board.unshift(empty_row)
    end
  end

  def is_board_full?
    is_row_full?([0,nil])
  end

  def move_block(mov)
    x = @current_coord[0]
    y = @current_coord[1]
    @board_arr[x][y] = nil # @board[coords[0]][coords[1]] = piece

    if mov == "a" # left
      if coordinates_valid?([x,y-1]) && coordinates_available?([x,y-1])
        @board_arr[x][y - 1] = "X"
        @current_coord = [x, y-1]
      end
    elsif mov == "d" # right
      if coordinates_valid?([x,y+1]) && coordinates_available?([x,y+1])
        @board_arr[x][y + 1] = "X"
        @current_coord = [x, y+1]
      end
    elsif mov == "s" # down
      if coordinates_valid?([x+1,y]) && coordinates_available?([x+1,y])
        @board_arr[x + 1][y] = "X"
        @current_coord = [x+1, y]
      end
    elsif mov == "q"
      # decide if we returning anything
    end
  end

  def check_if_space_under?
    x = @current_coord[0]
    y = @current_coord[1]

    @board_arr[x+1][y].nil? 
  end
end





