## Practice Problems: 
### *Sorting, Nested Collections and Working with Blocks*

### Practice Problem 1

How would you order this array of number strings by descending numeric value?

```ruby
arr = ['10', '11', '9', '7', '8']
```

#### My answer
```ruby
sorted_arr = arr.sort do |a, b|
  b.to_i <=> a.to_i
end

p sorted_arr
```

##### NOTES 
- We have to convert the elements from strings to integers with `#to_i` otherwise, the `#sort` method does not work
- Also, we have to call `#sort` with a block and two variables as parameters (`a` and `b` in this case), so we can indicate the order is descendind with `b <=> a`

### Practice Problem 2

How would you order this array of hashes based on the year of publication of each book, from the earliest to the latest?

```ruby
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]
```

#### My answer

```ruby
sorted_by_year = books.sort_by do |hash|
  hash[:published]
end

p sorted_by_year
```

##### NOTES 
- We use `sort_by` and the element reference method `Hash#[]` to refer to the key-value pair we want to sort the collection by
- Here we can use the reference method to refer to the key `published` as `hash[:published]`
- The return value of the block it's what determines the order of the sorting operation
- `sort_by` always sort in ascending order 

#### School answer

```ruby
books.sort_by do |book|
  book[:published]
end
```

##### NOTES 
- We can use `sort_by` and access a particular value in each hash by which to sort, as long as those values have a `<=>` method.
- In this case, all the values for `:published` are strings so we know that we can compare them. Since all the values in question are four characters in length, in this case we can simply compare the strings without having to convert them to integers.

### Practice Problem 3

For each of these collection objects demonstrate how you would reference the letter 'g'.

```ruby
arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

arr3 = [['abc'], ['def'], {third: ['ghi']}]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
```

#### My answer

```ruby
arr1[2][1][3]
arr2[1][:third][0]
arr3[2][:third][0][0]
hsh1['b'][1]
hsh2[:third].keys.join
```

##### NOTES 
1. We reference element at index 2 `['c', ['d', 'e', 'f', 'g']]` then element at index 1 `['d', 'e', 'f', 'g']` then element at index 3 `'g'`
2. We reference at element at index 1 `{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}` then we use key reference `[:third]` and element at index 0 `'g'`
3. We reference at element at index 2 `{third: ['ghi']}` then at key reference `[:third]` and then `[0][0]` to reference the first char `'g'` of element at index 0 `['ghi']`
4. We use key reference `['b']` element at index 1 of `['f', 'g']` is `'g'`
5. We use key reference `[:third]` and then we extract the key with `Hash#keys` method and convert the resulting array to string with `Array#join` method

#### School answer
```ruby
hsh2[:third].key(0) # => "g"

hsh2[:third].keys[0] # => 'g'
```

##### NOTES 
- The `Hash#key` method returns the key of an occurrence of a given value.
- Although they looks very similar, `Hash#key` and `Hash#keys` are actually two completely different methods. 
- `Hash#key` returns a single key based on a value passed to the method. 
- `Hash#keys` returns an array of all the keys in the hash, and the `[0]` is then referencing the object at index 0 of that returned array.

### Practice Problem 4

For each of these collection objects where the value 3 occurs, demonstrate how you would change this to 4.

```ruby
arr1 = [1, [2, 3], 4]
arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
hsh1 = {first: [1, 2, [3]]}
hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
```

#### My answer
```ruby
arr1[1][1] = 4
arr2[2] = 4
hsh1[:first][2] = [4]
hsh2[['a']][:a][2] = 4
```

##### NOTES 
1. Reference element at index 1 `[2, 3]` and then again element at index 1 `3` and reassign it to `4` with assignment operator `=`
2. Reference element at index 2 `3` and reassign it to `4` with assignment operator `=`
3. Reference key `[:first]` and element at index 2 `[3]` and reassign it to `[4]` with assignment operator `=`
4. Reference key `[['a']]` and again key `[:a]` and element at index 2 `3` and reassign it to `4` with assignment operator `=`

