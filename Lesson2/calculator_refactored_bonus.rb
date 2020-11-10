# Adding new features to the calculator exercise
# See the code below and the PEDAC process for new features at the bottom

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')  # see calculator_messages.yml file for a list of key:value messages used in this program

def prompt(msg)             # this method defines the format of output messages
  puts "=> #{msg}"
end

def valid_integer?(num)     # returns true or false whether it's a valid int or not
  num.to_i.to_s == num
end

def valid_float?(num)       # returns true or false whether it's a valid float or not
  num.to_f.to_s == num
end  

def valid_number?(num)      # returns true or false whether it's a valid number (takes as argument the two previous methods)
  valid_integer?(num) || valid_float?(num)
end  

def operation_in_course(op) # this method outputs the operation in course and add a 1 sec pause before the result is shown
  operation = case op
    when '1' then prompt "Adding the two numbers"
    when '2' then prompt "Substracting the two numbers"
    when '3' then prompt "Multiplying the two numbers"
    when '4' then prompt "Dividing the two numbers"
  end
  sleep(1)
  prompt "There we go"
  operation  
end

prompt (MESSAGES['welcome'])
name = nil
loop do
  prompt (MESSAGES['name'])
  name = gets.chomp
  if name.empty? || name.to_i != 0
    prompt MESSAGES['incorrect_name']
  else
    break
  end
end

prompt "Hello #{name}"

loop do
  number1 = nil
  loop do
    prompt MESSAGES['number']
    number1 = gets.chomp
    if valid_number?(number1)
      break
    else
      prompt MESSAGES['incorrect_number']
    end
  end

  number2 = nil
  loop do
    prompt MESSAGES['second_number']
    number2 = gets.chomp
    if valid_number?(number2)
      break
    else
      prompt MESSAGES['incorrect_number']
    end
  end

  prompt MESSAGES['select_operation']
  prompt MESSAGES['add']
  prompt MESSAGES['substract']
  prompt MESSAGES['multiply']
  prompt MESSAGES['divide']

  operation = nil
  loop do
    operation = gets.chomp
    if %w(1 2 3 4).include?(operation)
      break
    else
      prompt MESSAGES['incorrect_operation']
    end
  end

  result = case operation
           when '1'
             number1.to_f + number2.to_f
           when '2'
             number1.to_f - number2.to_f
           when '3'
             number1.to_f * number2.to_f
           when '4'
             number1.to_f / number2.to_f
           end

  operation_in_course(operation)
  prompt "The result is: #{result}"

  prompt MESSAGES['again?']
  answer = gets.chomp
  break unless answer.downcase == 'y' || answer.downcase == 'yes'
end

prompt MESSAGES['bye']

=begin
PEDAC process for new features

1) Better integer validation

Understand:
- Find a method that validates user integer input
- Consider 0, negative and positive numbers
- No chars, symbols or empty inputs allowed

Test cases:
INPUT: 2              OUTPUT: Valid input
INPUT: -2             OUTPUT: Valid input
INPUT: 0              OUTPUT: Valid input
INPUT: ' '            OUTPUT: Valid input
INPUT: 'hello'        OUTPUT: Valid input
INPUT: 2 4            OUTPUT: Valid input
INPUT: 'hello world'  OUTPUT: Valid input
INPUT: '{_(*£)}'      OUTPUT: Valid input

Data structure: integers, strings, array

Algorithm:
- Method valid_number
- If input = -2, 0, 2
  - Method returns true
- Elsif input = ' ', 'string', '(@£$*@£$'
  - Method returns false and error msg shows

=end