##  Examples of ITERATION, SELECTION and TRANSFORMATION in collections
**from Lesson4: Ruby collections > 7.Selection and Transformation**

==================================================================

### Example 1: Looping to select

In the example below, we want to select all 'g' characters out of a string. 

```ruby
alphabet = 'abcdefghijklmnopqrstuvwxyz'
```

#### My answer

##### Rules / requirements
- Iterate over a string
- Select all characters that are equal to 'g'
- Return a new string with the result

##### Examples
```ruby
alphabet = 'abcdefghijklmnopqrstuvwxyz' # => letter = 'g'
```

#### Data Structure
- String as input
- String as output

#### Algorithm
1. Create a loop 
2. Iterate over the size of given string
3. Select chars that correspond with 'g'
4. Add these chars into a new string
5. Return the new string

#### Code
```ruby
alphabet = 'abcdefghijklmnopqrstuvwxyz' # => letter = 'g'

chars = ''
counter = 0

loop do
  chars << alphabet[counter] if alphabet[counter] == 'g'
  break if counter == alphabet.size
  counter += 1
end

p chars
```

##### NOTES 
- Note how
  ```ruby
  char << alphabet[counter] if alphabet[counter] == 'g'
  ```
- is short for
```ruby
  current_char = alphabet[counter]
    if current_char == 'g'
      chars << current_char
    end
  ```

- The if condition is the selection criteria: it determines which values are selected and wich ones are ignored.

==================================================================

### Example 2: Looping to transform

Loop through the following array and append an 's' to each string in the array.

```ruby
fruits = ['apple', 'banana', 'pear']
```

#### My answer

##### Rules / requirements
- Write a loop
- Iterate over an array of strings
- Append an 's' to each string
  - Append means add at the end
- Return a new array  

##### Examples
```ruby
fruits = ['apple', 'banana', 'pear'] # => new_fruits = ['apples', 'bananas', 'pears']
```

#### Data Structure
- Array of strings as input
- Array of strings as output

#### Algorithm
1. Write a simple loop
2. Iterate over an array of strings
  - Create a counter
  - Create a new collection new_fruits
  - Access each element by index --> use counter as index
  - Append a 's' char to each element --> use +
3. Return resulting array

#### Code
```ruby
fruits = ['apple', 'banana', 'pear'] 
new_fruits = []
counter = 0

loop do
  break if counter == fruits.size
  new_fruits << fruits[counter] + 's'
  counter += 1
end

p new_fruits
```

##### NOTES 

- Since we're applying the transformation to every element in the array, we don't need an if condition, but the entire line is the transformation criteria.
- In this example, we perform the transformation on a new array and leave the original array unchanged. 
- **When performing transformation, it's always important to pay attention to whether the original collection was mutated or if a new collection was returned.**

==================================================================

### Example 3: Extracting iteration to methods

Say for example we wanted to be able to select all of the vowels in a given string. We're going to use the helpful `String#include?` method here to assist us in determining whether a character is a vowel.

#### My answer

##### Rules / requirements
- Write a method
- Method takes one argument
- Argument is a string
- Iterate over the string
- Select all vowels
- Return them in a new string

##### Examples
```ruby
string = "HELLO good morning, how are you?" # => 'EOoooioaeou'
```
#### Data Structure
- String as input
- String as output

#### Algorithm
1. Define a method find_vowels
2. Method takes in a string as argument
3. Iterate over the string
  - Counter
  - Break if counter reaches the end of string
  - Use indexes to access each char in string. Index can be determined by counter
  - Select all vowels os string  
    - vowels are all characters that are included in the following string: 'AEIOUaeiou'
  - Store all coincidences in a new string 
5. Return a new string containing all vowels of given string

#### Code
```ruby
def find_vowels(string)
  vowels_in_string = ''
  counter = 0

  loop do
    current_char = string[counter]

    if "AEIOUaeiou".include? current_char
      vowels_in_string << current_char 
    end

    counter += 1
    break if counter == string.size
  end

  vowels_in_string
end
```

##### NOTES 
- Initially I tried the include? method as `if current_char.include? "AEIOUaeiou"` which is wrong, the caller must be `vowels` and the char to find (`other string` according to the method documentation) is the `current_char` (we need to check if `current_char` is a `vowel`)
- Note that we can chain a method to the result of the `find_vowels` method, like `num_vowels = find_vowels(string).size`

==================================================================

### Example 4: Example with hashes 

