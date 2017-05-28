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
    @block = [["X", "X"],
             ["X", "X"]]
  end

  # OUR SHAPES              X
#  X          X      XX   X
# XXX   XXX   XXX    XX   X

  def get_random_shape
    shapes = [@t, @h_line, @v_line, @l, @block]
    shapes.sample
  end

  def shape_coords
    
  end


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
