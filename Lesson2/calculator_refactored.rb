# Adding new features to the calculator exercise
# See the code below and the PEDAC process at the bottom

def prompt(msg)
  puts "=> #{msg}"
end

def valid_number(num)
  num.to_i != 0
end  

def operation_in_course(op)
  puts "Adding the two numbers" if op == '1' 
  puts "Substracting the two numbers" if op == '2' 
  puts "Multiplying the two numbers" if op == '3' 
  puts "Dividing the two numbers" if op == '4'
  sleep(1)        
end

prompt "Welcome to the calculator program"
name = nil
loop do
  prompt "What is your name?"
  name = gets.chomp
  if name.empty? || name.to_i != 0
    prompt "Please enter your name"
  else
    break
  end    
end

prompt "Hello #{name}"

loop do
  number1 = nil
  loop do
    prompt "Please enter a number"
    number1 = gets.chomp
    if valid_number(number1)
      break
    else
      prompt "Please enter a valid number"   
    end  
  end

  number2 = nil
  loop do
    prompt "Please enter a second number"
    number2 = gets.chomp
    if valid_number(number2)
      break
    else
      prompt "Please enter a valid number"  
    end  
  end

  prompt "Please select one of the following math operations:" 
  prompt "1.Add" 
  prompt "2.Substract" 
  prompt "3.Multiply" 
  prompt "4.Divide"

  operation = nil
  loop do
    operation = gets.chomp
    if %w(1 2 3 4).include?(operation)
      break
    else
      prompt "Please enter a valid operation from 1 to 4"   
    end
  end

  result = case operation
           when '1'
             number1.to_i + number2.to_i
           when '2'
             number1.to_i - number2.to_i
           when '3'
             number1.to_i * number2.to_i
           when '4'      
             number1.to_f / number2.to_f
  end  

  operation_in_course(operation)
  prompt "The result is: #{result}"

  prompt "Do you want to calculate another operation?"
  answer = gets.chomp
  break unless answer.downcase == 'y' || answer.downcase == 'yes'
end

prompt "Ok, thanks for using the calculator. Good bye!"


=begin
PEDAC process
1) Understanding the problem
  - I have to build a calculator program
  - that prompts user for two numbers 
  - that prompts user to choice an operation to perform with these numbers from add, substract, multiply and divide
  - output the result of the operation
  - validate every user input
  - prompt user for name
  - ask if user wants to run program again
  - say good bye when finishes

2) Test cases
Input: 2, 6 & '+' => Output: 8
Input: 0, 9999 & '-' => Output: -9999
Input: 2, 4 & '*' => Output: 8
Input: 5, 2 & '/' => Output: 2.5
Input: 10, 3 & '/' => Output: 3.3333333333333335
Input: 'blabla', 1 & '*' => Output: Please enter a valid number
Input: '', 2 & '-' => Output: Please enter a valid number
Input name: " " => Output: Please enter your name
Input name: 1 => Output: Please enter your name
Input perform again: 'yes' => Output: Please enter a number
Input perform again: 'y' => Output: Please enter a number
Input perform again: 'YES' => Output: Please enter a number
Input perform again: 'Yes' => Output: Please enter a number
Input perform again: 'No' => Output: Ok, thanks and good bye
Input perform again: '' => Output: Ok, thanks and good bye
Input perform again: 'blabla' => Output: Ok, thanks and good bye
Input perform again: '' => Output: Ok, thanks and good bye

3)Data structure
Input: string, number, array
Output: number
Rules: if division left remainder, use floats

4)Algorithm
- precede every output msg with '=>'  
- gets user name and welcome them
- gets two numbers(strings) from user and save them in separate variables
- gets a math operator from user (+, -, * or /) and save it in a variable
- validate every user's inputs with loops
  - output error msg and ask for input again 
- perform the selected math operation
  - convert the two number variables to int and perform chosen operation
  - if math operator is division 
    - convert the two number variables to float (so it returns decimals in case division leaves remainder)
- output the result to screen
  - puts the name of the operation being carried 
  - sleep for 1 second
  - puts the result of the math operation
- prompt user to start program again
  - if answer = yes, loop back to ask for numbers and so on
  - otherwise, puts good bye msg and end
=end