#### School answer
```ruby
hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2][0] = 4
hsh1 # => {:first=>[1, 2, [4]]}
```

##### NOTES 
- In the last example the key for the first item in the outer hash is actually an array containing a single string object `["a"]`. 
- Although this is unusual, it is important to remember that both hash keys and values can be any Ruby object.

### Practice Problem 5

Given this nested Hash:

```ruby
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
```

figure out the total age of just the male members of the family.

#### My answer
```ruby
total_age = 0
munsters.select {|name, values| values["gender"] == "male"}.each {|name, values| total_age += values["age"]}
p total_age
```

#### Alternative answer
```ruby
total_age = 0

males_members = munsters.select do |name, values|
  values["gender"] == "male"
end

males_members.each do |name, values|
  total_age += values["age"]
end

p total_age
```

##### NOTES 
- The first and more rubyist solution chains two methods `#select` and `#each`. 
- `#each` uses the return value from `#select`
- The second solution uses the same two methods but separately. The return of `#select` is stored in a variables and that variable is used as caller for `#each` method
- A `total_age` variable is created in the outer scope to store the sum of the ages

#### School answer
```ruby
total_male_age = 0
munsters.each_value do |details|
  total_male_age += details["age"] if details["gender"] == "male"
end

total_male_age # => 444
```

##### NOTES 

- In this example, within each key-value pair in the outer hash the value is itself a hash. When iterating through the outer hash, we need to access two values from each inner hash.
- Since we're not referencing the key (each family member's name) from the key-value pairs in the outer hash, we can use `Hash#each_value` with a single block parameter.

### Practice Problem 6

One of the most frequently used real-world string properties is that of "string substitution", where we take a hard-coded string and modify it with various parameters from our program.

Given this previously seen family hash, print out the name, age and gender of each family member:

```ruby
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
```

...like this:

```ruby
(Name) is a (age)-year-old (male or female).
```

#### My answer
```ruby
munsters.each do |name, attributes|
  puts "#{name} is a #{attributes["age"]}-year-old #{attributes["gender"]}"
end
```

##### NOTES 
- To access the nested hash we use two variable parameters `name` and `attributes`
- To access the nested hash referenced by `attributes` we use key reference `attributes[key_name]`
- We print all the info out to screen with string interpolation `#{}`

#### School answer
```ruby
munsters.each_pair do |name, details|
  puts "#{name} is a #{details['age']} year old #{details['gender']}"
end
```

