##  Loops 1 set of exercises from the Exercises page

### Exercise 1: Runaway Loop

The code below is an example of an infinite loop. The name describes exactly what it does: loop infinitely. This loop isn't useful in a real program, though. Modify the code so the loop stops after the first iteration.

```ruby
loop do
  puts 'Just keep printing...'
end
```

#### My answer

```ruby
loop do
  puts 'Just keep printing...'
  break
end
```

##### NOTES

- Stopping a loop is as simple as adding the reserved word `break` inside the `loop`. `break` is nearly always necessary when using loop and doesn't require any conditions. 
- When `loop` executes a `break`, it stops iterating immediately and exits the block.

### Exercise 2: Loopception

The code below is an example of a nested loop. Both loops currently loop infinitely. Modify the code so each loop stops after the first iteration.

```ruby
loop do
  puts 'This is the outer loop.'

  loop do
    puts 'This is the inner loop.'
  end
end

puts 'This is outside all loops.'
```

#### My answer

```ruby
loop do
  puts 'This is the outer loop.'
  
  loop do
    puts 'This is the inner loop.'
    break
  end

  break
end

puts 'This is outside all loops.'
```

##### NOTES

- Looping within a `loop` is not uncommon. Therefore, it's important to understand how to avoid infinite loops and where to place `break` statements. 
- When it comes to nested loops, it can be difficult to clearly understand what's going on. As you digest the code, focus on one loop at a time.
- *The code in this exercise is considered bad practice.*

### Exercise 3: Control the Loop

Modify the following loop so it iterates 5 times instead of just once.

```ruby
iterations = 1

loop do
  puts "Number of iterations = #{iterations}"
  break
end
```

#### My answer

```ruby
iterations = 1

loop do
  puts "Number of iterations = #{iterations}"
  iterations += 1
  break if iterations > 5
end
```

##### NOTES 

- `loop` demonstrates what the simplest loop can look like. It iterates over the given block and stops only when the reserved word `break` is executed. 
- In the original code, `break` is written with no conditions. To fix it we need to append an `if` statement to `break` and increment `iterations` by 1 after every iteration.

### Exercise 4: Loop on Command

Modify the code below so the loop stops iterating when the user inputs `'yes'`.

```ruby
loop do
  puts 'Should I stop looping?'
  answer = gets.chomp
end
```

#### My answer

```ruby
loop do
  puts 'Should I stop looping?'
  answer = gets.chomp
  break if answer == 'yes'
end
```

##### NOTES 

- This is a practical example of how a loop can be used to retrieve and handle user input. 
- In the initial code, the loop continued iterating regardless of the input's value. 
- To change that, we add `break` with an `if` condition. The condition, in this case, needs to be `answer == 'yes'`. This tells break to only execute if the input value is `'yes'`.

### Exercise 5: Say Hello

Modify the code below so `"Hello!"` is printed 5 times.

```ruby
say_hello = true

while say_hello
  puts 'Hello!'
  say_hello = false
end
```

#### My answer

```ruby
count = 0

loop do
  puts 'Hello!'
  count += 1
  break if count == 5
end
```

#### School answer

```ruby
5.times do
  puts 'Hello!'
end
```

##### NOTES 

- Although using `#times` may be simpler and lets you write less code, it's still important to understand the fundamentals of how a method like `#times` actually works. 
- Just keep in mind that there's usually more than one way to accomplish a given task.

### Exercise 6: Print While

Using a `while` loop, print 5 random numbers between 0 and 99. The code below shows an example of how to begin solving this exercise.

```ruby
numbers = []

while <condition>
  # TODO
end
```

#### My answer

```ruby
numbers = []
count = 0

while count < 5
  numbers << rand(0..99)
  count += 1
end
puts numbers
```

#### School answer

```ruby
numbers = []

while numbers.size < 5
  numbers << rand(100)
end

puts numbers
```

##### NOTES 

- Two things to notice: the use of the `Kernel#rand` method and the use of `Array#size` method

### Exercise 7: Count Up

The following code outputs a countdown from 10 to 1. Modify the code so that it counts from 1 to 10 instead.

```ruby
count = 10

until count == 0
  puts count
  count -= 1
end
```

#### My answer

```ruby
count = 1

until count > 10
  puts count
  count += 1
end  
```

##### NOTES 

- The `until` loop is the opposite of the `while` loop. 
- `while` iterates until the condition evaluates to `false`. 
- `until` iterates until the condition evaluates to `true`.

### Exercise 8: Print Until

Given the array of several numbers below, use an until loop to print each number.

```ruby
numbers = [7, 9, 13, 25, 18]
```

#### My answer

```ruby
numbers = [7, 9, 13, 25, 18]
count = 0

until count == numbers.size
  puts numbers[count]
  count += 1
end
```

##### NOTES 

- Using `count` helps us in two ways. 
- First, it lets us control the number of iterations. In this case, we want to stop iterating when `count` equals the length of `numbers`. 
- Second, we use it to select the next value in the array. This works because `count` matches the index of each number we want to print.

### Exercise 9: That's Odd

The code below shows an example of a `for` loop. Modify the code so that it only outputs `i` if `i` is an odd number.

```ruby
for i in 1..100
  puts i
end
```

#### My answer

```ruby
for i in 1..100
  puts i if i.odd?
end
```

##### NOTES 

- `for` loops aren't used very often in Ruby. It's typically used to iterate over a collection.

### Exercise 10: Greet Your Friends

Your friends just showed up! Given the following array of names, use a `for` loop to greet each friend individually.

```ruby
friends = ['Sarah', 'John', 'Hannah', 'Dave']
```

#### My answer

```ruby
friends = ['Sarah', 'John', 'Hannah', 'Dave']

for friend in friends
  puts "Welcome #{friend}"
end  
```

##### NOTES 

- The `for` loop is useful for looping over a set number of elements. Using `for` allows us to easily do something with each element in the given array. 
- When naming variables in a `for` loop it's typical to use the standard format: `for friend in friends`, `for cat in cats`, etc. This makes it clear that we're iterating over `friends` and doing something with each `friend`.
