# 21 card game
# Launch School practice exercise
# Jan 2021

#--------------Constants
DECK_OF_CARDS = [[*('2'..'10'), 'J', 'Q', 'K', 'A'], ['♣', '♦', '♥', '♠']]

OPTIMAL_POINTS = 21
DEALER_MAX_RISK = 17
ROUNDS_TO_WIN = 5

#--------------helper methods
def prompt(msg)
  puts "=> #{msg}"
end

def blank_space
  puts ""
end

def clear_screen
  system 'clear'
end

def join(hand)
  hand[0...-1].join(', ') + ' and ' + hand.last
end

def press_return_to_continue?
  blank_space
  blank_space
  puts "                                         /press return to continue/"
  true if gets.chomp == ' '
end

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength, Layout/LineLength
def display_welcome_banner
  clear_screen
  blank_space
  puts "    WW      WW EEEEEEE LL       CCCCC   OOOOO  MM    MM EEEEEEE    TTTTTTT  OOOOO"
  puts "    WW      WW EE      LL      CC    C OO   OO MMM  MMM EE           TTT   OO   OO"
  puts "    WW   W  WW EEEEE   LL      CC      OO   OO MM MM MM EEEEE        TTT   OO   OO"
  puts "     WW WWW WW EE      LL      CC    C OO   OO MM    MM EE           TTT   OO   OO"
  puts "      WW   WW  EEEEEEE LLLLLLL  CCCCC   OOOO0  MM    MM EEEEEEE      TTT    OOOO0"
  blank_space
  puts "    TTTTTTT WW      WW EEEEEEE NN   NN TTTTTTT YY   YY         OOOOO  NN   NN EEEEEEE"
  puts "      TTT   WW      WW EE      NNN  NN   TTT   YY   YY        OO   OO NNN  NN EE"
  puts "      TTT   WW   W  WW EEEEE   NN N NN   TTT    YYYYY         OO   OO NN N NN EEEEE"
  puts "      TTT    WW WWW WW EE      NN  NNN   TTT     YYY          OO   OO NN  NNN EE"
  puts "      TTT     WW   WW  EEEEEEE NN   NN   TTT     YYY           OOOO0  NN   NN EEEEEEE"
  blank_space
  puts "     CCCCC    AAA   RRRRRR  DDDDD        GGGG    AAA   MM    MM EEEEEEE"
  puts "    CC       AAAAA  RR   RR DD  DD      GG  GG  AAAAA  MMM  MMM EE"
  puts "    CC      AA   AA RRRRRR  DD   DD    GG      AA   AA MM MM MM EEEEE"
  puts "    CC      AAAAAAA RR  RR  DD   DD    GG   GG AAAAAAA MM    MM EE"
  puts "     CCCCC  AA   AA RR   RR DDDDDD      GGGGGG AA   AA MM    MM EEEEEEE"
  blank_space
  sleep(4)
  clear_screen
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength, Layout/LineLength

def want_instructions?
  answer = nil
  valid_answers = ['yes', 'y', 'no', 'n']
  clear_screen
  loop do
    prompt "Do you want to read the instructions before you play (y/n)?"
    answer = gets.chomp.downcase
    break if valid_answers.include?(answer)
    prompt "Sorry, I didn't catch that..."
  end
  answer.start_with?('y')