Of the given hash, we want to select the key-value pairs where the value is `'Fruit'`

```ruby
produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
```

##### HINT 
- Remember that you have to loop through the keys in order to access the values
- Notice that the return value of the method is a hash

#### My answer

##### Rules / requirements
- Implement a method
- Method takes one argument
- Argument is a hash
- Select the key-value where value equals 'Fruit'
- Store them in a new hash
- Return the new hash

##### Examples
*Given in the problem description*

#### Data Structure
- Hash as imput
- Array to temporarily store keys
- Hash as output

#### Algorithm
1. Define a method `select_fruit`
2. Method takes a hash as argument
3. Method iterates over the collection (key-value pairs)
4. Iteration needs
  - Counter
  - New empty array to temp store keys
  - Indexes to keys and to values
  - Increment the counter
  - If statement to select the desired items
    - Key-values which value correspond to 'Fruit'
  - Save selected items to new hash
5. Return new hash    

#### Code
```ruby
def select_fruit(produce_hash)
  counter = 0
  temp_key_storage = produce_hash.keys
  selected_fruits = {}

  loop do
    break if counter == temp_key_storage.size

    current_key = temp_key_storage[counter]
    current_value = produce_hash[current_key]

    if current_value == 'Fruit'
      selected_fruits[current_key] = current_value
    end

    counter += 1
  end
  selected_fruits

end
```

##### NOTES 
- The original argument, produce_list, is not mutated
- A new hash is returned by the method (as opposed to an array or string)

==================================================================

### Example 5: Example where the entire transformation code is within a method definition

Write a code that multiplies each element in a collection by 2.

```ruby
my_numbers = [1, 4, 3, 7, 2, 6]
double_numbers(my_numbers) # => [2, 8, 6, 14, 4, 12]
```

#### My answer

##### Rules / requirements
- Implement a method
- Method takes one argument
- Argument is an array of integers
- Multiply each element in the array by 2
- Return a new array

##### Examples
*Given in the problem description*

#### Data Structure
- Array of integers as input
- Array of integers as output

#### Algorithm
1. Define `double_numbers` method
2. Method takes an array of integers as argument
3. Iterate over the array
  - Counter
  - New empty array
  - Index accessing
  - Incrementing counter
4. Multiply each element by 2
5. Store the result in a new array
6. Return the new array

#### Code
```ruby
def double_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    doubled_numbers << current_number * 2

    counter += 1
  end
  doubled_numbers

end
```

##### NOTES 
- The return value of `double_numbers` method is a new array `doubled_numbers` 
- The original `my_numbers` is not mutated
- This is a consequence of how we implemented the method

==================================================================

### Example 6: Same exercise as example 5 but now the method mutates the argument

Write a code that multiplies each element in a collection by 2 in place (mutates the original argument)

```ruby
my_numbers = [1, 4, 3, 7, 2, 6]
double_numbers(my_numbers) # => [2, 8, 6, 14, 4, 12]
my_numbers # => [2, 8, 6, 14, 4, 12]
```

#### My answer

#### Code
```ruby
def double_numbers(numbers)
  counter = 0

  loop do
    break if counter == numbers.size
    numbers[counter] = numbers[counter] * 2
    counter += 1
  end

  numbers
end
```

##### NOTES 
- Rather than returning a new array (there is no new array created), this method returns a reference to the (mutated) original array
- The mutating line can be reduced to `numbers[counter] *= 2`

==================================================================

### Example 7: Method that only transform a subset of elements in a collection

Write a code that multiplies each element in a collection by 2 if the value is odd. 

```ruby
my_numbers = [1, 4, 3, 7, 2, 6]
double_odd_numbers(my_numbers)  # => [2, 4, 6, 14, 2, 6]

# not mutated
my_numbers                      # => [1, 4, 3, 7, 2, 6]
```

#### My answer

##### Rules / requirements
- Write a method 
- Method takes an array of integers
- Select odd values in array
- Multiply these values by 2
- Return a new array with the new values

##### Examples
*Given in the problem description*

#### Data Structure
- Array of integers as input
- Array of integers as output

#### Algorithm
1. Implement a method `double_odd_numbers`
2. Method takes in an array of integers as argument
3. Iterate over the array elements
4. Identify those that are odd
5. Store them in a new array
6. Return the new array

