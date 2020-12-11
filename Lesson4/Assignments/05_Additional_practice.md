##  Practice Problems: Additional Practice
### (Iteration, selection and transformation over collections)

**from Lesson4: Ruby collections > 11.Practice Problems: Additional Practice**

=====================================================================================

### Practice Problem 1

Given the array below

```ruby
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
```

Turn this array into a hash where the names are the keys and the values are the positions in the array.

#### My answer

##### Rules / requirements
- Turn a given array into a hash, where
  - Keys are elements of the arr
  - Values are the elements positions (indexes) in the array
- Array's elements are strings

##### Examples
```ruby
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
# => {"Fred' => 0, "Barney" => 1, "Wilma" => 2, "Betty" => 3, "Pebbles" => 4, "BamBam" => 5}
```

#### Data Structure
- Array of strings as input
- Hash as output with strings as keys and integers as values

#### Algorithm
1. Given `flintstones`, an array of strings 
2. Iterate over each element in the arr and
3. Create a new hash `flintstones_hash`
  - Transform every string element into a string key of new hash
  - Keep track of index position of each element in arr and assign it as value to the keys
4. Return new hash  

#### Code
```ruby
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_hash = {}
counter = 0

loop do
  flintstones_hash[flintstones[counter]] = flintstones.index(flintstones[counter])
  counter += 1
  break if counter == flintstones.length
end

p flintstones_hash
```

#### School answer
```ruby
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flintstones_hash = {}

flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end

p flintstones_hash
```

##### NOTES 
- I've opted for a basic looping structure (`Kernel#loop`) and an incrementing counter. 
  - The counter helped to identify each array elements by its index, and assign it as keys to a new has 
  - The `Array#index` built-in method helped to retrieve the index of each element in the array (also indentify with the counter as index) which is assigned as value to the keys. It works.
- The school solution, of course, finds a shorter and easier way to achieve the same result. 
  - It uses the `Array#each_with_index` buit-in method, which block takes two arguments: `element` and `index`. 
  - It creates an empty hash and uses hash index to assign each array elements as key and the values are easily assigned as part of the `each_with_index` method functionality.  

### Practice Problem 2

Add up all of the ages from the Munster family hash:

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
```

#### My answer

##### Rules / requirements
 - Given a hash
 - Which keys are strings
 - And values are integers
 - We are require to add up all values together

##### Examples
```ruby
# => 6174
```
#### Data Structure
- Hash as input
- Integer as output

#### Algorithm
1. Given `ages`, a hash of string as keys and integers as values
2. Select only the values from the hash
3. Add up all values
4. Return an integer


#### Code
```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
p ages.values.sum
```

##### NOTES 
- Two methods chained provide the solution to this problem
  - `Hahs#values` method retrieve only the values of a hash and return them in an array 
  - `Array#sum` method add up all the elements in an array and return them

#### Other solutions I
```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
values = 0

ages.each do |k, v|
  values += v
end

p values
```

#### Other solutions II
```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
elem_keys = ages.keys
counter = 0
values = 0

loop do
  break if counter == ages.length
  current_element = elem_keys[counter]
  current_value = ages[current_element]

  values += current_value

  counter += 1
end

p values
```

##### NOTES 
- Other solution I
  - Uses `each` method which block takes 2 args, key and value, so it's easy to add up all the values
- Other solution II
  - Uses a basic `loop` method. First stores the hash keys into an array and refers to hash keys and values using index (with a counter). Once we can access the values, it's easy to add them alll.


#### School answer
```ruby
ages.values.inject(:+) # => 6174
```

##### NOTES 
- Use of `Enumerable#inject` method. The strange-looking parameter to `inject` is simply a variety of the `inject` method which says "apply the `+` operator to the accumulator and object parameters of `inject`".
- Similar to my first answer

### Practice Problem 3

