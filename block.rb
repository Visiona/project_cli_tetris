class Block
  attr_accessor :shapes

  def initialize
    @current_coord = nil

    @t = [["X", "X", "X"]
          [nil, "X", nil]]

   @t_180 = [[nil, "X", nil],
            ["X", "X", "X"]]

    @t_90 = [["X", nil, nil],
            ["X", "X", nil],
            ["X", nil, nil]]

    @t_270 = [[nil, nil, "X"],
              [nil, "X", "X"],
              [nil, nil, "X"]]

    @h_line = [["X", "X", "X"]]

    @v_line = [[nil, "X", nil],
              [nil, "X", nil],
              [nil, "X", nil]]

    @v_line_90 = [[nil, nil, nil],
                  ["X", "X", "X"],
                  [nil, nil, nil]]

    @l = [["X", nil, nil],
         ["X", "X", "X"]]

   @l_180 = [["X", "X", "X"],
              [nil, nil, "X"]]

    @l_90 = [["X", "X", nil],
            ["X", nil, nil],
            ["X", nil, nil]]

    @l_270 = [[nil, "X", nil],
              [nil, "X", nil],
              ["X", "X", nil]]

    @square = [["X", "X"],
             ["X", "X"]]
  end


  # def get_random_shape
  #   [@t, @h_line, @v_line, @l, @square].sample
  # end

  def get_shape_name
    ["t", "h_line", "v_line", "l", "square"].sample
  end

  def shape_coords_hash(shape)
   {"t" => [[0,5],[1,4],[1,5],[1,6]],
    "h_line" => [[0,4],[0,5],[0,6]],
    "v_line" => [[0,5],[1,5],[2,5]],
    "l" => [[0,4],[1,4],[1,5],[1,6]],
    "square" => [[0,4],[0,5],[1,4],[1,5]].
    "t_90" => }[shape]
  end

  # hash = {"l" => [1,2]}
  # hash["l"]
  # # => [1,2]

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
    end
  end

end


#TASKS TO DO
# Update the shapes coords in the hash
# block_rotates right and left
# updating current_shape after every rotation
# adding movements to ritated block (ie when the block was on 4th line to the left - as the hash holds coords from the top center of the board)
