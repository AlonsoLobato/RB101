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

NOTE: the `Array#uniq` method does not mutate the caller (it returns a new array without changing the original one)

### Question 2

Describe the difference between `!` and `?` in Ruby. And explain what would happen in the following scenarios:

1. what is != and where should you use it?
2. put ! before something, like !user_name
3. put ! after something, like words.uniq!
4. put ? before something
5. put ? after something
6. put !! before something, like !!user_name

#### My answer

`!` is the negation operator. It's used to turn any object into the opposite of their boolean
`?` is the ternary operator for if...else statement

1. what is `!=` and where should you use it?

  `!=` is a logical operator that means not equal to.
  Should be used to check expressions, objects, etc against each other, to check if something is not equal to something else

2. put `!` before something, like `!user_name`

  It negates the object it preceedes, in this case it negates the variable `user_name`

3. put `!` after something, like `words.uniq!`

  ! after something, like a method is just part of the method name
  It can denote that a method is destructive (mutates the caller) but not neccesarily. 
  
4. put `?` before something

  If used in and if...else statement, it'd be a ternary operator
  Otherwise, it'd just be part of the name

5. put `?` after something

  ? after something, like a method, is just part of the method name
  NOTE: ? is usually palced at the end of a method name that return a boolean

6. put `!!` before something, like `!!user_name`

  !! or double bang is just an expression not an operator. It really is a double negation (!) operator
  The not not or !! is use to turn any object into their boolean equivalent, according to its truthiness.
  We put it before an object name and it'll return true if the object is truthy or false if falsey (if flase or nil). 

### Question 3

Replace the word "important" with "urgent" in this string:

```ruby
advice = "Few things in life are as important as house training your pet dinosaur."
```

#### My answer
