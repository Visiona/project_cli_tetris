class Block
  attr_accessor :shapes

  def initialize
    @current_coord = nil
     # @shapes = {}
    @t = [[nil, "X", nil],
         ["X", "X", "X"]]

    @h_line = [["X", "X", "X"]]

    @v_line = [[nil, "X", nil],
              [nil, "X", nil],
              [nil, "X", nil]]
    @l = [["X", nil, nil],
         ["X", nil, nil],
         ["X", "X", "X"]]
    @square = [["X", "X"],
             ["X", "X"]]
  end

  # OUR SHAPES            X
#  X          X      XX   X
# XXX   XXX   XXX    XX   X

  def get_random_shape
    shapes = [@t, @h_line, @v_line, @l, @square]
    shapes.sample
  end

  def shape_coords(shape)
    case shape
      when @t
        [[0,5],[1,4],[1,5],[1,6]]
      when @h_line
        [[0,4],[0,5],[0,6]]
      when @v_line
        [[0,5],[1,5],[2,5]]
      when @l
        [[0,4],[1,4],[2,4],[2,5],[2,6]]
      when @square
        [[0,4],[0,5],[1,4],[1,5]]
    end
  end

    # return all coordinates of the shape we are given e.g.
    
    # a = 0,5; b =0,6; c = 1,5; d =2,5
    # if all?(coordinates_available?(a,b,c,d))
    #   then add block to board


  # def create_shapes
  #   add_shape(0, t)
  #   add_shape(1, h_line)
  #   add_shape(2, v_line)
  #   add_shape(3, l)
  #   add_shape(4, block)
  # end

  # def add_shapes(num, shape)
  #   @shapes[num] = shape
  # end

  # def get_shape(number)
  #   @shapes[number]
  # end



end