In the age hash:

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
```

remove people with age 100 and greater.

#### My answer

##### Rules / requirements
- Of a given hash, remove all key-value which value is greater or equal to 100

##### Examples
```ruby
# => ages_under_hundred = { "Herman" => 32, "Lily" => 30, "Eddie" => 10 }
```

#### Data Structure
- Hash as input
- New hash as output

#### Algorithm
1. Given the `ages` hash with strings as keys and integers as values
2. Select key-value pairs which value >= 100
3. Remove the selected pairs from hash
4. Return a new hash without the removed items

#### Code
```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages_under_hundred = ages.select {|k, v| v <= 100}

p ages_under_hundred == { "Herman" => 32, "Lily" => 30, "Eddie" => 10 }     # => true 
```

##### NOTES 
- Using `select` method we can easily select key-value pairs from a hash that meet certain criteria (return `true` to the method's block)
- In this case we've saved them in a new hash variable `ages_under_hundred` which is returned

#### Other solutions I
```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages_keys = ages.keys
counter = 0
ages_under_hundred = {}

loop do
  break if counter == ages_keys.length

  current_key = ages_keys[counter]
  current_value = ages[current_key]

  if curren_value <= 100
    ages_under_hundred[current_key] = current_value
  end

  counter += 1
end

p ages_under_hundred == { "Herman" => 32, "Lily" => 30, "Eddie" => 10 }     # => true 
```

##### NOTES 
- This problem can also be solved by using a basic `loop` structure

#### School answer
```ruby
ages.keep_if { |_, age| age < 100 }
```

##### NOTES 
- `Hash#keep_if` method deletes every key-value pair from hsh for which block evaluates to false
- `select` is equivalent to `keep_if` but returns nil if no changes were made
- Note the use of empty arg (`|_, age|`) when not used in the code at all...(there is no need to do `|name, age|`)

### Practice Problem 4

Pick out the minimum age from our current Munster family hash:

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
```

#### My answer

##### Rules / requirements
- Given a hash with strings as keys and integers as values
- Find a extract the key-value pair which value is the lowest of them all

##### Examples
```ruby
# => 'The minimum age is 10 and corresponds to Eddie'
```

#### Data Structure
- Hash as input
- Integer and string as output

#### Algorithm
1. Given the hash `ages` with strings as keys and integers as values
2. Select the key-value pair with lowest value
3. Return both data interpolated into a string

#### Code
```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
age = ages.values.min

puts "The minimum age from Munster family hash is #{age}"
```

### Practice Problem 5

In the array:

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```

Find the index of the first name that starts with "Be"

#### My answer

##### Rules / requirements
- Of a given array
- Find the index of the first element which two first characters index correspond to the string 'Be'

##### Examples
```ruby
# => 3
```

#### Data Structure
- Array of strings as input
- Integer as output

#### Algorithm
1. Given the `flintstones` array made of strings
2. Iterate over every element and
3. Find first element which two first index positions correspond to the chars 'Be'
4. Return the index number, within the arr, of the matching element  

#### Code
```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
counter = 0
index = nil

loop do
  current_element = flintstones[counter]
  first_char_in_element = current_element[0]
  second_char_in_element = current_element[1]

  if first_char_in_element == 'B' && second_char_in_element == 'e'
    index = flintstones.index(current_element)
    break
  end

  counter += 1
  break if counter == flintstones.length
end

p index == 3 # => true
```

##### NOTES 
- I resolved this problem with a simple `loop` and the use of index reference in the array and in the strings within the array
- Then a simple comparison of wanted chars `'B'` and `'e'` against the string char at index `0` and index `1` (two first chars in string) will identify the first string that meets the requirement
- Finally use 1Array#index1 method which returns the index of a certain element in an array
- After we find the first match, we output it and `break` out of the `loop`


#### School answer
```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.index {|name| name[0, 2] == 'Be'}
```

##### NOTES 
- The School solution takes advantage of the `Array#index` method which can be invoked with a block
- According to Ruby-Doc `If a block is given instead of an argument, returns the index of the first object for which the block returns true`
- The block check if any name's two indexes from index 0 (`name[0, 2]`) correponds with str `'Be'`. The index of first element in meeting this requirements is returned.

### Practice Problem 6

