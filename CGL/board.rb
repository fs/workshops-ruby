class Board
  attr_accessor :board

  def show
    @board.each do |col|
      p col.join(' ').gsub('0', ' ')
    end
  end
end