end

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength, Layout/LineLength, Layout/TrailingWhitespace
def display_instructions
  clear_screen
  puts "GAME RULES"
  puts "──────────"
  prompt "We'll play with a normal 52-card deck"
  blank_space
  prompt "The goal is to try to get as close to #{OPTIMAL_POINTS} points as possible, without going over"
  blank_space
  prompt "If you go over #{OPTIMAL_POINTS}, it's a 'bust' and you lose the game"
  press_return_to_continue?
  clear_screen

  puts "GAME RULES (continue...)"
  puts "────────────────────────"
  prompt "There are two players that are initially dealt 2 cards"
  blank_space
  prompt "You can see your two cards, but only one of your opponent's cards"
  press_return_to_continue?
  clear_screen

  puts "GAME RULES (continue...)"
  puts "────────────────────────"
  prompt "The card values are:"
  blank_space
  puts " --> The numbers '2' through '10' are worth their face value"
  blank_space
  puts " --> 'J', 'Q' and 'K' are worth 10 points each"
  blank_space
  puts " --> 'A' can be worth 1 or 11, depending on the sum of the other cards"
  puts "     (if that sum is > 21, 'A' will be worth 1; otherwise it'll be worth 11)"
  press_return_to_continue?
  clear_screen
  
  puts "GAME RULES (continue...)"
  puts "────────────────────────"
  prompt "Once you've seen your cards, you can ask for as many additional cards as you want by typing 'Hit'"
  blank_space
  prompt "Remember you want to get as close to #{OPTIMAL_POINTS} points as possible but without busting!"
  blank_space
  prompt "Once you are happy with the cards you have in hand, enter 'Stay'"
  blank_space
  prompt "Then is the computer's turn, who will play its hand as best as its AI allows it"
  press_return_to_continue?
  clear_screen

  puts "GAME RULES (continue...)"
  puts "────────────────────────"
  prompt "After both you and the computer have played, the cards are compared"
  blank_space
  prompt "Whoever got closest to #{OPTIMAL_POINTS} without busting wins the game"
  press_return_to_continue?
  clear_screen

  puts "GAME RULES (continue...)"
  puts "────────────────────────"
  prompt "Don't worry if you didn't get it all; we know this may be a bit overwhelming"
  blank_space
  prompt "It's easier if you play a few rounds"
  blank_space
  prompt "Ready? Let's play some rounds!"
  blank_space
  prompt "The first to win #{ROUNDS_TO_WIN} rounds wins the game"
  press_return_to_continue?
  clear_screen
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength, Layout/LineLength, Layout/TrailingWhitespace

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def display_player_cards(hand)
  fcs = hand[0][-1]           # fcs stands for 1st card suit
  scs = hand[1][-1]           # scs stands for 2n card suit
  fcv = hand[0].center(8)     # fcv stands for 1st card value
  scv = hand[1].center(8)     # scv stands for 2nd card value

  clear_screen
  puts "These are the cards in your initial hand:"
  puts "┌────────────┐ ┌────────────┐"
  puts "│ #{fcs}        #{fcs} │ │ #{scs}        #{scs} │"
  puts "│ ┌────────┐ │ │ ┌────────┐ │"
  puts "│ │        │ │ │ │        │ │"
  puts "│ │        │ │ │ │        │ │"
  puts "│ │#{fcv}│ │ │ │#{scv}│ │"
  puts "│ │        │ │ │ │        │ │"
  puts "│ │        │ │ │ │        │ │"
  puts "│ └────────┘ │ │ └────────┘ │"
  puts "│ #{fcs}        #{fcs} │ │ #{scs}        #{scs} │"
  puts "└────────────┘ └────────────┘"
  puts "    (#{value_with_aces_correction(hand)} points in total)"
  blank_space
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

def display_dealer_card(hand)
  cs = hand[0][-1]           # fcs stands for card suit
  cv = hand[0].center(8)     # fcv stands for card value

  puts "And this is the one card you can see of dealer's initial hand:"
  puts "┌────────────┐ ┌────────────┐"
  puts "│ #{cs}        #{cs} │ │            │"
  puts "│ ┌────────┐ │ │   ╔═══╗    │"
  puts "│ │        │ │ │   ║╔═╗║    │"
  puts "│ │        │ │ │   ╚╝╔╝║    │"
  puts "│ │#{cv}│ │ │     ║╔╝    │"
  puts "│ │        │ │ │     ╔╗     │"
  puts "│ │        │ │ │     ╚╝     │"
  puts "│ └────────┘ │ │            │"
  puts "│ #{cs}        #{cs} │ │            │"
  puts "└────────────┘ └────────────┘"
  blank_space
