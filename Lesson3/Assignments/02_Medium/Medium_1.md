## Practice Problems: Medium 1

### Question 1

Let's do some "ASCII Art" (a stone-age form of nerd artwork from back in the days before computers had video screens).

For this practice problem, write a one-line program that creates the following output 10 times, with the subsequent line indented 1 space to the right:

```ruby
The Flintstones Rock!
 The Flintstones Rock!
  The Flintstones Rock!
```

#### My answer

*(I tried several things but finally I surrendered and looked at the School solution. Then I realised how closed I was to the solution!)*

1. ```ruby
  puts ("The Flintstones Rock!" + "\n") * 10
  ```

2. ```ruby
  puts (" " + "The Flintstones Rock!" + "\n") * 10
  ```

*(Up to here I managed to print the sentence 10 times in separate lines. Now I needed the extra indentation in each print)*

3. ```ruby
  (0..10).each {|| puts (" " + "The Flintstones Rock!" + "\n")}

  (1..10).each {|| puts ((" " * 2) + "The Flintstones Rock!" + "\n")}
  ```

4. ```ruby
  for count in (1..10) puts (" " * count) + "The Flintstones Rock!" + "\n") * 10
  ```

5. ```ruby
  10.times { puts "something" } #=> this works, no need \n

  10.times { |i| puts i+= 1 + "something" } #=> this throws a TypeError:String can't be coerced into Integer

  10.times { |" "| puts 10 * " " + "something" } #=> this throws a bunch of syntax error
  ```

*(Here I surrendered and decided to sneek peek at the solution)*

```ruby
10.times { |number| puts number * " " + "something" } #=> this throws a TypeError: String can't be coerced into Integer
```

#### School answer

```ruby
10.times { |number| puts (' ' * number) + "The Flintstones Rock!" }
```

### Question 2

The result of the following statement will be an error:

```ruby
puts "the value of 40 + 2 is " + (40 + 2)
```

Why is this and what are two possible ways to fix this?

#### My answer

- This code throws a `TypeError (no implicit conversion of Integer into String)`
- This error is due to the fact that we are trying to perform an operation between a string and an integer and this is not possible as these are two different data types.
- One way to fix this is to convert the result of the integers addition into a string with the `Integer#to_s` method and then append it to the rest of the string with the `String#+` method. 
```ruby
puts "the value of 40 + 2 is " + (40 + 2).to_s
```

#### School answer

- Another way to fix this is to use string interpolation `#{}`
```ruby
puts "the value of 40 + 2 is #{40 + 2}"
```

### Question 3

Alan wrote the following method, which was intended to show all of the factors of the input number:

```ruby
def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end
```

Alyssa noticed that this will fail if the input is 0, or a negative number, and asked Alan to change the loop. How can you make this work without using begin/end/until? Note that we're not looking to find the factors for 0 or negative numbers, but we just want to handle it gracefully instead of raising an exception or going into an infinite loop.

Bonus 1
What is the purpose of the `number % divisor == 0`?

Bonus 2
What is the purpose of the second-to-last line in the method (the `factors` before the method's `end`)?

#### My answer

```ruby
def factors(number)
  if number <= 0
    puts "sorry, 0 or negative integers aren't accepted"
  else
    divisor = number
    factors = []
    loop do
      factors << number / divisor if number % divisor == 0
      divisor -= 1
      if divisor == 0
        break
      end
    end    
  end
  factors
end
```

Bonus 1

The purpose of the `number % divisor == 0` is to determine whether a number is divisible by another with remainder of 0. In this case it's used to determine if this property of numbers is true or false.

Bonus 2

`factors` is the name of an array variable used in the method. The purpose of including this variable name before the `end` of the method is to force the method to return this variable back to the program or to the user in this case.

#### School answer

- Use a `while` condition for the loop. 
- So, if the input number is 0 or negative number, the method adds nothing to the array `factors` (so it's returned empty). 
- No *wrong input* message is implemented.

```ruby
def factors(number)
  divisor = number
  factors = []
  while divisor > 0 do
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end
```

### Question 4

Alyssa was asked to write an implementation of a rolling buffer. Elements are added to the rolling buffer and if the buffer becomes full, then new elements that are added will displace the oldest elements in the buffer.

She wrote two implementations saying, "Take your pick. Do you like `<<` or `+` for modifying the buffer?". Is there a difference between the two, other than what operator she chose to use to add an element to the buffer?

```ruby
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end
```

#### My answer

I'M HERE!

===============================
### Question 
#### My answer
#### School answer
##### NOTES: 
```ruby

```
