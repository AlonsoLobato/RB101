# Alonso's mortgage calculator:
# a program that calculates the monthly cost of a mortgage

# ----- config file ----- #

require 'yaml'
MESSAGES = YAML.load_file('mortgage_msg.yml')

# ----- general methods ----- #

def clear_screen
  system('clear') || system('cls')
end

def general_prompt(msg)
  puts "--> #{msg}"
end

def detail_prompt(msg)
  puts "...... #{msg}"
end

# ----- input validation methods ----- #

def invalid_name?(str)
  str.to_i != 0 || str.empty?
end

def valid_amount?(num)
  num.to_i > 0 && num.to_i.to_s == num
end

def valid_percentage?(num)
  num.to_f > 0 && num.to_s == num
end

def valid_duration?(num)
  Integer(num, exception: false) && num.to_i >= 10 && num.to_i <= 40
end

# ----- abstraction methods ----- #

def get_user_name
  name = ''
  general_prompt(MESSAGES['name'])
  loop do
    name = gets.chomp
    if invalid_name?(name)
      puts(MESSAGES['invalid_name'])
    else
      break
    end
  end
  name
end

def get_requested_amount
  requested_amount = ''
  general_prompt(MESSAGES['amount'])
  loop do
    requested_amount = gets.chomp
    if valid_amount?(requested_amount)
      break
    else
      puts(MESSAGES['invalid_amount'])
    end
  end
  requested_amount.to_i
end

def get_interest_rate
  interest_rate = ''
  general_prompt(MESSAGES['interest'])
  loop do
    interest_rate = gets.chomp
    if valid_percentage?(interest_rate)
      break
    else
      puts MESSAGES['invalid_interest']
    end
  end
  (interest_rate.to_f / 100) / 12
end

def get_mortgage_duration
  mortgage_duration = ''
  general_prompt(MESSAGES['duration'])
  loop do
    mortgage_duration = gets.chomp
    if valid_duration?(mortgage_duration)
      break
    else
      puts MESSAGES['invalid_duration']
    end
  end
  mortgage_duration.to_i * 12
end

def calculate_monthly_payment(requested_amount, interest_rate,
                              mortgage_duration)
  (requested_amount * (interest_rate /
  (1 - (1 + interest_rate)**(-mortgage_duration)))).round(2)
end

def mortgage_breakdown(requested_amount, mortgage_duration, monthly_payment)
  general_prompt(MESSAGES['detail_nums'])

  detail_prompt("Total amount you will have paid in"\
                " #{mortgage_duration / 12} years would be"\
                " $#{(mortgage_duration * monthly_payment).round(2)}")

  detail_prompt("Total amount of interests you will"\
                " have paid at the end would be"\
                " $#{((mortgage_duration * monthly_payment)\
                       - requested_amount).round(2)}")
end

def get_play_again
  play_again = ''
  general_prompt(MESSAGES['start_again'])
  loop do
    play_again = gets.chomp.downcase
    if %w(yes y no n).include? play_again
      break
    else
      puts(MESSAGES['sorry'])
    end
  end
  play_again
end

# ------- welcome and main loop ------- #

puts(MESSAGES['welcome'])
sleep(1)
name = get_user_name
puts "Welcome #{name}!"
sleep(2)

loop do
  clear_screen
  puts(MESSAGES['instruction_1'])
  puts(MESSAGES['instruction_2'])
  sleep(1)

  requested_amount = get_requested_amount
  puts(MESSAGES['thanks_1'])
  interest_rate = get_interest_rate
  puts(MESSAGES['thanks_2'])
  mortgage_duration = get_mortgage_duration
  puts(MESSAGES['thanks_3'])

  monthly_payment = calculate_monthly_payment(requested_amount,
                                              interest_rate,
                                              mortgage_duration)
  general_prompt(MESSAGES['processing'])
  puts(MESSAGES['empty_line'])
  sleep(2)

  general_prompt("According to the entered details, a mortgage with us"\
                  " would cost you $#{monthly_payment} a month")
  sleep(1)

  mortgage_breakdown(requested_amount, mortgage_duration, monthly_payment)
  sleep(2)
  puts(MESSAGES['empty_line'])

  play_again = get_play_again
  break unless play_again == 'yes' || play_again == 'y'
end

general_prompt(MESSAGES['thanks'])
sleep(3)
clear_screen
