##  Loops 2 set of exercises from the Exercises page

### Exercise 1: Even or Odd?

Write a loop that prints numbers 1-5 and whether the number is even or odd. Use the code below to get started.

```ruby
count = 1

loop do
  count += 1
end
```

#### My answer

```ruby
count = 1

loop do
  if count.odd? 
    puts "#{count} is odd!"
  else 
    puts "#{count} is even!"
  end
  count += 1
  break if count > 5
end
```

### Exercise 2: Catch the Number

Modify the following code so that the loop stops if number is equal to or between 0 and 10.

```ruby
loop do
  number = rand(100)
  puts number
end
```

#### My answer

```ruby
loop do
  number = rand(100)
  break if number >= 0 && number <= 10
  puts number
end
```

#### School answer

```ruby
loop do
  number = rand(100)
  puts number

  if number.between?(0, 10)
    break
  end
end
```

##### NOTES 

`Comparable#between?` method takes two arguments and returns a boolean, `true` or `false`, if the caller's value is between the two integers provided. In this case, we use it in an `if` condition that will execute break when `#between?` returns true.

### Exercise 3: Conditional Loop

Using an `if/else` statement, run a loop that prints `"The loop was processed!"` one time if `process_the_loop` equals `true`. Print `"The loop wasn't processed!"` if `process_the_loop` equals `false`.

```ruby
process_the_loop = [true, false].sample
```

#### My answer

```ruby
process_the_loop = [true, false].sample

loop do
  if process_the_loop 
    puts "The loop was processed!"
    break
  else
    puts "The loop wasn't processed!"
    break
  end
end
```

#### School answer

```ruby
process_the_loop = [true, false].sample

if process_the_loop
  loop do
    puts "The loop was processed!"
    break
  end
else
  puts "The loop wasn't processed!"
end
```

##### NOTES 

- In my solution the loop didn't do anything
- The school solution the loop iterates one time only, but it is executed
- If using a loop in this code seems kind of silly, it is! The main reason for requiring a loop is to get some practice using the loop syntax.

### Exercise 4: Get the Sum

The code below asks the user `"What does 2 + 2 equal?"` and uses `#gets` to retrieve the user's answer. Modify the code so `"That's correct!"` is printed and the loop stops when the user's answer equals `4`. Print `"Wrong answer. Try again!"` if the user's answer doesn't equal `4`.

```ruby
loop do
  puts 'What does 2 + 2 equal?'
  answer = gets.chomp.to_i
end
```

#### My answer

```ruby
loop do
  puts 'What does 2 + 2 equal?'
  answer = gets.chomp.to_i

  if answer == 4
    puts "That's correct!"
    break
  else
    puts "Wrong answer. Try again!"
  end    

end
```

### Exercise 5: Insert Numbers

Modify the code below so that the user's input gets added to the `numbers` array. Stop the loop when the array contains 5 numbers.

```ruby
numbers = []

loop do
  puts 'Enter any number:'
  input = gets.chomp.to_i
end
puts numbers
```

#### My answer

```ruby
numbers = []

loop do
  puts 'Enter any number:'
  input = gets.chomp.to_i
  
  numbers << input
  break if numbers.size == 5
end
puts numbers
```

### Exercise 6: Empty the Array

Given the array below, use `loop` to remove and print each name. Stop the loop once `names` doesn't contain any more elements.

```ruby
names = ['Sally', 'Joe', 'Lisa', 'Henry']
```

#### My answer

```ruby
names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  puts names.pop
  break if names.empty?
end
```

#### School answer

```ruby
names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  puts names.shift
  break if names.empty?
end
```

##### NOTES 

- I use `Array#pop` method, which removes the last element in an array. The preceeding puts prints the element
- The school uses `Array#shift` method, which removes the first element in an array. Again, the preceeding puts outputs that element 

### Exercise 7: Stop Counting

The method below counts from 0 to 4. Modify the block so that it prints the current number and stops iterating when the current number equals `2`.

```ruby
5.times do |index|
  # ...
end
```

#### My answer

```ruby
5.times do |index|
  puts index
  break if index == 2
end
```

##### NOTES 

- The `Integer#times` method counts from 0 to one less than the specified number
- The block parameter `index` represents the current iteration number. We can print the current number with `puts index`

### Exercise 8: Only Even

Using `next`, modify the code below so that it only prints `even` numbers.

```ruby
number = 0

until number == 10
  number += 1
  puts number
end
```

#### My answer

TO DO!


=======
### Exercise :
#### My answer
#### School answer
##### NOTES 
```ruby

```
