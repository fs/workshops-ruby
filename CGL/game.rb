require 'CGL'
require 'board'

system("clear")

data = []
File.open('input_3.txt') do |f|
   while line = f.gets
     data << line.split.map(&:to_i)
   end
end

game = CGL.new(data)
board_viewer = Board.new
board_viewer.board = data
board_viewer.show
loop do
  puts "Prees 'q' to terminate programm"
  break if gets.chomp == 'q'

  system("clear")
  board_viewer.board = game.next_step
  board_viewer.show
end
puts 'Game finished'
