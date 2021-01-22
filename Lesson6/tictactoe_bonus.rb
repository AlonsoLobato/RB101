# ------------------ constants
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
POINTS_TO_WIN = 3
SQUARES_IN_LINE = 3

# ------------------ helper methods
def prompt(msg)
  puts "=> #{msg}"
end

def welcome_msg
  system 'clear'
  prompt "Welcome to the classic Tic-Tac-Toe."
  prompt "The first to 3 rounds wins the game!"
  sleep(2)
end

def goodbye_msg
  prompt "Thanks for playing Tic Tac Toe. Goodbye!"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You are #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----|-----|-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----|-----|-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

# Bonus: Improved "join"
def joinor(arr, delimiter=', ', last_delimiter='or')
  if arr.size == 1
    arr.join('')
  elsif arr.size == 2
    arr.join(" #{last_delimiter} ")
  else
    arr[0...-1].join(delimiter) + delimiter + "#{last_delimiter} #{arr.last}"
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square: (#{joinor(empty_squares(brd))})"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice"
  end
  brd[square] = PLAYER_MARKER
end

# Bonus: Computer AI
def find_at_risk_squares(brd)
  at_risk = []
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == SQUARES_IN_LINE - 1
      line.each do |square|
        if brd[square] == INITIAL_MARKER
          at_risk << square
        end
      end
    end
  end
  at_risk
end

def at_risk_squares?(brd)
  find_at_risk_squares(brd).count != 0
end

def find_winning_squares(brd)
  winning_square = []
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(COMPUTER_MARKER) == SQUARES_IN_LINE - 1
      line.each do |square|
        if brd[square] == INITIAL_MARKER
          winning_square << square
        end
      end
    end
  end
  winning_square
end

def winning_square?(brd)
  find_winning_squares(brd).count != 0
end

def middle_square_empty?(brd)
  brd[5] == INITIAL_MARKER
end

def computer_places_piece!(brd)
  if winning_square?(brd)
    brd[find_winning_squares(brd).sample] = COMPUTER_MARKER
  elsif at_risk_squares?(brd)
    brd[find_at_risk_squares(brd).sample] = COMPUTER_MARKER
  elsif middle_square_empty?(brd)
    brd[5] = COMPUTER_MARKER
  else
    brd[empty_squares(brd).sample] = COMPUTER_MARKER
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def display_round_winner(brd, scr)
  if someone_won?(brd)
    update_scoring(detect_round_winner(brd), scr)
    prompt "#{detect_round_winner(brd)} won this round!"
  else
    prompt "It's a tie"
  end
  sleep(1)
end

def detect_round_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == SQUARES_IN_LINE
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == SQUARES_IN_LINE
      return 'Computer'
    end
  end
  nil
end

def someone_won?(brd)
  !!detect_round_winner(brd)
end

# Bonus: keep scoring and play to best of 5 rounds
def initialize_scoring
  { player_scoring: 0, computer_scoring: 0 }
end

def display_scoring(scoring)
  puts "Your scoring is: #{scoring[:player_scoring]} | " \
       "Computer scoring is: #{scoring[:computer_scoring]}"
  puts " "
end

def update_scoring(detect_round_winner, scoring)
  if detect_round_winner == 'Player'
    scoring[:player_scoring] += 1
  elsif detect_round_winner == 'Computer'
    scoring[:computer_scoring] += 1
  end
end

def won_match?(scoring)
  scoring == POINTS_TO_WIN
end

def final_winner?(scoring)
  won_match?(scoring[:player_scoring]) ||
    won_match?(scoring[:computer_scoring])
end

def display_final_winner(scoring)
  if won_match?(scoring[:player_scoring])
    prompt "You have won 3 rounds, so you are the final winner." \
           " Congratulations!"
  elsif won_match?(scoring[:computer_scoring])
    prompt "Computer has won 3 rounds, so it is the final winner." \
           " Good luck next time!"
  end
end

# Bonus: choose who plays first
def who_plays_first
  valid_answers = [1, 2, 3]
  answer = nil
  system 'clear'
  prompt "Please choose who plays first:"

  loop do
    prompt "Type 1 for player, 2 for computer or 3 for eiter (randomly chosen)."
    answer = gets.chomp.to_i
    break if valid_answers.include?(answer)
    prompt "Sorry, that's not a valid option"
  end

  return [1, 2].sample if answer == 3
  answer
end

# Bonus: Improve game loop
def detect_current_player(who_plays_first)
  if who_plays_first == 1
    'Player'
  else
    'Computer'
  end
end

def place_piece!(brd, detect_current_player)
  if detect_current_player == 'Player'
    player_places_piece!(brd)
  elsif detect_current_player == 'Computer'
    computer_places_piece!(brd)
  end
end

def alternate_player(detect_current_player)
  detect_current_player == 'Player' ? 'Computer' : 'Player'
end

def ask_play_again
  answer = nil
  valid_answers = ['y', 'n', 'yes', 'no']
  loop do
    prompt "Do you want to play again? (y/n)"
    answer = gets.chomp.downcase
    break if valid_answers.include?(answer)
    prompt "Sorry, I didn't catch that..."
  end
  answer
end

# ------------------ main program
welcome_msg
loop do
  first_to_play = who_plays_first
  scoring = initialize_scoring

  loop do
    board = initialize_board
    current_player = detect_current_player(first_to_play)

    loop do
      display_board(board)
      display_scoring(scoring)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)
    display_round_winner(board, scoring)
    break unless !final_winner?(scoring)
  end

  display_final_winner(scoring)

  break unless ask_play_again.start_with?('y')
end

goodbye_msg
