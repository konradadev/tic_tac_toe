class Game
  def initialize(player1, player2)
    @player1 = ' ' << player1 << ' '
    @player2 = ' ' << player2 << ' '
    @board = {}
    clear_board()
  end

  def clear_board
    @board = {
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

  def player_move(row, column, player)
    @board[row.to_sym][column - 1] = player
  end
end

board1 = Game.new('X', 'O')
board1.clear_board
board1.display_board