#### Code
```ruby
def double_odd_numbers(numbers)
  counter = 0
  doubled_odd_numbers = []

  loop do
    break if counter == numbers.size

    current_position = numbers[counter]

    if current_position.odd?
      doubled_odd_numbers << current_position * 2
    else
      doubled_odd_numbers << current_position
    end

    counter += 1
  end
  doubled_odd_numbers

end
```

#### School answer
```ruby
def double_odd_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if current_number.odd?
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end
```

==================================================================

### Example 8: Similar to example 7 but transform base on position rather than on value

What if we wanted to transform the numbers of previous example based on their position in the array rather than their value?
Try coding a solution that doubles the numbers that have odd indices.

#### Code
```ruby
def double_odd_indices(numbers)
  counter = 0
  doubled_odd_indices = []

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if counter.odd?
    doubled_odd_indices << current_number
    
    counter += 1
  end
  doubled_odd_indices

end
```

##### NOTES 
- See how we refer to the position by just using `counter` (instead of `number[conuter]` as before)

==================================================================

### Example 9: More flexible methods --> Generic methods with multiple arguments

- The examples we've looked at so far have taken one argument (the collection to be iterated over) and performed one operation to that collection. By defining our methods in such a way that we can pass in additional arguments to alter the logic of the iteration, we can create more flexible and generic methods.

Recall earlier we wrote a `select_fruit` method that selected fruits out of the `produce_list` hash of fruits and vegetables. 

Suppose we wish to now write a more generic `general_select` method so that we can specify whether we're interested in selecting fruits or vegetables. That method would take two arguments, the collection and a selection criteria.  

```ruby
produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

general_select(produce, 'Fruit')     # => {"apple"=>"Fruit", "pear"=>"Fruit"}
general_select(produce, 'Vegetable') # => {"carrot"=>"Vegetable", "broccoli"=>"Vegetable"}
general_select(produce, 'Meat')      # => {}
```

#### My answer

##### Rules / requirements
- Write a method
- Method takes two arguments
  - A collection
  - A selection criteria
- The method iterates over the collection and 
- Depending on the selection criteria, it selects certain elements
- Return a new collection with the desired elements

##### Examples
*Given in the problem description*

#### Data Structure
- Hash as input
- Array to temporary store keys
- Hash as output

#### Algorithm
1. Implement a method `general_select`
2. Pass in two arguments
  - a collection
  - a selection criteria
3. Iterate over the collection
  - Use a temp array to save keys
  - Use a counter
  - Use an empty hash to store result
  - Break if number of iterations equals the size of original collection
  - Perform a selection based on the second argument: selection criteria
  - Increment counter  
  - Return new collection with desired result

#### Code
```ruby
def general_select(collection, criteria)
  selected_elements = {}
  counter = 0
  temp_key_storage = collection.keys

  loop do
    break if counter == collection.size

    current_key = temp_key_storage[counter]
    current_value = collection[current_key]

    selected_elements[current_key] = current_value if current_value == criteria 

    counter += 1
  end

  selected_elements
end
```

##### NOTES 
- Note that we chose to not name the method `select` because of collision with `Kernel#select`, which does something completely different and could lead to confusion.

==================================================================

### Example 10: More generic methods

Let's update our `double_numbers` (*example 7*) method to not only be able to double the values in an array, but to multiply by any number. For example, let's create a method called `multiply` that can take an additional argument to determine the transformation criteria.

```ruby
my_numbers = [1, 4, 3, 7, 2, 6]
multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]
```

#### My answer

#### Code
```ruby
def multiply(numbers, criteria)
  multiplied_nums = []
  counter = 0

  loop do
    break if counter == numbers.size

    multiplied_nums << numbers[counter] * criteria
    counter += 1
  end

  multiplied_nums
end
```

==================================================================

### Example 11: More generic methods

Let's write a method called `select_letter`, that takes a string and returns a new string containing only the letter that we specified. We want it to behave like this:

```ruby
question = 'How many times does a particular character appear in this sentence?'
select_letter(question, 'a') # => "aaaaaaaa"
select_letter(question, 't') # => "ttttt"
select_letter(question, 'z') # => ""
```

#### My answer

#### Code

```ruby
def select_letter(string, character)
  char_string = ''
  counter = 0

  loop do
    break if counter == string.size

    current_char = string[counter]

    char_string << current_char if current_char == character
    counter += 1
  end

  char_string
end
```

##### NOTES 
- If we understand what the return value is, we can chain other methods to it
- In this case the method returns a string, so we can chain the `String#size` method to count the number of times `character` is repeated in `string`: `select_letter(question, 'a').size # => 8`
