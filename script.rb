class Game
  @@board = {}

  def clear_board
    @@board = {
      a: ['   ', '   ', '   '],
      b: ['   ', '   ', '   '],
      c: ['   ', '   ', '   ']
    }
  end

  def display_board
    puts '   1   2   3'
    puts "A #{@@board[:a][0]}|#{@@board[:a][1]}|#{@@board[:a][2]}"
    puts '  -----------'
    puts "B #{@@board[:b][0]}|#{@@board[:b][1]}|#{@@board[:b][2]}"
    puts '  -----------'
    puts "C #{@@board[:c][0]}|#{@@board[:c][1]}|#{@@board[:c][2]}"
  end
end

board1 = Game.new
board1.display_board