end

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def display_extra_card(hand)
  cs = hand[-1][-1]           # fcs stands for card suit
  cv = hand[-1].center(8)     # fcv stands for card value

  clear_screen
  puts "This is your new card:"
  puts "┌────────────┐"
  puts "│ #{cs}        #{cs} │ "
  puts "│ ┌────────┐ │"
  puts "│ │        │ │"
  puts "│ │        │ │"
  puts "│ │#{cv}│ │ "
  puts "│ │        │ │"
  puts "│ │        │ │"
  puts "│ └────────┘ │"
  puts "│ #{cs}        #{cs} │ "
  puts "└────────────┘"
  blank_space
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

def initialize_deck
  deck = []
  DECK_OF_CARDS[0].each do |value|
    DECK_OF_CARDS[1].each do |suit|
      deck << value + suit
    end
  end
  deck
end

def deal_cards!(deck, cards = 1)
  hand = []
  cards.times do |_|
    hand << deck.sample
    deck.delete_if { |card| hand.include?(card) }
  end
  hand
end

def display_current_hand(hand)
  puts "** Your current cards are: #{join(hand)}, " \
       "which sum up #{value_with_aces_correction(hand)} points**"
end

def want_another_card?
  answer = nil
  valid_answers = ['hit', 'stay', 'h', 's']
  loop do
    prompt "Please enter 'Hit' if you want another card or 'Stay' if you don't"
    answer = gets.chomp.downcase
    break if valid_answers.include?(answer)
    prompt "Sorry, that's not a valid answer"
  end

  answer.start_with?('h')
end

def calculate_value_of_hand(hand)
  card_values = hand.map { |card| card[0] }
  sum_of_values = 0
  card_values.each do |value|
    sum_of_values += if value == 'A'
                       11
                     elsif ['1', 'J', 'Q', 'K'].include?(value)
                       10
                     else
                       value.to_i
                     end
  end

  sum_of_values
end

def value_with_aces_correction(hand)
  corrected_sum = calculate_value_of_hand(hand)
  hand.select { |card| card[0] == "A" }.count.times do
    corrected_sum -= 10 if corrected_sum > OPTIMAL_POINTS
  end
  corrected_sum
end

def busted?(hand)
  value_with_aces_correction(hand) > OPTIMAL_POINTS
end

def display_player_busted_msg(hand)
  if busted?(hand)
    blank_space
    puts "───────────────────────"
    puts "Sorry, you've busted!"
    puts "DEALER WINS THIS ROUND!"
    puts "───────────────────────"
  end
end

def display_dealer_busted_msg(hand)
  if busted?(hand)
    clear_screen
    puts "───────────────────"
    puts "Dealer busted!"
    puts "YOU WIN THIS ROUND!"
    puts "───────────────────"
  end
end

def dealer_stop_hit?(hand)
  value_with_aces_correction(hand) >= DEALER_MAX_RISK
end

def player_turn!(hand, deck)
  loop do
    break if busted?(hand) || !want_another_card?
    hand << deal_cards!(deck)[0]
    display_extra_card(hand)
    display_current_hand(hand)
  end
end

def dealer_turn!(hand, deck)
  loop do
    break if busted?(hand) || dealer_stop_hit?(hand)
    hand << deal_cards!(deck)[0]
  end
end

def detect_round_winner(player_hand, dealer_hand)
  player_points = value_with_aces_correction(player_hand)
  dealer_points = value_with_aces_correction(dealer_hand)

  if !busted?(player_hand) && !busted?(dealer_hand)
    if player_points > dealer_points
      'player'
    elsif dealer_points > player_points
      'dealer'
    else
      'tie'
    end
  end
end

