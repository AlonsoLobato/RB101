## Practice Problems: Medium 2

### Question 1

Every named entity in Ruby has an `object_id`. This is a unique identifier for that object.

It is often the case that two different things "look the same", but they can be different objects. The "under the hood" object referred to by a particular named-variable can change depending on what is done to that named-variable.

In other words, in Ruby, all values are objects...but they are not always the same object.

Predict how the values and object ids will change throughout the flow of the code below:

```ruby
def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id
  b_outer_id = b_outer.object_id
  c_outer_id = c_outer.object_id
  d_outer_id = d_outer.object_id

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block."
  puts

  1.times do
    a_outer_inner_id = a_outer.object_id
    b_outer_inner_id = b_outer.object_id
    c_outer_inner_id = c_outer.object_id
    d_outer_inner_id = d_outer.object_id

    puts "a_outer id was #{a_outer_id} before the block and is: #{a_outer_inner_id} inside the block."
    puts "b_outer id was #{b_outer_id} before the block and is: #{b_outer_inner_id} inside the block."
    puts "c_outer id was #{c_outer_id} before the block and is: #{c_outer_inner_id} inside the block."
    puts "d_outer id was #{d_outer_id} before the block and is: #{d_outer_inner_id} inside the block."
    puts

    a_outer = 22
    b_outer = "thirty three"
    c_outer = [44]
    d_outer = c_outer[0]

    puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
    puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
    puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
    puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after."
    puts


    a_inner = a_outer
    b_inner = b_outer
    c_inner = c_outer
    d_inner = c_inner[0]

    a_inner_id = a_inner.object_id
    b_inner_id = b_inner.object_id
    c_inner_id = c_inner.object_id
    d_inner_id = d_inner.object_id

    puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the block (compared to #{a_outer.object_id} for outer)."
    puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the block (compared to #{b_outer.object_id} for outer)."
    puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the block (compared to #{c_outer.object_id} for outer)."
    puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the block (compared to #{d_outer.object_id} for outer)."
    puts
  end

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the block."
  puts

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
end
```

#### My answer / #### School answer

- Objects ID's are unique
- When two variables hold the same value or refer to the same object, they both are assigned the same object id: the id corresponds to the object itself, not to the variable that hold this object
- When an object THAT HASN'T BEEN CHANGED gets reassigned to a different variables, that new variables gets or points to the id the object originally had, regardless of if the objects was created in the outter or inner scope or if it has been passed over from one scope to another(assuming we pass the object with the correct use of parameters, arguments, blocks, etc)
- When an object THAT HAS BEEN CHANGED gets assigned to a variable, that variable gets or points to a new object id, as the object has changed (so a new id has been created). Same as before, this happens despites of scopes assuming the object has been passed around respencting the method rules. 
- If the program breaks the rules of correct variable passing values between scopes, etc. the object ids wouldn't make sense and error msgs would be thrown

### Question 2

Let's look at object id's again from the perspective of a method call instead of a block.

Here we haven't changed ANY of the code outside or inside of the block/method. We simply took the contents of the block from the previous practice problem and moved it to a method, to which we are passing all of our outer variables.

Predict how the values and object ids will change throughout the flow of the code below:

```ruby
def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id
  b_outer_id = b_outer.object_id
  c_outer_id = c_outer.object_id
  d_outer_id = d_outer.object_id

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block."
  puts

  an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)


  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the method call."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the method call."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the method call."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the method call."
  puts

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts
end


def an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)

  puts "a_outer id was #{a_outer_id} before the method and is: #{a_outer.object_id} inside the method."
  puts "b_outer id was #{b_outer_id} before the method and is: #{b_outer.object_id} inside the method."
  puts "c_outer id was #{c_outer_id} before the method and is: #{c_outer.object_id} inside the method."
  puts "d_outer id was #{d_outer_id} before the method and is: #{d_outer.object_id} inside the method."
  puts

  a_outer = 22
  b_outer = "thirty three"
  c_outer = [44]
  d_outer = c_outer[0]

  puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
  puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
  puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
  puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after."
  puts

  a_inner = a_outer
  b_inner = b_outer
  c_inner = c_outer
  d_inner = c_inner[0]

  a_inner_id = a_inner.object_id
  b_inner_id = b_inner.object_id
  c_inner_id = c_inner.object_id
  d_inner_id = d_inner.object_id

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the method (compared to #{a_outer.object_id} for outer)."
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the method (compared to #{b_outer.object_id} for outer)."
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the method (compared to #{c_outer.object_id} for outer)."
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the method (compared to #{d_outer.object_id} for outer)."
  puts
end
```

#### My answer



### Question 3

Let's call a method, and pass both a string and an array as arguments and see how even though they are treated in the same way by Ruby, the results can be different.

