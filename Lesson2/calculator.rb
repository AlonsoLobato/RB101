# This is my first exercise applying a PEDAC process

=begin 
PEDAC process
1) Understanding the problem
  - I have to build a calculator program
  - that takes two numbers from user
  - ask the user to choice an operation to perform from add, substract, multiply and divide
  - output the result of the operation

2) Test cases
Input: "2", "6" and "+"" => Output: 8
Input: "0", "9999" and "-" => Output: -9999
Input: "2", "4" and "*" => Output: 8
Input: "5", "2" and "/" => Output: 2.5
Input: "blabla", "1" and "*" => Output: 0
Input: " ", "2" and "-" => Output: -2
Input: " ", "1" and "/" => Output: 0.0

3)Data structure
Input: string, number
Output: number
Rules: if division left remainder, use floats

4)Algorithm
- gets two numbers(strings) from user / advoid blank line / and save them in separate variables
- gets a math operator from user (+, -, * or /) / advoid blank line /  and save it in a variable
- convert the two number variables to int 
- perform the math operation selected
- if math operator is division 
  - convert to float (in case division leaves remainder)
- puts the result to screen 

=end

# code:

puts "Welcome to the calculator program"

puts "Please enter a number"
number1 = gets.chomp
puts "Please enter a second number"
number2 = gets.chomp
puts "Please select one of the following math operations: 1.Add, 2.Substract, 3. Multiply, 4.Divide"
operation = gets.chomp

if operation == '1'
  result = number1.to_i + number2.to_i
elsif operation == '2'
  result =  number1.to_i - number2.to_i
elsif operation == '3'
  result =  number1.to_i * number2.to_i
else
  result =  number1.to_f / number2.to_f
end

puts "The result is: #{result}"
