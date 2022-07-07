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
    puts "A #{@board[:a][0]}|#{@board[:a][1]}|#{@board[:a][2]}"
    puts '  -----------'
    puts "B #{@board[:b][0]}|#{@board[:b][1]}|#{@board[:b][2]}"
    puts '  -----------'
    puts "C #{@board[:c][0]}|#{@board[:c][1]}|#{@board[:c][2]}"
  end

  def player_move(row, column, player)
    @board[row.to_sym][column - 1] = player
  end

  def game_won?(player)
    game_won = false
    @board.each { |value| game_won = true if value.all?(player) }
    for i in 0..2 do
      column = []
      @board.each_key { |key| column.push(@board[key][i]) }
      game_won = true if column.all?(player)
    end
    @board.each_key do |key|
      diagonal = []
      for i in 0..2 do
        diagonal.push(@board[key][i])
      end
      game_won = true if diagonal.all?(player)
      alt_diagonal = []
      j = 2
      while j >= 0
        alt_diagonal.push(@board[key][j])
        j -= 1
      end
      game_won = true if alt_diagonal.all?(player)
    end
    display_win(player) if game_won == true
  end

  def display_win(player)
    display_board()
    puts "Player #{player} won"
  end
end

board1 = Game.new('X', 'O')
board1.clear_board
board1.display_board