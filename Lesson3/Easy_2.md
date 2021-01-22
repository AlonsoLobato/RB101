## Practice Problems: Easy 2

### Question 1

In this hash of people and their age,

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
```

see if "Spot" is present.

**Bonus:** What are two other hash methods that would work just as well for this solution?

#### My answer

```ruby
ages.has_key?("Spot")
```

Bonus:

```ruby
ages.key?("Spot")
```

```ruby
ages.include?("Spot")
```

```ruby
ages.member?("Spot")
```

##### NOTES: 
- The four methods `Hash#has_key?`, `Hash#key?`, `Hash#include?`, `Hash#member?` returns true if the given key is present in hash, false otherwise.
- They all do the same thing, so can be considered aliases. Some people say that this is to accommodate people that are used to a particular convention because of familiarity with another programming languages.
- The preferred solution would be `Hash#key?(key)`


### Question 2

Starting with this string:

```ruby
munsters_description = "The Munsters are creepy in a good way."
```

Convert the string in the following ways (code will be executed on original `munsters_description` above):

```ruby
"tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
"The munsters are creepy in a good way."
"the munsters are creepy in a good way."
"THE MUNSTERS ARE CREEPY IN A GOOD WAY."
```

#### My answer

```ruby
munsters_description.swapcase!
#=> "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
```

```ruby
munsters_description.capitalize!
#=> "The munsters are creepy in a good way."
```

```ruby
munsters_description.downcase!
#=> "the munsters are creepy in a good way."
```

```ruby
munsters_description.upcase!
#=> "THE MUNSTERS ARE CREEPY IN A GOOD WAY."
```

##### NOTES: 
- There are four string methods to change the capitalisation of a given string:
- The two most common ones are `String#downcase` and `String#upcase`, which return a copy of a string with ALL its chars converted to lowercase or uppercase respectively.
- The `String#capitalize` method returns a copy of string with ONLY first char to uppercase and the remainder to lowercase.
- The `String#swapcase` method returns a copy of string with ALL uppercase chars converted to lowercase and viceversa.
- They all can be performed with ! to mutate the caller.


### Question 3 

We have most of the Munster family in our age hash:

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
```

add ages for Marilyn and Spot to the existing hash

```ruby
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
```

#### My answer

```ruby
ages[:"Marilyn"] = 22
ages[:"Spot"] = 237
```

#### School answer

```ruby
ages.merge!(additional_ages)
```

##### NOTES: 
- I've used the brute force and add the new key/value pairs to the existing hash
- But of course! both hashes already existed so the easier way is to merge them both with the `Hash#merge` method
- The `Hash#merge` method returns a new hash combining the content of several hashes
- It acepts a block to set preferences in case of repeated elements
- It can be performed with ! to mutate the caller


### Question 4

See if the name "Dino" appears in the string below:

```ruby
advice = "Few things in life are as important as house training your pet dinosaur."
```

#### My answer

```ruby
advice.include?("Dino")
```

##### NOTES: 
- `String#include?(str)` method returns true if str is included in the string where it's called 


### Question 5

Show an easier way to write this array:

```ruby
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
```

#### My answer

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```

##### NOTES: 
- the %w returns an array. It is a short notation to declare an array
- in parentheses the elements of the array don't need commas or quote marks to separate
- even the parentheses can be swaped by [...], {...}, or even !...! they all will return an array, but by convention is good to use (...)
- read documentation [here](https://ruby-doc.org/core-2.0.0/doc/syntax/literals_rdoc.html#label-Percent+Strings)


### Question 6

How can we add the family pet "Dino" to our usual array:

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```

#### My answer

```ruby
flintstones << "Dino"
```

##### NOTES: 
- `Array#<<obj`, `Array#append(obj)` and `Array#push(obj)` methods are aliases that return self adding at the end as many objects as passed in. Mutate the caller.
- If we want to append several different objs we need to use `<<`, `.push()` or `.append()` several times: 
- ```ruby
  a << "c" << "d" << [ 3, 4 ]
  #=> [ 1, 2, "c", "d", [ 3, 4 ] ]
  ```
- Notice how `<<` does not use parentheses for objs, even when chaining up several objects, but `.push()` and `.append()` always need the `()` and the `.` when calling the method


### Question 7

In the previous practice problem we added Dino to our array like this:

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"
```

We could have used either Array#concat or Array#push to add Dino to the family.
How can we add multiple items to our array? (Dino and Hoppy)

#### My answer

```ruby
flintstones.concat(["Dino", "Hoppy"])
```

OR 

```ruby
flintstones << "Dino" << "Hoppy"
```

OR EVEN

```ruby
flintstones.push("Dino").push("Hoppy")
```

##### NOTES: 
- `Array#concat` adds an array to an existing array rather than just one item
- `Array#<<obj`, `Array#append(obj)` and `Array#push(obj)` all return the array so we can chain


### Question 8

Shorten this sentence. Remove everything starting from "house".


```ruby
advice = "Few things in life are as important as house training your pet dinosaur."
```

Review the `String#slice!` documentation, and use that method to make the return value "Few things in life are as important as ". But leave the advice variable as "house training your pet dinosaur.".

As a bonus, what happens if you use the `String#slice` method instead?

#### School answer

```ruby
advice.slice!(0, advice.index("house"))
```

BONUS

```ruby
advice.slice(0, advice.index("house"))
```

##### NOTES: 
- `String#slice!` method delete a specified portion from a given string (according to the arguments given) and return it. Mutates the caller, so the original string looses the specified portion.
-  `String#slice` method delete a specified portion from a given string (according to the arguments given) and return it. It does not mutate the caller, so the original string remains unchanged.
- Notice how the school answer elaborates the argument as to delete a portion of string from index 0 to the index that correspond to the obj "house"
- Read documentation [here](https://devdocs.io/ruby~2.6/string#method-i-slice)


### Question 9

Write a one-liner to count the number of lower-case 't' characters in the following string:

```ruby
statement = "The Flintstones Rock!"
```

#### My answer

```ruby
statement.count('t')
```

##### NOTES: 
- `String#count(str)` method returns an integer which is the number of repetitions of str included in a given string
- The str can be defined to find any pattern. See documentation [here](https://devdocs.io/ruby~2.6/string#method-i-count)


### Question 10

Back in the stone age (before CSS) we used spaces to align things on the screen. If we had a 40 character wide table of Flintstone family members, how could we easily center that title above the table with spaces?

```ruby
title = "Flintstone Family Members"
```

#### My answer

```ruby
title.center(40)
```

##### NOTES: 
- The `String#center(width)` method returns a new string of lenght width with the string centered within it
- It does not mutate the caller
