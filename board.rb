require_relative 'block.rb'
require 'pry'


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

     @block = Block.new
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
    rand_block = @block.get_random_shape
    coords = @block.shape_coords(rand_block)
    if coordinates_available?(coords) #updating this method
      @current_coord = coords
      update_board_with_shape(coords)
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

  def is_row_full?(coord)
    @board_arr[coord[0]].all?{|cell| cell == 'X' }
  end

  def clear_row_if_full
    empty_row = [nil,nil,nil,nil,nil,nil,nil,nil,nil,nil]
    if is_row_full?([9,nil])
      puts "Row is full"
      @board_arr.pop
      @board_arr.unshift(empty_row)
      true
    else
      false
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
    puts "DBG: @current_coord in check under = #{@current_coord.inspect}"
    @current_coord.each { |coord| temp << [coord[0] + 1, coord[1]] }
    # we only need to check spaces that are not already in current coordinates
    coordinates_valid?(temp) ? can_move?(temp) : false
  end
end
