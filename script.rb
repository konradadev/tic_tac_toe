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
    @board[row.to_sym][column] = player
  end

  def check_win_horizontal(player)
    @board.each_key { |key| @game_won = true if @board[key].all?(player) }
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

  def move_row_cop
    possible_rows = %w[a b c]
    puts 'Choose from row A to C'
    move_row = gets.downcase.chomp
    while possible_rows.any?(move_row) == false
      display_board()
      puts 'Wrong input! Please choose one of the following: A, B or C'
      move_row = gets.downcase.chomp
    end
    move_row
  end

  def move_column_cop
    possible_columns = [1, 2, 3]
    puts 'Choose from column 1 to 3'
    move_column = gets.to_i
    while  possible_columns.any?(move_column) == false
      display_board()
      puts 'Wrong input! Please choose one of the following: 1, 2 or 3'
      move_column = gets.to_i
    end
    move_column -= 1
    move_column
  end

  def move_possible?(row, column)
    @board[row.to_sym][column] == '   '
  end

  def gameplay_loop
    i = 0
    while @game_won == false && i < 9
      move_possible = false
      current_player = i.even? ? @player1 : @player2
      while move_possible == false
        puts "Now moving: #{current_player}"
        move_row = move_row_cop()
        move_column = move_column_cop()
        if move_possible?(move_row, move_column)
          move_possible = true
        else
          puts 'Move not possible, try again'
          display_board()
        end
      end
      player_move(move_row, move_column, current_player)
      check_win_conditions(current_player)
      @game_won == true ? display_win(current_player) : display_board()
      i += 1
    end
    puts "It's a Tie!" if @game_won == false
  end
end

replay = true

def ask_players
  puts 'Do you want to play again?'
  puts '1. Yes'
  puts '2. No'
end

def play_again?
  ask_players()
  answer = gets.to_i
  while [1, 2].any?(answer) == false
    puts 'Wrong input!'
    ask_players()
    answer = gets.to_i
  end
  answer == 1
end

while replay
  board = Game.new('X', 'O')
  board.display_board
  board.gameplay_loop
  replay = play_again?()
end

puts 'Thanks for playing!'
