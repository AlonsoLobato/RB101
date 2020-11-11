# Alonso's mortgage calculator
# a program to calculate the monthly cost of your mortgage
# Note: See the code below and the PEDAC process at the bottom

# ================== Config file for program messages ================== #

require 'yaml'
MESSAGES = YAML.load_file('mortgage_msg.yml')

# ================== Input validation methods ================== #

def clear_screen
  system('clear') || system('cls')
end

def general_prompt(msg)
  puts "--> #{msg}"
end

def detail_prompt(msg)
  puts "... #{msg}"
end

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

# ================== Welcome and instructions ================== #

puts(MESSAGES['welcome'])
sleep(1)

name = nil
general_prompt(MESSAGES['name'])
loop do
  name = gets.chomp
  if invalid_name?(name)
    puts(MESSAGES['invalid_name'])
  else
    break
  end
end

puts "Hello #{name}"
sleep(1)
puts(MESSAGES['instruction_1'])
puts(MESSAGES['instruction_2'])
sleep(2)

# ================== Request user input ================== #

loop do # main loop --> repeats all from here if user wants to calculate again
  clear_screen
  total_amount = nil
  general_prompt(MESSAGES['amount'])
  loop do
    total_amount = gets.chomp
    if valid_amount?(total_amount)
      total_amount = total_amount.to_f
      break
    else
      puts(MESSAGES['invalid_amount'])
    end
  end
  puts(MESSAGES['thanks_1'])

  anual_percentage_rate = nil
  general_prompt(MESSAGES['interest'])
  loop do
    anual_percentage_rate = gets.chomp
    if valid_percentage?(anual_percentage_rate)
      anual_percentage_rate = anual_percentage_rate.to_f / 100
      break
    else
      puts MESSAGES['invalid_interest']
    end
  end
  puts(MESSAGES['thanks_2'])

  mortgage_duration = nil
  general_prompt(MESSAGES['duration'])
  loop do
    mortgage_duration = gets.chomp
    if valid_duration?(mortgage_duration)
      mortgage_duration = mortgage_duration.to_f
      break
    else
      puts MESSAGES['invalid_duration']
    end
  end
  puts(MESSAGES['thanks_3'])

  # ================== Processing input into output ================== #

  monthly_percentage_rate = anual_percentage_rate / 12
  mortgage_duration_in_months = mortgage_duration * 12

  monthly_payment = (total_amount *
                    (monthly_percentage_rate /
                    (1 - (1 + monthly_percentage_rate)**(-mortgage_duration_in_months)))).round(2)
  total_to_pay = (mortgage_duration_in_months * monthly_payment).round(2)
  total_interest = (total_to_pay - total_amount).round(2)

  general_prompt(MESSAGES['processing'])
  sleep(2)

  general_prompt("According to the entered details, a mortgage with us"\
                  " would cost you $#{monthly_payment} a month")
  sleep(2)

  general_prompt(MESSAGES['detail_nums'])

  detail_prompt("The total amount you will have paid in"\
                " #{mortgage_duration.to_i} years would be"\
                " $#{total_to_pay}")

  detail_prompt("The total amount of interests you will"\
                " have paid at the end would be $#{total_interest}")
                
  general_prompt(MESSAGES['start_again'])
  answer = gets.chomp
  break unless answer.downcase == 'yes' || answer.downcase == 'y'
end

general_prompt(MESSAGES['thanks'])
sleep(2)
clear_screen

=begin
PEDAC process

1) Understanding the problem
- Prompt user for the following info:
  - Loan amount (amount user asks to lender)
  - Annual Percentage Rate (annual interest rate the user chooses)
  - Loan duration (number of years over which user will repay the mortgage)

- From that info, we calculate
  - Monthly interest rate (APR / 12 months)
  - Loan durations in months (years user asks mortgage to last * 12)
  - Monthly payment (monthly principal and interest user will pay)
    - We use the following formula:
      - m = p * (j / (1 - (1 + j)**(-n))) where:
        m = monthly payment (final result)
        p = loan amount
        j = monthly interest rate
        n = loan duration in months

2) Test cases
Input:
p = '150000'
j = '6.25'
n = '25'
Output: $989.50

Input:
p = '-150000' or '15000.25' or 'some money' or ' '
j = '- 6.25' or '0' or ' '
n = '5' or '2.5' or '50' or 'fifty'
Output: error: p must be a positive integers |
        j must be a positive integer or float |
        n must be a integer between 10 and 40

3) Data structure
Integers, floats, strings

4) Algorithm
- Methods to validate user input
  - Loan amount must be positive int
  - Interest rate must be positive float
  - Loan duration must be int >= 10 AND <= 40

- Request user input
  - Prompt for users name
    - check validity name exist and is string
  - Hello user and instructions
  - Mortgage amount requested
    - use designated method to check validity
    - transform result to float
  - Anual percentage rate
    - use designated method to check validity
    - transform result to float
  - Mortgage duration (in years)
      - use designated method to check validity
      - transform result to float

- Process input to output
  - Convert anual rate to monthly rate
    - anual rate / 12
  - Convert Loan duration in years
    - loan duration * 12
  - Calculate monthly payment with formula m = p * (j / (1 - (1 + j)**(-n)))
  - Calculate details: total amount interest and total amount to pay (loan + interest)
  - Output message and result of calculation
    - Breakdown result into chapters

  - Ask if user wants to repeat calculation
    - unless answer is yes
      - break out and display good bye msg
=end