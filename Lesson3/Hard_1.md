## Practice Problems: Hard 1

### Question 1

What do you expect to happen when the greeting variable is referenced in the last line of the code below?

```ruby
if false
  greeting = "hello world"
end

greeting
```

#### My (wrong) answer

#### School answer

- `greeting` is `nil` here. When you initialize a local variable within an if block, even if that if block doesn’t get executed, the local variable is initialized to nil.


### Question 2

What is the result of the last line in the code below?

```ruby
greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings
```

#### My (wrong) answer

- The result is `'hi'` 
- The variable `greetings` isn't changed. The changes are operated on the variable greetings copy `informal_greeting`...

#### School answer

- The output is `{:a=>"hi there"}`. The reason is because `informal_greeting` is a reference to the original object. 
- The line `informal_greeting << ' there'` was using the `String#<<` method, which modifies the object that called it. This means that the original object was changed, thereby impacting the value in `greetings`. 
- If instead of modifying the original object, we wanted to only modify informal_greeting but not greetings, there are a couple of options:
  - The easier way would be to reassign the variable with `String#+=` method which returns a new string object which does not modify the original object.

```ruby
greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting += ' there'

puts informal_greeting  #  => "hi there"
puts greetings          #  => { :a => 'hi' }
```

### Question 3

In other practice problems, we have looked at how the scope of variables affects the modification of one "layer" when they are passed to another.

To drive home the salient aspects of variable scope and modification of one scope by another, consider the following similar sets of code.

What will be printed by each of these code groups?

A)

```ruby
def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
```

B)

```ruby
def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
```

C)

```ruby
def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
```

#### My answer

A)
- Expected output would be:
  - `"one is: one"`
  - `"two is: two"`
  - `"three is: three"`

- Inside the `mess_with_vars` method three variable reassignment happen, and variable reassignment is not mutating, so at the puts methods (last three lines of the code) the variable are the original ones.

B)
- Expected output would be:
  - `"one is: one"`
  - `"two is: two"`
  - `"three is: three"`

- As in the example A) here what happens are variable reassignments inside the method, which don't mutate the caller (in this case the variables passed in as arguments).

C)
- Expected output would be:
  - `"one is: two"`
  - `"two is: three"`
  - `"three is: one"`

- In this case, what happens inside the `mess_with_vars` is a mutation in place to the variables passed as arguments. The method used is `gsub!` which return a mutated version of the caller. 


### Question 4

Ben was tasked to write a simple ruby method to determine if an input string is an IP address representing dot-separated numbers. e.g. "10.4.5.11". He is not familiar with regular expressions. Alyssa supplied Ben with a method called `is_an_ip_number?` that determines if a string is a numeric string between `0` and `255` as required for IP numbers and asked Ben to use it.


```ruby
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true
end
```

Alyssa reviewed Ben's code and says "It's a good start, but you missed a few things. You're not returning a false condition, and you're not handling the case that there are more or fewer than 4 components to the IP address (e.g. "4.5.5" or "1.2.3.4.5" should be invalid)."

Help Ben fix his code.

#### My answer

- I have developed a whole program, with a main loop to request user for input and output valid or invalid IP entered
- Also, I opted for creating two methods that the program does not require: the `is_an_ip_number?` mentioned in the exercise instructions plus an extra method `valid_length?` to check if the length of the entered IP address contains four dot-separated digits.

```ruby
def valid_length?(str)
  str.split(".").size == 4
end

def is_an_ip_number?(str)
  (str.to_i.to_s == str) && (str.to_i >= 0 && str.to_i <=255)
end

def dot_separated_ip_address?(str)
  if valid_length?(str)
    dot_separated_words = str.split(".")
    while dot_separated_words.size > 0 
      word = dot_separated_words.pop
      return false unless is_an_ip_number?(word)
    end
    true
  end
end

loop do
  puts "please enter an ip to check"
  input_string = gets.chomp
  if dot_separated_ip_address?(input_string)
    puts "#{input_string} is a valid IP address"
    break
  else
    puts "#{input_string} is an invalid IP address"
  end
end
```

#### School answer

- There are several ways to fix this. To determine if there are exactly 4 dot-separated "words" in the string, you can simply add a check for dot_separated_words.size after splitting the string.

- The other error in Ben's code is that instead of returning false upon encountering a non-numeric component, he used break to break out of the while loop. Once he breaks, control falls through to the return true statement. He can fix this by performing return false instead of break.

```ruby
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end

  true
end
```

##### NOTES: 

- any `return true` can be shortened to just `true`
- the take away from this lesson is the way to handle `true`/`false` as a return when certain conditions meet
  - in this case, to break from a loop and return `false`, we use `return false unless <condition>` OR the `return false unless is_an_ip_number?(word)` of my example
- another thing to remember is to use spaces / blank lines within the code to make it easier to read