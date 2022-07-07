class Game
  def initialize(player1, player2)
    @player1 = ' ' << player1 << ' '
    @player2 = ' ' << player2 << ' '
    @game_won = false
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
    fixed_column = column - 1
    @board[row.to_sym][fixed_column] = player
  end

  def check_win_horizontal(player)
    @board.each { |value| @game_won = true if value.all?(player) }
  end

  def check_win_vertical(player)
    for i in 0..2 do
      column = []
      @board.each_key { |key| column.push(@board[key][i]) }
      @game_won = true if column.all?(player)
    end
  end

  def check_win_diagonal(player)
    diagonal = []
    i = 0
    @board.each_key do |key|
      diagonal.push(@board[key][i])
      i += 1
    end
    @game_won = true if diagonal.all?(player)
  end

  def check_win_diagonal_alt(player)
    diagonal_alt = []
    j = 2
    @board.each_key do |key|
      diagonal_alt.push(@board[key][j])
      j -= 1
    end
    @game_won = true if diagonal_alt.all?(player)
  end

  def check_win_conditions(player)
    check_win_horizontal(player)
    check_win_vertical(player)
    check_win_diagonal(player)
    check_win_diagonal_alt(player)
  end

  def display_win(player)
    display_board()
    puts "Player #{player} won"
  end

  def gameplay_loop
    i = 0
    while @game_won == false && i < 9
      current_player = i.even? ? @player1 : @player2
      puts "Now moving: #{current_player} iteration #{i}"
      puts 'Choose from row A to C'
      move_row = gets.chomp
      puts 'Choose from column 1 to 3'
      move_column = gets.to_i
      player_move(move_row, move_column, current_player)
      check_win_conditions(current_player)
      @game_won == true ? display_win(current_player) : display_board()
      i += 1
    end
  end
end

board1 = Game.new('X', 'O')
board1.clear_board
board1.display_board
board1.gameplay_loop