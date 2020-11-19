### Question 1

What would you expect the code below to print out?

```ruby
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
```

#### My answer

```ruby
1
2
2
3
```

The `Array#uniq` method returns a new array by removing the duplicate values in self.

The given code invokes the `Array#uniq` method in the array `numbers` but the resulting new array is not used in the code
`Puts` outputs the array `numbers` which hasn't been modified. 

##### NOTES: 
- the `Array#uniq` method does not mutate the caller (it returns a new array without changing the original one)


### Question 2

Describe the difference between `!` and `?` in Ruby. And explain what would happen in the following scenarios:

1. what is != and where should you use it?
2. put ! before something, like !user_name
3. put ! after something, like words.uniq!
4. put ? before something
5. put ? after something
6. put !! before something, like !!user_name

#### My answer

- `!` is the negation operator. It's used to turn any object into the opposite of their boolean
- `?` is the ternary operator for if...else statement

1. what is `!=` and where should you use it?

  - `!=` is a logical operator that means not equal to.
  - Should be used to check expressions, objects, etc against each other, to check if something is not equal to something else

2. put `!` before something, like `!user_name`

  - It negates the object it preceedes, in this case it negates the variable `user_name`

3. put `!` after something, like `words.uniq!`

  - `!` after something, like a method is just part of the method name
  - It can denote that a method is destructive (mutates the caller) but not neccesarily. 
  
4. put `?` before something

  - If used in and `if...else` statement, it'd be a ternary operator
  - Otherwise, it'd just be part of the name

5. put `?` after something

  - `?` after something, like a method, is just part of the method name
  - `?` is usually placed at the end of a method's name that return a boolean

6. put `!!` before something, like `!!user_name`

  - `!!` or double bang is just an expression not an operator. It really is a double negation (`!`) operator
  - The not not or `!!` is use to turn any object into their boolean equivalent, according to its truthiness.
  - We put it before an object name and it'll return true if the object is truthy or false if falsey (if false or nil). 


### Question 3

Replace the word "important" with "urgent" in this string:

```ruby
advice = "Few things in life are as important as house training your pet dinosaur."
```

#### My answer

```ruby
advice_to_arr = advice.split
advice_to_arr[advice_to_arr.index('important')] = 'urgent'
advice_to_arr.join(' ')
```

##### NOTES: 
- `split` returns an array where each element is a word of a string
- `index(obj)` returns the content of an arrat at a given index. Then we reasign its value with `=`
- `join(' ')` returns a string made of array elements. The (' ') makes sure that the elements are separate by a space

#### School answer

```ruby
advice.gsub!('important', 'urgent')
```

##### NOTES: 
- String#gsub(pattern, replacement) method returns a copy of a string with all occurrences of pattern substitute by replacement. Add ! at the method to make this substitution in place, mutating the caller.


### Question 4

The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:

```ruby
numbers = [1, 2, 3, 4, 5]
```

What do the following method calls do (assume we reset numbers to the original array between method calls)?

```ruby
numbers.delete_at(1)
numbers.delete(1)
```

#### My answer
`Array#delete_at(index)` deletes and returns the element at the specified index. Mutates the caller.
`Array#delete(obj)` deletes and return all elements from the array that are equal to the given argument. Mutates the caller.


### Question 5

Programmatically determine if 42 lies between 10 and 100.
(hint: Use Ruby's range object in your solution.)

#### My answer

```ruby
puts "42 lies betwen 10 and 100" if (10..100).cover?(42)
```

##### NOTES: 
- `Range#cover?(obj)` method returns true if the given obj exist within a range


### Question 6

Starting with the string:

```ruby
famous_words = "seven years ago..."
```

show two different ways to put the expected "Four score and " in front of it.

#### My answer

One way:
```ruby
famous_words = "seven years ago..."
famous_words_2 = "Four score and "
final_famous_words = famous_words_2 + famous_words
```

Another way:
```ruby
famous_words_2.concat(famous_words)
```

#### School answer
One way:
```ruby
"Four score and " + famous_words
```

Another way:
```ruby
"Four score and " << famous_words
```

Another way:
```ruby
famous_words.prepend("Four score and ")
```

##### NOTES: 
- `String#concat` method concatenates (add at the end) a given string to the string where it's called. Mutates the caller
- `String#prepend` method prepends (add at the beginning) a given string to the string where it's called. Mutates the caller
- both can take multiple arguments and will concat or prepend in the entered order


### Question 7

If we build an array like this:

```ruby
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
```

We will end up with this "nested" array:

```ruby
["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
```

Make this into an un-nested array.

#### My answer

```ruby
flintstones.flatten! 
```

##### NOTES: 
- `Array#flatten` method returns a new arr that is a one dimensional version of an existing nested array. Doesn't mutate caller
- By adding `!` the method does the same but makes the change in place. Mutates the caller


### Question 8

Given the hash below

```ruby
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
```

Turn this into an array containing only two elements: Barney's name and Barney's number

#### My answer

```ruby
arr = flintstones.select { |k, v| k == "Barney" }
```

##### NOTES: 
- My solution isn't correct as it does not return an array
- `Hash#select{|k, v| block}` method returns a new hash consisting of entries for which the block returns true.

#### School answer
```ruby
flintstones.assoc("Barney")
```
##### NOTES: 
- `Hash#assoc(obj)` method searches through a hash looking for the obj key and returns an array with the key and its value(s) Does not mutate the caller.