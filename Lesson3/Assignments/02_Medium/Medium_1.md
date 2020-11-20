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
```

```ruby
def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end
```

#### My answer

- In the first implementation, the buffer is passed in as argument and new_element are appended to it with <<. This method mutates the original variable buffer.
- In the second implementation, the buffer variable is assigned inside the method to an input_array which is passed in as argument concatenated with new_element. In this method, the concatenation with + returns a new array, not mutating the original.

- So, the main difference, besides which operator is used to add new elements to the buffer is that the first implementation returns a mutated version of the original array whereas the second implementation returns a new array, leaving the original unmutated.

##### NOTES: 

- `+` returns new array
- `<<` returns the array mutated

#### School answer

Yes, there is a difference. While both methods have the same return value, in the first implementation, the input argument called `buffer` will be modified and will end up being changed after `rolling_buffer1` returns. That is, the caller will have the input array that they pass in be different once the call returns. In the other implementation, `rolling_buffer2` will not alter the caller's input argument.


### Question 5

Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator. A user passes in two numbers, and the calculator will keep computing the sequence until some limit is reached.

Ben coded up this implementation but complained that as soon as he ran it, he got an error. Something about the limit variable. What's wrong with the code? How would you fix this so that it works?

```ruby
limit = 15

def fib(first_num, second_num)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"
```

#### My answer

The limit variable is not passed to the method as argument, and as it is in a different scope, the method cannot access it.

We can fix the bug by passing in the limit variable as argument to the method, or by initializing it inside the method, so it is in scope.

```ruby
def fib(first_num, second_num)
  limit = 15
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"
```

#### School answer

Ben defines `limit` before he calls `fib`. But limit is not visible in the scope of `fib` because `fib` is a method and does not have access to any local variables outside of its scope.

You can make `limit` an additional argument to the definition of the `fib` method and pass it in when you call `fib`.


### Question 6

What is the output of the following code?

```ruby
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8
```

#### My answer

The output would be 34. The variable answer is not reasigned or mutated through the code, so if its value was originally 42 what the code does in the last line is substracting 8 to 42, so the output is 34.


### Question 7

One day Spot was playing with the Munster family's home computer and he wrote a small program to mess with their demographic data:

```ruby
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end
```

After writing this method, he typed the following...and before Grandpa could stop him, he hit the Enter key with his tail:

```ruby
mess_with_demographics(munsters)
```

Did the family's data get ransacked? Why or why not?

#### My answer

*My first thought was this:*

- The `mess_with_demographics` method does not change the `munsters` hash, because for `Hash#each` method to work we have to specify `key` and `value` before the block and in Spot's method only the `key` (`family_member`) is passed.

*But after looking at it again carefully, I came out with a different idea:*

- The `mess_with_demographics` method *chains* two built-in methods, `Hash#values` and `Array#each`. When this happens, the second in the chain performs on the returning value of the first!

- As `Hash#values` method returns an array with only the values of a given hash the `#each` method would be an `Array#each`, which returns a mutated arraym according to the operation requested in the block.

- So in this case `Hash#values` returns an array of hashes like this [{ "age" => 32, "gender" => "male" },{ "age" => 30, "gender" => "female" }, etc]. Then `Array#each` mutates this array performing changes on the elements `age` and `gender` of each `family_member`.  
- `family_member` is the parameter that the block uses to refer to the object(s) where it will perform its actions (in this case this referst to each element of the newly created array). 

##### NOTES: 

- When two methods are chained, the second method in the chain performs its action on the returned value from the first method.

#### School answer

Spot will find himself in the "dog" house for this one. The family's data is all in shambles now.

Why? Remember that in Ruby, what gets passed to a method isn't the value of the object. Under the hood, Ruby passes the `object_id` of each argument to the method. The method stores these object_id's internally in locally scoped (private to the method) variables (named per the method definition's parameter list).

So Spot's `demo_hash` starts off pointing to the `munsters` hash. His program could wind up replacing that with some other object id and then the family's data would be safe.

In this case, the program does not reassign `demo_hash` -- it just uses it as-is. So the actual hash object that is being messed with inside of the method IS the `munsters` hash.


### Question 8

Method calls can take expressions as arguments. Suppose we define a method called rps as follows, which follows the classic rules of rock-paper-scissors game, but with a slight twist that it declares whatever hand was used in the tie as the result of that tie.

```ruby
def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end
```

What is the result of the following call?

```ruby
puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
```

#### My answer

**I need to break down the method call to understand the problem:**

*from innnermost to outermost*
- `rps("rock", "paper")` returns `paper`
- `rps("rock", "scissors")` returns `rock`
*these two as arguments to `rps`*
- `rps("paper", "rock")` returns `paper`
*finally this last return and `rock` as arguments in a final call to `rps`*
- `rps("paper", "rock")` returns `paper`
- so the call finally returns `paper`

#### School answer

- The outermost call is evaluated by determining the result of `rps(rps("rock", "paper"), rps("rock", "scissors"))` versus `rock`. 
- In turn that means we need to evaluate the two separate results of `rps("rock", "paper")` and `rps("rock", "scissors")` and later combine them by calling rps on their individual results. 
- Those innermost expressions will return `"paper"` and `"rock"`, respectively. Calling `rps` on that input will return `"paper"`. Which finally when evaluated against `"rock"` will return `"paper"`.


### Question 9

Consider these two simple methods:

```ruby
def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end
```

What would be the return value of the following method invocation?

```ruby
bar(foo)
```

#### My answer

- In this case we are invoking a method using the return value of another method as argument: the returning value of method `foo` as argument to method `bar`.
- Return value of method `foo` is **always** the string `"yes"`
- Return value of method `bar` with `"yes"` as argument (returning from method `foo`) is `"no"`

#### School answer

- Return value of `bar(foo)` is `"no"`
- This is because the value returned from the foo method will always be "yes" , and "yes" == "no" will be false.