Amend this array so that the names are all shortened to just the first three characters:

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```

#### My answer

##### Rules / requirements
- Given an array of strings
- Shorten all strings to their first three characters
- Return a new array with the changes

##### Examples
```ruby
flintstones_shortened == %w(Fre Bar Wil Bet Bam Peb)    # => true
```

#### Data Structure
- Array of strings as input
- New array of strings as output

#### Algorithm
1. Given the `flintstones` array made of strings
2. Iterate over the collection
3. Shorten every element to their char index 0, 1 and 2 (remove all other chars from string)
4. Store the shortened elements in a new array `flintstones_shortened`
5. Return new array

#### Code
```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones_shortened = []

flintstones.map do |name|
  flintstones_shortened << name[0, 3]
end

p flintstones_shortened == %w(Fre Bar Wil Bet Bam Peb)    # => true
```

##### NOTES 
- I opted for `map` method, which allows to perform an operation in every element of a collection
- To refer to the firtst three chars in every element in the collection I've used the index reference `[index, length]` method, which indicates a starting index and a length of indexes to select

#### Other solutions I
```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones_shortened = []
counter = 0

loop do
  break if counter == flintstones.length

  current_element = flintstones[counter]
  first_char_in_name = current_element[0]
  second_char_in_name = current_element[1]
  third_char_in_name = current_element[2]
  element_shortened = first_char_in_name + second_char_in_name + third_char_in_name

  flintstones_shortened << element_shortened

  counter += 1

end