##### NOTES 
- In this case we need to access both the key (each family member's name) and the value (the inner hashes containing the details), so we need to use `Hash#each_pair` or `Hash#each` with two block parameters.

### Practice Problem 7

Given this code, what would be the final values of `a` and `b`? Try to work this out without running the code.

```ruby
a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a
```

#### My (worng) answer
- The final values of `a` and `b` would be:

```ruby
a = 4
b = [1, 8]
```

##### NOTES 
- I wrongly assumed we were mutating the variables `a` and `b` by referrencing them as elements in arr
- Of course! We are just re-assigning the value of the arr elements, but not mutating the original variables

#### School answer
```ruby
a # => 2
b # => [3, 8]
```

##### NOTES 
- The value of `a` didn't change because we are not referencing `a` at any point. This code `arr[0] += 2` modifies the array, `arr` not `a` 
- In effect we are assigning a new object at that index of the array so that instead of `arr[0]` containing `a` it now contains `4`
- The value of `b` did change because `b` is an array and we are modifying that array by assigning a new value at index 0 of that array

### Practice Problem 8

Using the `each` method, write some code to output all of the vowels from the strings.

```ruby
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
```

#### My (worng) answer
```ruby
vowels = %w[a e i o u]

hsh.each do |_, arr|
  arr.each do |str|
    letters = str.chars
    if vowels.include?(letters)
      puts letters
    end 
  end
end
```

##### NOTES 
- My solution does not output anything
- I tried accessing each key-value pair with an outer `each`
- Then tried accessing each value array with an inner `each`
- Finally I tried to operate with the arrays, extracting each character with `chars` and comparing with vowels with `include?`

#### School answer
```ruby
vowels = 'aeiou'

hsh.each do |_, value|
  value.each do |str|
    str.chars.each do |char|
      puts char if vowels.include?(char)
    end
  end
end
```

##### NOTES 
- The key here is to first iterate through the hash to access the values (the arrays) and then iterate through each array to access each string. This is done by using two level `#each` methods.
- At this point `String#chars` can be called within the block to return an array of characters for that string in that iteration, this array of characters can itself then be iterated through and `puts` called if on its iteration the character meets a condition (in this case that it is present in the `vowels` variable).
- Note that we used `each` here, which means each iteration has an argument for a key and one for the value. Since we don't care about the key, we just use `_` to signify that this is an argument that we aren't going to use. We could also have used `Hash#values` as well.

### Practice Problem 9

Given this data structure, return a new array of the same structure but with the sub arrays being ordered (alphabetically or numerically as appropriate) in descending order.

```ruby
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
```

#### My answer
```ruby
sorted_arr = arr.each do |subarr|
  subarr.sort! { |a, b| b <=> a }
end

p sorted_arr # => [["c", "b", "a"], [3, 2, 1], ["green", "blue", "black"]]
```

##### NOTES 
- Firstly we use `each` method to access each sub-array of `arr`
- Then we can use `sort` with two parameters, `a` and `b` and the block giving order preference to `b` over `a` to order in descending order

#### School answer
```ruby
arr.map do |sub_arr|
  sub_arr.sort do |a, b|
    b <=> a
  end
end
```

##### NOTES 
- From the problem description we know that we need to return a new array but with the items in it transformed in some way, so `map` should hopefully be a fairly obvious choice for the initial method to call on the array.
- We also know that we want each sub-array to be ordered, so within the block that we pass to `map` we can call `sort` on the sub-array for that iteration. Since we want the sub-arrays sorted in reverse order we need to call it with a block, within which we change the order of `a` and `b`.

### Practice Problem 10

Given the following data structure and without modifying the original array, use the `map` method to return a new array identical in structure to the original but where the value of each integer is incremented by `1`.

```ruby
[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
```

#### My answer
```ruby
arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

new_arr = arr.each do |hsh|
  hsh.map do |k, v|
    hsh[k] += 1
  end
end

p new_arr # => [{:a=>2}, {:b=>3, :c=>4}, {:d=>5, :e=>6, :f=>7}]
```

##### NOTES 
- I got to a partial solution where the original array gets modified, which is not what is requested
- We can see how the original array `arr` and the newly created array `new_arr` are the same object with `arr.object_id` and `new_arr.object_id`

#### School answer
```ruby
[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
  incremented_hash = {}
  hsh.each do |key, value|
    incremented_hash[key] = value + 1
  end
  incremented_hash
end
```

##### NOTES 
- Here `map` is iterating through the array. On each iteration it is creating a new hash (`incremented_hash`) and then iterating through the `hsh` object for that iteration in order to add key-value pairs to this hash using the original keys but values incremented by `1`. 
- The outer block then returns this `incremented_hash` to `map` which uses it to transform each element in the array.

### Practice Problem 11

Given the following data structure use a combination of methods, including either the `select` or `reject` method, to return a new array identical in structure to the original but containing only the integers that are multiples of `3`.

```ruby
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
```

#### My answer
```ruby
arr.map do |sub_arr|
  sub_arr.select do |num|
    num % 3 == 0
  end
end
# => [[], [3], [9], [15]]
```

##### NOTES 
- First I use map to iterate over the original collection `arr`
- Then I use `select` to return a new collection which elements return true to the `%` method

### Practice Problem 12

Given the following data structure, and without using the `Array#to_h` method, write some code that will return a hash where the key is the first item in each sub array and the value is the second item.

```ruby
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}
```

#### My answer
```ruby
arr.each_with_object({}) do |pair, hash|
  hash[pair[0]] = pair[1]
end
```

#### Alternative answer
```ruby
hsh = {}
arr.each do |key, value|
  hsh[key] = value
end
p hsh
```

##### NOTES 
- Both solutions provide the same correct result.
- The first solution reduces the number of steps and does not require to create and output an empty hash to store the result, but this is created inside the `each_with_object` method

#### School answer
```ruby
hsh = {}
arr.each do |item|
  hsh[item[0]] = item[1]
end
hsh # => {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}
```

##### NOTES 
- Although this task may at first seem complicated because the collection contains different object types, sometimes nested three levels deep, you only really have to work at the initial sub-level in order to reach a solution. 
- Remember that any Ruby object can be a hash key and any Ruby object can be a hash value.

### Practice Problem 13

Given the following data structure, return a new array containing the same sub-arrays as the original but ordered logically by only taking into consideration the odd numbers they contain.

```ruby
arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
```

The sorted array should look like this:

```ruby
[[1, 8, 3], [1, 6, 7], [1, 4, 9]]
```

#### My answer
```ruby
arr.sort_by do |element|
  element[2]
end
```

##### NOTES 
- My solution sort the given arr based on element at index 2.
- It works just because the other odd element, stores at index 0, is already sorted, so the solution isn't good 
- I am not sorting by odd elements, but by element at index 2

#### School answer
```ruby
arr.sort_by do |sub_arr|
  sub_arr.select do |num|
    num.odd?
  end
end
```

##### NOTES 
- Since the sub-arrays are compared in an 'element-wise' manner when being sorted, when looking at the first element of each they are all equal. If we were to include the second element of each (the even integers) in our comparison the order would be different, since `4` is less than `6`, which is less than `8`.
- By performing selection on the sub-arrays that we are comparing, we can compare them based on the value of the odd integers alone.

### Practice Problem 14

Given this data structure write some code to return an array containing the colors of the fruits and the sizes of the vegetables. The sizes should be uppercase and the colors should be capitalized.

```ruby
hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}
```

The return value should look like this:

```ruby
[["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]
```

#### My (wrong) answer
```ruby
new_hsh = hsh.map do |_, data|
  if data[:type] == 'vegetable'
    data[:size].upcase
  elsif data[:type] == 'fruit'
    data.map do |item|
      item[:colors].capitalize
    end
  end
end
```

##### NOTES 
- First, to iterate over the collection and produce a new array I used `map` method
- Then I used an if/elsif conditional statement to access each nested collection according to their type 
- I managed to access and mutate the `size` in the `if` branch with `upcase`
- but I couldn't access and mutate the `colors` in the `elsif` branch, as some of their values were in an arrays, and `capitalize` is a string method, not an array method

#### School answer
```ruby
hsh.map do |_, value|
  if value[:type] == 'fruit'
    value[:colors].map do |color|
      color.capitalize
    end
  elsif value[:type] == 'vegetable'
    value[:size].upcase
  end
end
# => [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]
```

##### NOTES 
- From the problem description we know that we want to return an array where each item in the outer hash is represented by a particular value from within each nested hash, so `map` is a good choice of method to call on the initial `hsh` object.
- Since the value to be returned to `map` by the outer block depends on whether `:type` equates to `fruit` or `vegetable`, we need to use a conditional statement to determine what is returned and what other actions are performed on those values prior to them being returned by the outer block.
- The situation for `:colors` is complicated slightly in that we want to call `capitalize` on the strings but they are nested within arrays so we need to iterate through those arrays in order to access them.
- In this case we can iterate, with a second `map` method, through the elements stored at the key `[:colors]`, so THAT key is the caller of the method `sub_hash[:colors].map |color|`

### Practice Problem 15

Given this data structure write some code to return an array which contains only the hashes where all the integers are even.

```ruby
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]
```

#### My (wrong) answer
```ruby
new_arr = arr.map do |hsh|
  hsh.select do |keys, values|
    values.all? { |value| value.even?}
  end
end

p new_arr # => [{}, {:b=>[2, 4, 6], :d=>[4]}, {:e=>[8], :f=>[6, 10]}]
```

##### NOTES 
- This solution is not correct because it returns all key-value pairs, where the values are even, but the problem requires the hashes where all the integers are even
- To get to my solution I used the `map` method in the outermost array
- Then I used `select` method in each sub hash and select only those sub hashes which `all` values are `even` 

#### School answer
```ruby
arr.select do |hsh|
  hsh.all? do |_, value|
    value.all? do |num|
      num.even?
    end
  end
end
# => [{:e=>[8], :f=>[6, 10]}]
```

##### NOTES 
- From the problem description it is clear that we will need to return a subset of the objects in the outer array, so `select` should hopefully be a fairly obvious method choice to call on that array. The key is then to figure out how to carry out the selection.
- Since `select` will return all the elements for which the block returns `true` and we only want hashes where all the integers are even, `all?` combined with `even?` is a good choice here. The situation is complicated slightly by the fact that the integers are further nested inside the inner arrays, so we need to iterate through these first.
- If all of the integers in an inner array are even then the inner block returns `true` to the innermost call to `all?`. If all of the inner blocks for a particular hash return `true` then the middle block returns `true` to the outer call to `all?` which in turn causes the outer block to return `true` to the `select` method for that iteration.

### Practice Problem 16

A UUID is a type of identifier often used as a way to uniquely identify items...which may not all be created by the same system. That is, without any form of synchronization, two or more separate computer systems can create new items and label them with a UUID with no significant chance of stepping on each other's toes.

It accomplishes this feat through massive randomization. The number of possible UUID values is approximately 3.4 X 10E38.

Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.

It looks like this: `"f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"`

Write a method that returns one UUID when called with no parameters.

#### My answer
```ruby
def generate_random_section(index, length)
  uuid = [[], [], [], [], []]
  valid_chars = *('a'..'z'), *(0..9)
  counter = 0
  loop do
    break if counter == length
    random_char = valid_chars[rand(valid_chars.size)]
    uuid[index] << random_char
    counter += 1
  end
  uuid[index] = uuid[index].join
end

def uuid_generator
  uuid = []
  uuid[0] = generate_random_section(0, 8)
  uuid[1] = generate_random_section(1, 4)
  uuid[2] = generate_random_section(2, 4)
  uuid[3] = generate_random_section(3, 4)
  uuid[4] = generate_random_section(4, 12)
  p uuid.join('-')
end

uuid_generator
```

##### NOTES 
- My solution does the job combining two different defined methods: `generate_random_section` to generate sections of random characters and `uuid_generator` to pass in to the first method two arguments (`length` and `index`) to specify the length of the section and its position (`index`) in the final array.
- The last step consist of joining all array elements separated by hyphen (`-`) into a string
- My solution lacks the use of recursive methods like `each`, `map`, etc. which is the focus of the current lesson.
- Also, the problem statement spefifies to write a method and I wrote two methods.

#### School answer
```ruby
def generate_UUID
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end

  uuid
end
```

##### NOTES 
- The key to this solution is having the `sections` array containing integers representing the number of characters in each section. During each iteration through the array, within the block we can call the `times` method on the integer for that iteration and thus build up the UUID character by character.
- This is just one possible solution to the problem, and yours may be different. However you solved it though, you will most likely have needed to use one or more iterative methods.

- Notice the use of `sample` method to obtain a random element from an array. In my solution I use `rand` which only works with integers, so I have to refer to the size of the array to pick a random number from it and use it as index reference in the array. With `sample` the job is simpler. 
