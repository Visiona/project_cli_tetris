class Block
  attr_accessor :shapes

  def initialize
    @current_coord = nil

    @t = [[nil, "X", nil],
          ["X", "X", "X"]]

    @t_180 = [["X", "X", "X"],
             [nil, "X", nil]]

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

  def get_shape_name
    ["t", "h_line", "v_line", "l", "square"].sample
  end

  def shape_coords_hash(shape)
   {"t" =>      [[0,5],[1,4],[1,5],[1,6]],
    "h_line" => [[0,4],[0,5],[0,6]],
    "v_line" => [[0,5],[1,5],[2,5]],
    "l" =>      [[0,4],[1,4],[1,5],[1,6]],
    "square" => [[0,4],[0,5],[1,4],[1,5]],
    "t_90" =>   [[0,5],[1,5],[1,6],[2,5]],
    "t_180" => [[1,4],[1,5],[1,6],[2,5]],
    "t_270" => [[0,5],[1,5],[2,5],[1,4]],
    "l_90" =>   [[0,5],[0,6],[1,5],[2,5]],
    "l_180" => [[1,4],[1,5],[1,6],[2,6]],
    "l_270" => [[0,5],[1,5],[2,5],[2,4]] }[shape]
  end

end


#TASKS TO DO
# Update the shapes coords in the hash
# block_rotates right and left
# updating current_shape after every rotation
# adding movements to ritated block (ie when the block was on 4th line to the left - as the hash holds coords from the top center of the board)