p flintstones_shortened == %w(Fre Bar Wil Bet Bam Peb)    # => true
```

##### NOTES 
- Alternative solution uses a simple `loop` method and index reference to indetify each element in the collection and to refer to the desire index chars of each element

#### School answer
```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.map! { |name| name[0, 3] }
```

##### NOTES 
- The school solution opted for a destructive version of `map` method, therefore there is no need to create a new collection and store the values after mutation (the mutation happens in place)

### Practice Problem 7

Create a hash that expresses the frequency with which each letter occurs in this string:

```ruby
statement = "The Flintstones Rock"
```

#### My answer

##### Rules / requirements
- Given a string
- Count the number of times each char is repeated
- Store the result in a hash where
- Keys are the chars in string
- Values are number of times each char is repeated

##### Examples
```ruby
{ "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }
```

#### Data Structure
- String as input
- Hash as output
  - Keys -> chars in string
  - Values -> number of repetitions of chars

#### Algorithm
1. Given `statement` string
2. Extract each unique char
3. Save these as keys in a hash
4. Count number times each unique char is repeated in string
5. Save these as values in the hash
6. Return the hash

#### Code
```ruby
statement = "The Flintstones Rock"
counter = 0
chars_in_str = {}
loop do
  
  current_char = statement[counter] 
  current_char = statement[counter + 1] if current_char == ' '

  if chars_in_str.include?(current_char)
    chars_in_str[current_char] += 1
  else
    chars_in_str[current_char] = 1
  end

  counter += 1
  break if counter == statement.length
end

p chars_in_str
```

##### NOTES 
- In this solution I opted for a simple `loop` and index reference with an incrementing `counter` to iterate over every character in the original string.
- By using an `if/else` statement, each character is added as `key` to a newly created hash with a `value` of `1`; if the character already exist in the hash as a `key`, the `value` is incrementing by 1
- Before the condition statement, I stated what's the current character and if this is a blank space, won't be considered

#### Other solutions I
```ruby
statement = "The Flintstones Rock"
statement_to_ary = statement.chars

count_chars = statement_to_ary.each_with_object(Hash.new(0)) do |char, hash|
  if char == ' '
    next
  else
  hash[char] += 1
  end
end

p count_chars
```

##### NOTES 
- This second code, uses a more rubyist solution. One of the common uses of Array#each_with_object method is to count the number of times each element is repeated in an array and return it as a hash, where the keys are the elements in the array and the values the number of times the element is repeated in the collection.
- The method's block includes an if/else statement to determine the valid characters (blank spaces are not considered)

#### School answer
```ruby
result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end
```

##### NOTES 
- The School uses a much more complex solution I think
- `letters = ('A'..'Z').to_a + ('a'..'z').to_a` creates an array with all letters from a to z in upper and lowercase
- Then it iterates over the letters array with `Array#each` method
- On each iteration it determines the number of times each letter appears in the given string. 
  - To do that it uses the `String#scan` method using the letter array as a pattern (`scan` iterates through a string looking for matches of a given pattern. Each match is added to an array)
  - And the `Array#count` method that counts the number of elements of an array (in this case, the array containing the letter pattern found in the given string)
  - The return from chainin these two methods is saved in a variable `frequency`
- Finally the frecuency is addedd as value to a hash which keys are each letter in the pattern  

### Practice Problem 8

What happens when we modify an array while we are iterating over it? What would be output by this code?

```ruby
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end
```

What would be output by this code?

```ruby
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
```

#### My (WRONG) answer

- In the first code, the method used in the block is not mutating. The output will be `1`, `2`, `3`, `4` in separate lines
- `Array#shift(n)` method returns a new array with the n elements of an array
- But the method is being called after the code outputs each element in the array
- The return value of this method will be the original collection unchanged (`[1, 2, 3, 4]`)

- In the second code, the method used in the block is not mutating. The output will be `1`, `2` and the return will be [3, 4]

##### NOTES 
- The first code will output `1`, `3` in separate lines and will return `[3, 4]`
- The second code will output `1`, `2` in separate lines and will return `[1, 2]`

- My mistake was not to consider that `each` is a sort of `loop`, 
- That loop uses the collection elements as reference to the indexes of themselves within the collection (instead of using a counter, like simple loops do) to iterate over the size of the collection. 
- So, in the example with `shift` method we are shortening the array at the same time that we are incrementing the index reference, so there is a moment where the loop breaks out as it has iterate all elements, according to the element indexes (in a simple loop this would be expressed as break if counter == array.size)
- In the example with the `pop` method we are doing the same but shortening the array from the end, instead of from the beginning.
- For better understanding see below a replica of the same method using a simple `loop`

```ruby
numbers = [1, 2, 3, 4]
counter = 0

loop do
  break if counter == numbers.size

  p numbers[counter]      # equivalent to p number in original code
  numbers.shift(1)      # removes the first element shifting all other elements down by one

  counter += 1
end
# => 1
# => 3
# => [3, 4] 
```

- For even further understanding, I've added some `puts` to the above code (*run this code for better understanding!*)

```ruby
numbers = [1, 2, 3, 4]
counter = 0

loop do
  break if counter == numbers.size

  current = numbers[counter]

  puts "=> We are now at iteration '#{counter}' (so going through index[#{counter}] of #{numbers})"
  puts "=> 'p number' outputs '#{current}' at this point (which is the element at index[#{counter}])"

  removed = numbers.shift(1)
  
  puts " "
  puts "=> After calling 'shift(1)', '#{removed}' gets removed from the collection"
  puts "=> and the elements left are #{numbers}"
  puts " "

  counter += 1
  puts "=> Then increment counter by 1, so we move to iteration '#{counter}'"
  puts " "
end

puts "=> At this point the counter(#{counter}) equals the size of the collection, so the loop breaks"
puts "=> and finally, the return value is #{numbers}"
```

- Check this shorter and explain answer out. Seen at the discussion forum:

```ruby
numbers = [1, 2, 3, 4]
process the first element
  p the_first_number # 1
  numbers.shift # array is now [2, 3, 4]
process the second element
  p the_second_number_in_array_as_it_now_is # 3
  numbers.shift # array is now [3, 4]
process the third element
  Oops. There is no third element
```

#### School answer
- The first code will output `1`, `3` in separate lines and will return `[3, 4]`
- The second code will output `1`, `2` in separate lines and will return `[1, 2]`

##### NOTES 
- To better understand what is happening in the first example, we augment our loop with some additional "debugging" information:

```ruby
numbers = [1, 2, 3, 4]
numbers.each_with_index do |number, index|
  p "#{index}  #{numbers.inspect}  #{number}"
  numbers.shift(1)
end
```

- The ouput is:

```ruby
"0  [1, 2, 3, 4]  1"
"1  [2, 3, 4]  3"
# => [3, 4]
```

- From this we see that the array is being changed in place (shortened and shifted) and the loop counter used by `each` is compared against the current length of the array rather that its original length.
- The removal of the first item in the first iteration changes the value the method iterates over in the second iteration.
- This change in the original collection changes the value found in every iteration
- This demonstrate that the iterator DO NOT work on a copy of the original array but on the original array in real time (so modified)

- We can try the same with the second example:

```ruby
numbers = [1, 2, 3, 4]
numbers.each_with_index do |number, index|
  p "#{index}  #{numbers.inspect}  #{number}"
  numbers.pop(1)
end
```

- The ouput is:

```ruby
"0  [1, 2, 3, 4]  1"
"1  [1, 2, 3]  2"
# => [1, 2]
```

- Here we are shortening the array at each iteration but the items removed are beyond the point we are sampling from in the abreviated loop. 
- Same as the previous example, the iterator DO NOT work on a copy of the original array but on the original array in real time (so modified).

### Practice Problem 9

As we have seen previously we can use some built-in string methods to change the case of a string. A notably missing method is something provided in Rails, but not in Ruby itself...`titleize`. This method in Ruby on Rails creates a string that has each word capitalized as it would be in a title. For example, the string:

```ruby
words = "the flintstones rock"
```

would be

```ruby
words = "The Flintstones Rock"
```

Write your own version of the rails titleize implementation.

#### My answer

##### Rules / requirements
- Write a method
- Pass in a string as argument
- Capitalize the first character of each word in string
- Return the new version of the entered string

##### Examples
*Given in the problem description*

#### Data Structure
- String as input
- String as output

#### Algorithm
1. Define a method `titleize`
2. Method takes a string as argument
3. Capitalize the first character of each word in string
  - Capitalize --> Change from lowercase to uppercase (upcase method)
  - First character of a word --> char at index 0
  - Words in string --> substrings, blocks of chars separated by a blank space
4. Save resulting string in new string object
5. Return the resulting string

#### Code
```ruby
words = "the flintstones rock"
words_arr = words.split

words_arr.map do |word|
  word[0] = word[0].upcase
end

capitalized_words = words_arr.join(' ')
p capitalized_words == "The Flintstones Rock"     # => true
```

##### NOTES 
- Use of `Array#map` method to iterate over an array of words in the original string (previously the string collection was converted into an array with `String#split` method)
- Inside the method, the block reassings the 0 index char of every word to its capitalized version
- Finally, we transform the array collection back into a string with `Array#join` (the `(' ')` separator indicates that there is a space between each element)

#### Other solutions I
```ruby
words = "the flintstones rock"

words_arr = words.split
counter = 0

loop do
  words_arr[counter][0] = words_arr[counter][0].upcase
  counter += 1
  break if counter == words_arr.length
end

capitalized_words = words_arr.join(' ')
p capitalized_words == "The Flintstones Rock"   # => true
```

##### NOTES 
- Similar to solution 1, but in this case I use a simple `loop` to iterate over the original collection.
- `Strin#split`, `Array#join` and object reassignment are used in the same way as previous example

#### School answer
```ruby
words.split.map { |word| word.capitalize }.join(' ')
```

##### NOTES 
- There is an specific `String#capitalize` method that returns a copy of str with first char converted to uppercase and the remainder to lowercase
- In this case, several methods are chained together to obtain the final result

### Practice Problem 10

Given the `munsters` hash below

```ruby
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
```

Modify the hash such that each member of the Munster family has an additional "age_group" key that has one of three values describing the age group the family member is in (kid, adult, or senior). Your solution should produce the hash below

```ruby
{ "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }
```

Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.

#### My answer

##### Rules / requirements
- Given a hash of hashes where the keys are people and the values are attributes to these people
- Add a new hash to each key
- The new sub hash will have `"age_group"` as key and the age group of each person as value
- There are three possible categories as values: kid (0-17 years old), adult(18-64 years old) or senior(65+ years old)
- The categories should be produced automatically according to the age key in the hash

##### Examples
*Given in the problem description*

#### Data Structure
- Hash of hashes as input
- Hash of hashes as output

#### Algorithm
1. Given the `munster` hash of hash where
  - each `key` --> person name
  - each `value` --> hash that has as `key` --> person attribute and as `value` --> value of that attribute
2. Add new key-value pair to each names `key`
  - new `key` --> `age_group`
  - value for that `key` --> age group that each person belong to
  - the `age_group` values should be produced automatically, based on the person's `age` key
  - age groups are
    - kids - from 0 to 17 years old, both included (age >= 0 and age <= 17)
    - adult - from 18 to 65 years old, both included (age >= 18 and age <= 65)
    - senior - more that 65 years old (age > 65)
3. Return the `munster` hash modified

#### Code
```ruby
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
names_arr = munsters.keys                         # => ["Herman, "Lily", "Grandpa", "Eddie", "Marilyn"]
counter = 0

loop do
  break if counter == munsters.length
                                                  # => //When counter == 0//
  current_name = names_arr[counter]               # => "Herman"   
  current_attributes = munsters[current_name]     # => "age" => 32, "gender" => "male" 
  
  attributes_arr = current_attributes.keys        # => ["age", "gender"]
  
  age = attributes_arr[0]                         # => "age" 
  current_age = current_attributes[age]           # => 32
  
  if current_age >= 0 && current_age <= 17
    munsters[current_name]["age_group"] = "kid"

  elsif current_age >= 18 && current_age <= 65
    munsters[current_name]["age_group"] = "adult"

  else
    munsters[current_name]["age_group"] = "senior"
  end    
  
  counter += 1
end

p munsters
```

##### NOTES 
- This solution uses a beautiful simple `loop` and several hash to array convertions (`Hash#keys` method) and index references (with the help of a counter) to obtain the value we want to check: the people's `age`.
- Once we have access to the `age`, we create a new key `age_group` in each people's hash (inner hash) and we use an `if/elsif/else` statement to determine, according to the `age`, what value this key receives (`kid`, `adult` or `senior`)

#### Other solutions I

The following code substitutes the `if/elsif/else` chunk of code of the previous solution

```ruby
  case current_age
    when (0..17) then munsters[current_name]["age_group"] = "kid"
    when (18..65) then munsters[current_name]["age_group"] = "adult"
    else munsters[current_name]["age_group"] = "senior"  
  end
```

##### NOTES 
- After looking at the *hint* provided, I implemented a `case` statement instead of the `if/elsif/else` and also used `Range` objects for the age groups

#### School answer
```ruby
munsters.each do |name, details|
  case details["age"]
  when 0...18
    details["age_group"] = "kid"
  when 18...65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end
```

##### NOTES 
- Of course, the School provided a more rubyist solution that uses `each` method
- I tried with this method too, but didn't manage to find a solution. My try used a double each method, to get to the inner hash and I managed to obtain the age values, but couldn't find a way to create a new key-value pair
- The closer I got was:

```ruby
munsters.each do |name, attributes|
  attributes.each do |attribute, value|
    p value
    # if value >= 0 && value <= 17
    #   key["age_group"] = "kid"
    # elsif value >= 18 && value <= 65
    #   key["age_group"] = "adult"
    # else
    #   key["age_group"] = "senior"
    # end
  end
end
```

- Now I realise how close I was to the solution
- The double each is not needed of course!
- See this:

```ruby
munsters.each do |name, attributes|
  # p attributes["age"]
  if attributes["age"] >= 0 && attributes["age"] <= 17
    attributes["age_group"] = "kid"
  elsif attributes["age"] >= 18 && attributes["age"] <= 65
    attributes["age_group"] = "adult"
  else
    attributes["age_group"] = "senior"
  end
end
```

- I can refer to one of the keys in the sub-hash by calling it in [] with its name —–i.e attributes["age"]
- Then, after checking with the if/else statement the values of the age attribute, I could have created a new key-value pair by naming it as part of the attributes hash —–i.e attributes["age_group"] = "kid" (or adult or senior)
