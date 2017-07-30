class Block
  attr_accessor :shapes

  def initialize
    @current_coord = nil

    @t = [[nil, "X", nil],
         ["X", "X", "X"]]

    # add t at 90 and 180 , 270 degrees

    @h_line = [["X", "X", "X"]]

    @v_line = [[nil, "X", nil],
              [nil, "X", nil],
              [nil, "X", nil]]
    # add vline at 90 degrees

    @l = [["X", nil, nil],
         ["X", "X", "X"]]

  # add l at 90 and 180, 270 degrees
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
        [[0,4],[1,4],[1,5],[1,6]]
      when @square
        [[0,4],[0,5],[1,4],[1,5]]

        # update rotations
    end
  end

end