def display_round_winner(player_hand, dealer_hand)
  if detect_round_winner(player_hand, dealer_hand) == 'player'
    clear_screen
    puts "YOU WIN THIS ROUND!"
    puts "───────────────────"
  elsif detect_round_winner(player_hand, dealer_hand) == 'dealer'
    clear_screen
    puts "DEALER WINS THIS ROUND!"
    puts "───────────────────────"
  elsif detect_round_winner(player_hand, dealer_hand) == 'tie'
    clear_screen
    puts "IT'S A TIE!"
    puts "───────────"
  end
end

def display_round_summary(player_hand, dealer_hand, score)
  blank_space
  puts " ** Your hand in this round was" \
       " #{join(player_hand)} (#{value_with_aces_correction(player_hand)} points)"
  blank_space
  puts " ** Dealer hand in this round was" \
       " #{join(dealer_hand)} (#{value_with_aces_correction(dealer_hand)} points)"
  blank_space
  puts "┌─────────────────────────────────────────┐"
  puts "│ Your score is #{score[:player_score]}  " \
       "│  Dealer's score is #{score[:dealer_score]} │"
  puts "└─────────────────────────────────────────┘"
  press_return_to_continue?
end

def initialize_scores
  { player_score: 0, dealer_score: 0 }
end

def update_scores!(player_hand, dealer_hand, score)
  winner = detect_round_winner(player_hand, dealer_hand)
  if winner == 'player' || busted?(dealer_hand)
    score[:player_score] += 1
  elsif winner == 'dealer' || busted?(player_hand)
    score[:dealer_score] += 1
  end
  score
end

def display_full_round_endings(player_hand, dealer_hand, score)
  update_scores!(player_hand, dealer_hand, score)
  display_round_winner(player_hand, dealer_hand)
  display_round_summary(player_hand, dealer_hand, score)
end

def match_winner?(score)
  score == ROUNDS_TO_WIN
end

def final_winner?(score)
  match_winner?(score[:player_score]) ||
    match_winner?(score[:dealer_score])
end

def display_final_winner(score)
  if match_winner?(score[:player_score])
    clear_screen
    prompt "YOU HAVE WON #{ROUNDS_TO_WIN} ROUNDS, " \
           "SO YOU ARE THE FINAL WINNER. "\
           "CONGRATULATIONS!"
    blank_space
  elsif match_winner?(score[:dealer_score])
    clear_screen
    prompt "DEALER HAS WON #{ROUNDS_TO_WIN} ROUNDS, " \
           "SO DEALER IS THE FINAL WINNER. "\
           "GOOD LUCK NEXT TIME!"
    blank_space
  end
end

def play_again?
  answer = nil
  valid_answers = ['y', 'n', 'yes', 'no']
  loop do
    prompt "Do you want to play again? (y/n)"
    answer = gets.chomp.downcase
    break if valid_answers.include?(answer)
    prompt "Sorry, I didn't catch that..."
  end
  answer.start_with?('y')
end

def display_goodbye_msg
  prompt "Thanks for playing Twenty-one. Goodbye!"
  sleep(3)
  clear_screen
end

#--------------main program
display_welcome_banner

loop do
  display_instructions if want_instructions?
  score = initialize_scores

  loop do
    new_deck = initialize_deck

    player_hand = deal_cards!(new_deck, 2)
    dealer_hand = deal_cards!(new_deck, 2)

    display_player_cards(player_hand)
    display_dealer_card(dealer_hand)

    player_turn!(player_hand, new_deck)

    if busted?(player_hand)
      display_player_busted_msg(player_hand)
    else
      dealer_turn!(dealer_hand, new_deck)
    end

    if busted?(dealer_hand)
      display_dealer_busted_msg(dealer_hand)
    end

    display_full_round_endings(player_hand, dealer_hand, score)

    break if final_winner?(score)
  end

  display_final_winner(score)

  break unless play_again?
end

display_goodbye_msg
