require_relative 'block.rb'
require 'pry'


class Board
  attr_accessor :current_coord, :board_arr, :shapes, :block, :rand_block, :current_shape

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

     @block = Block.new
     @current_shape = nil #detect_shape
     @temp_shape_name = nil
     @current_coord = nil
     @stop = false
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
    @current_shape = @block.get_shape_name
    coords = @block.shape_coords_hash(@current_shape)
    if coordinates_available?(coords)
      @current_coord = coords
      update_board_with_shape(coords)
      # Only required for rotation - not needed for normal movement
      @temp_shape_name = @current_shape
    else
      @stop = true
    end
  end

  def no_space_for_block?
    @stop
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

  def is_row_full?(row)
    row.all? {|cell| cell == 'X' }
  end

  def clear_row_if_full
    empty_row = [nil,nil,nil,nil,nil,nil,nil,nil,nil,nil]
    @board_arr.each_with_index do |row, idx|
      if is_row_full?(row)
        puts "Row is full"
        @board_arr.delete_at(idx)
        @board_arr.unshift(empty_row)
        true
      else
        false
      end
    end
  end


  def clear_old_coords(coords)
    coords.each {|coord| @board_arr[coord[0]][coord[1]] = nil}
  end

  def process_movement(temp)
    if coordinates_valid?(temp) && can_move?(temp)
      clear_old_coords(@current_coord)
      update_board_with_shape(temp)
      @current_coord = temp
      @current_shape = @temp_shape_name
      # @temp_shape_name = nil
    end
  end



  def can_move?(temp) #checks only not overlapped coords if nil
    temp_arr = temp.dup
    @current_coord.each {|coord| temp_arr.delete(coord) if temp_arr.include?(coord) }
    temp_arr.all?{|temp_coord| @board_arr[temp_coord[0]][temp_coord[1]].nil?}
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
      process_movement(temp)
    elsif (mov == "e" || mov == "r") # rotate left or rotate right
      new_shape_coords = rotate_block(mov)
      process_movement(new_shape_coords)
    end
  end

  def rotate_block(mov)
    new_shape_coords = []
    if mov == "e"
      @temp_shape_name = block_rotator_anticlock
    elsif mov == "r"
      @temp_shape_name = block_rotator_clock
    end

    puts "#{@temp_shape_name} temp_shape_name in rotate_block"
    origin_shape_coord = @block.shape_coords_hash(@temp_shape_name)
    puts "#{origin_shape_coord} origin_shape_coord in rotate block"
    vector_coords = find_vector_move(origin_shape_coord)
    origin_shape_coord.each { |coord|
        new_shape_coords << [coord[0] + vector_coords[0], coord[1] + vector_coords[1]] }
    new_shape_coords
  end

  def find_vector_move(origin_coord)
    puts "#{origin_coord} origin_coord in find_vector_move"
    puts "#{@current_coord} current_coord in find_vector_move"
    new_coords_x = @current_coord[0][0] - origin_coord[0][0]
    new_coords_y = @current_coord[0][1] - origin_coord[0][1]
    [new_coords_x, new_coords_y]
  end

  def block_rotator_clock
    case @current_shape
    when "t"
      "t_90"
    when "t_90"
      "t_180"
    when "t_180"
      "t_270"
    when "t_270"
      "t"
    when "square"
      "square"
    when "h_line"
      "v_line"
    when "v_line"
      "h_line"
    when "l"
      "l_90"
    when "l_90"
      "l_180"
    when "l_180"
      "l_270"
    when "l_270"
      "l"
    end
  end

  def block_rotator_anticlock
    case @current_shape
    when "t"
      "t_270"
    when "t_270"
      "t_180"
    when "t_180"
      "t_90"
    when "t_90"
      "t"
    when "square"
      "square"
    when "h_line"
      "v_line"
    when "v_line"
      "h_line"
    when "l"
      "l_270"
    when "l_270"
      "l_180"
    when "l_180"
      "l_90"
    when "l_90"
      "l"
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

  def check_if_space_under?
    temp = []
    @current_coord.each { |coord| temp << [coord[0] + 1, coord[1]] }
    coordinates_valid?(temp) ? can_move?(temp) : false
  end
end
