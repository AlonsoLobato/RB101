# Rock Paper Scissors Lizard Spock game

VALID_CHOICES = %w(rock paper scissors lizard Spock)

POINTS_TO_WIN = 5

BEATS = {
  rock: ['scissors', 'lizard'],
  paper: ['rock', 'Spock'],
  scissors: ['paper', 'lizard'],
  Spock: ['scissors', 'rock'],
  lizard: ['Spock', 'paper']
}

def clear_screen
  system('clear') || system('cls')
end

def prompt(msg)
  puts("=> #{msg}")
end

def paused_prompt(msg)
  puts("#{msg}")
  sleep(1)
end

def welcome_msg
  puts " "
  puts "***************************************************"
  puts "*                                                 *"
  puts "*    THE ROCK PAPER SCISSORS LIZARD SPOCK GAME    *"
  puts "*     The first to get 5 points wins the game     *"
  puts "*                                                 *"
  puts "***************************************************"
  puts " "
  sleep(2)
end

def display_rules_song
  paused_prompt("Scissors cut paper")
  paused_prompt("Paper covers rock")
  paused_prompt("Rock crushes lizard")
  paused_prompt("Lizard poisons Spock")
  paused_prompt("Spock smashes scissors")
  paused_prompt("Scissors decapitate lizard")
  paused_prompt("Lizard eats paper")
  paused_prompt("Paper disproves Spock")
  paused_prompt("Spock vaporises rock")
  paused_prompt("and as it always has...")
  paused_prompt("Rock crushes scissors")
end

def instructions_msg
  puts "YOU MUST REMEMBER THAT:"
  paused_prompt("-----------------------")
  display_rules_song
  puts " "
  paused_prompt("Got it?")
  paused_prompt("Let's play!")
  puts " "
end

def available_weapons_msg
  prompt("Choose your weapon: #{VALID_CHOICES.join(', ')}.")
  puts <<-MSG

  type 'r' for Rock
  type 'p' for Paper
  type 's' for scissors
  type 'l' for Lizard
  type 'sp' for Spock

  MSG
  print "=> Type your option here: "
end

def initials_to_weapons(initials)
  player_weapon = case initials
                  when 'r' then 'rock'
                  when 'p' then 'paper'
                  when 's' then 'scissors'
                  when 'l' then 'lizard'
                  when 'sp' then 'Spock'
                  end
  player_weapon
end

def player_weapon_choice
  player_weapon = ''
  available_weapons_msg
  loop do
    initials_player_weapon = gets.chomp.downcase
    player_weapon = initials_to_weapons(initials_player_weapon)
    if VALID_CHOICES.include?(player_weapon)
      break
    else
      prompt("Sorry, I didn't get that")
      available_weapons_msg
    end
  end
  player_weapon
end

def winner(player1, player2)
  BEATS[player1.to_sym].include?(player2)
end

def display_result(player_weapon, computer_weapon)
  if winner(player_weapon, computer_weapon)
    prompt("YOU WIN!")
  elsif winner(computer_weapon, player_weapon)
    prompt("COMPUTER WINS!")
  else
    prompt("IT'S A TIE!")
  end
end

def update_scores(player_weapon, computer_weapon, scores)
  if winner(player_weapon, computer_weapon)
    scores[:player_score] += 1
  elsif winner(computer_weapon, player_weapon)
    scores[:computer_score] += 1
  end
end

def display_scores(scores)
  puts " —————————————————————"
  puts "| Your score: #{scores[:player_score]}       |"
  puts "| Computer's score: #{scores[:computer_score]} |"
  puts " —————————————————————"
  puts " "
end

def both_choices(player_weapon, computer_weapon)
  paused_prompt("Ready")
  paused_prompt("steady")
  paused_prompt("go!")
  clear_screen
  prompt("You chose #{player_weapon.upcase}, computer chose #{computer_weapon.upcase}")
end

def won_match?(scores)
  scores == POINTS_TO_WIN
end

def grand_winner?(scores)
  won_match?(scores[:player_score]) ||
  won_match?(scores [:computer_score])
end

def display_grand_winner(scores)
  if won_match?(scores[:player_score])
    prompt("WELL DONE, YOU ARE THE WINNER!")
    prompt("You reached 5 points. Congrats!!!")
    puts " "
  elsif won_match?(scores [:computer_score])
    prompt("GAME OVER!")
    prompt("The computer has reached 5 points. Good luck next time :(")
    puts " "
  end
end

def get_play_again
  play_again = ''
  prompt("Do you want to play again?")
  loop do
    play_again = gets.chomp.downcase
    if %w(yes y no n).include?(play_again)
      break
    else
      prompt("Sorry, I didn't get that. Please type yes or no")
    end
  end
  play_again.downcase
end

# ====== MAIN LOOP ====== #
loop do
  clear_screen
  welcome_msg
  instructions_msg
  scores = { player_score: 0, computer_score: 0 }
  loop do
    player_weapon = player_weapon_choice
    computer_weapon = VALID_CHOICES.sample
    both_choices(player_weapon, computer_weapon)
    display_result(player_weapon, computer_weapon)
    update_scores(player_weapon, computer_weapon, scores)
    display_scores(scores)
    break if grand_winner?(scores)
  end
  display_grand_winner(scores)
  play_again = get_play_again
  break unless play_again.start_with?('y')
end

prompt("Thanks for playing. Goodbye!")
sleep(2)
clear_screen
