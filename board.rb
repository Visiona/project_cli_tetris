# BOARD 10 x 10
# [['_','_','_','_','_','_','_','_','_','_'], - ROW 0
# ['_','_','_','_','_','_','_','_','_','_'], - ROW 1
# ['_','_','_','_','_','_','_','_','_','_'],
# ['_','_','_','_','_','_','_','_','_','_'],
# ['_','_','_','_','_','_','_','_','_','_'],
# ['_','_','_','_','_','_','_','_','_','_'],
# ['_','_','_','_','_','_','_','_','_','_'],
# ['_','_','_','_','_','_','_','_','_','_'],
# ['_','_','_','_','_','_','_','_','_','_'],
# ['_','_','_','_','_','_','_','_','_','_']] - ROW 9

# [,,,,,'X',,,,]

class Board

  def initialize
  # initialize array 20 by 10 board (or 10 by 10)
  # initialize block generator - ????
  # coordinates of block (middle of board, top row)
  end

  def render_board
  # we loop through array/board rows
    # we loop through every place in row aka columns
    # if any blank then next
  end

  def add_block_to_board
  # check if coordinates_available?(coord_of_new_block)
  # add piece ('X') to first row, middle column
  end

  def coordinates_available?(coord) # ie. coord = [1,2]
  # check if coord is nil
  end

  def coordinates_valid?(coord)
  # if (0..9).include?(coords[0]) && (0..9).include?(coords[1])
  # true
  end

  def is_row_full?(coord)
  # if coord[0].all?{|cell| cell == 'X' }
  # true
  end

  def clear_row
  # empty_row = [nil,nil,nil,nil,nil,nil,nil,nil,nil,nil]
  # loop through the rows # in advanced version we need to remove pecific row rather then alway the bottom one and previous row to the deleted one
  # if is_row_full?(coord) ie. row 3
  # board[9].pop
  # board.unshift(empty_row)
  end

  def is_board_full?
  # check if top row is full - is_row_full(row 0,0) 
  end


  def move_block(mov)
  # if mov = "s"
  # update board arr[x+1, y], clear current cell

  # if left 
  # update board arr[x, y-1], clear current cell

  #if right
  # update board arr[x, y+1], clear current cell

  # update current block coordinates - global variable
  end

  def check_if_block_seated
  # get current block coordinates
  # if coordinates arr[x+1, y] is not nil?
  end
end