Study the following code and state what will be displayed...and why:

```ruby
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
```

#### My answer

- Expected output: 
  - `"My string looks like this now: pumpkins"`
  - `"My array looks like this now: ['pumpkins', 'rutabaga']"`

- Why?
  - This program defines a method `tricky_method` that takes two parameters, a string and an array
  - When a string is passed to the method, another string is appended to it. Same when an array is passed to the method, but in this case a new element is appended to the array.
  - Then two variables are declared: `my_string` and `my_array` which, as expected, hold a string and an array respectively.
  - When the method is called in the program, we pass in `my_string` and `my_array` as arguments to it.
  - All ok up to this point, the method does what we expect, it append a new string to `my_string` and a new element to `my_array`.

  - However, when we call the `tricky_method` method, the problem is that it only returns the updated `my_array` (as it is the last line of code executed in the method) but does nothing to `my_string`
  - And that's why the variable interpolation in the first puts returns the `my_string` unchanged but the variable interpolation in the second puts returns `my_array` changed. 

#### School answer

- The problem here is not exactly what the method returns, but how the methods `String#+=` and `Array#<<` are or not mutating methods regarding the passed arguments. So what happens to the variables `my_string` and `my_array` after calling the method is that one is mutated and the other doesn't.

  - The argument `my_array` will be subjected to the mutating method `#<<`. Consequently passing `my_array` in the `tricky_method` will change the value of that variable. 
  - In the case of the argument `my_string`, we can see that the method `#+=` reassigns the argument to a new variable that has the same name (variable shadowing). Nevertheless reassignment create a new object that will be then modified accordingly.

- The method creates two new variables `a_string_param` and `an_array_param` which are:
  - Inside the method scope only, we cannot access them outside the method
  - Assign with the reference (object id) of the variables we pass in as arguments to the method
  - `my_string` is reassigned to `a_string_param` with the non mutating method `#+=`
  - `my_array` is reassigned to `an_array_param` with the mutating method `#<<`
  - so the variable my_array gets mutate and when we access it with puts in the outer scope, the variable has changed
  - whereas the variable my_string only change within the scope of the method, but not because has been mutate but because has been reassigned. However, in the outer scope remains with the original object id.

##### NOTES: 

- Remember that methods always return the last line of code that is executed inside it, unless an explicit return is placed before.

- What the method returns is not relevant (I am right, the method returns the last line executed) but if the method mutates the variables passed in as arguments (which act as caller for the method)

- So the learning here is if a variable gets mutates when is passed to a method or not, and this depends on the type of method it is. 


### Question 4

To drive that last one home...let's turn the tables and have the string show a modified output, while the array thwarts the method's efforts to modify the caller's version of it.

```ruby
def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
```

#### My answer

- This program does the opposite as the previous program.
- Inside the method the same thing happens, but now the string is mutate and the array is reassigned.
- So, from outside the accessibility of both variables are the opposite as the previous example.

- In this method now the string is subjected to a mutating operation. And the array binds a new value inside the method. Consequently the method will modify the value of my_string but not the one bound to the outer scope my_array.


#### School answer

- The explanation is all about what Ruby does with local variables when we change the object it points to. Does it create a new local variable? Or is it able to just modify the existing object?


### Question 5

Depending on a method to modify its arguments can be tricky:

```ruby
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
```

Whether the above "coincidentally" does what we think we wanted "depends" upon what is going on inside the method.

How can we refactor this practice problem to make the result easier to predict and easier for the next programmer to maintain?

#### My answer

- We can make sure inside the tricky_method we use mutating methods for both variables, the string and the array.
- If we do this, the output of both puts methods (last two lines) will be a modify version of the variables passed in as arguments. 

```ruby
def tricky_method(a_string_param, an_array_param)
  a_string_param << "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
```

#### School answer

- The solution would be to rewrite the code so it's more explicit and less vague.

```ruby
def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = not_so_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
```

##### NOTES: 
- Note how the method name and specially the variable names are more specific
- We ensure that the method returns what we want (NOTICE how we request here the method to return two variables in a single line of code)
- The variables used as arguments to the method (as before, my_string and my_array) are clearly reassigned outside the method (NOTICE how these two are reassigned, in the desired order, in a single line of code)
- finally the puts methods are very simple as they both works with variables on their same scope


### Question 6

How could the unnecessary duplication in this method be removed?

```ruby
def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end
```

#### My answer

```ruby
def color_valid(color)
  color == "blue" || color == "green"
end
```

- In Ruby, any expression that is not nil or false will be consider truthy
- So, with a single line of code in the method, we evaluate as true everything that is blue or green, any other input will be consider false.

##### NOTES: 
- Both methods do exactly the same thing but the second is easier to read!
