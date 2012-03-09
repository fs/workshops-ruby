# Rules:
# * Any live cell with fewer than two live neighbours dies, as if caused by under-population.
# * Any live cell with two or three live neighbours lives on to the next generation.
# * Any live cell with more than three live neighbours dies, as if by overcrowding.
# * Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

class CGL
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def next_step
    new_board = []
    board_height.times do |i|
      board_width.times do |j|
        new_board[i] ||= []
        new_board[i][j] = get_cell_value(i, j)
      end
    end
    @board = new_board
  end

  private

  def get_cell_value(i, j)
    if @board[i][j] > 0
      die?(i, j) ? 0 : 1
    else
      reborn?(i, j) ? 1 : 0
    end
  end

  def die?(i, j)
   count = find_neighbors(i, j)
   @board[i][j] == 1 && count < 2 || count > 3
  end

  def reborn?(i, j)
    @board[i][j] == 0 && find_neighbors(i, j) == 3
  end

  def find_neighbors(i, j)
    count = 0
    3.times do |k|
      3.times do |m|
        next if k == 1 && m == 1
        col = @board[i - 1 + k]
        if !col.nil?
          val = col[j - 1 + m]
          if !val.nil? && val > 0
            count += 1
          end
        end
      end
    end
    count
  end

  def board_width
    @board[0].size
  end

  def board_height
    @board.size
  end

end
