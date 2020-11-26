## PEDAC: Example 1 - Palindromes

Problem statement and test cases provided to follow:

#### Problem statement:

- Given a string, write a method `palindrome_substrings` which returns all the substrings from a given string which are palindromes. Consider palindrome words case sensitive.

#### Examples and Test cases:

```ruby
palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
palindrome_substrings("palindrome") == []
palindrome_substrings("") == []
```

### 1) P - [Understand the] PROBLEM

Understanding the problem has three steps:

1. Read the problem description.
2. Check the test cases, if any.
3. If any part of the problem is unclear, ask the interviewer or problem requester to clarify the matter.

**before taking any notes, for the given problem, I should ask myself:**

- what is a palindrome?
- what is a substring?
- will inputs always be string?
- what does it mean to treat palindrome words casesensitively?

**notes that ansewer these questions and break down the problem understanding:**

- INPUT: string

- OUTPUT: array of strings (that are palindromes of the input string)

- RULES:
	Explicit requierements:
	- create a method called palindrome_substrings
	- a substring is part of a larger string ("ada" is a substring of the string "manada")
	- must return an array of substrigs that are palindromes of original string (Remember: 	  palindrome is a word that reads the same forwards and backward, like "ada" or "aa”, so 	  a word of minimum two characters long)
	- palindrome words are case sensitive ("Ada" is not a palindrome, but "ada" is)

	Implicit requirements:
	- a palindrome may contain shorter palindromes within it (the string "abcddcbA" contains 	  the palindrome "bcddcb", which contains "cddc", which contains "dd". All of them are 	  valid palindromes
	- a string that does not contain palindromes returns an empty array
	- an empty string returns an empty array

### 2) EXAMPLES / TEST CASES

*In this problem, this step is given with the problem statement.* 

### 3) DATA STRUCTURE

Array (it’s obvious since this is the desired output from the problem statement)

### 4) ALGORITHM

**Can be a high-level or a lower-level algorithm, according to the depth of the implementation in relation to the problem**
- *Sometimes we'd need to start coding based on the high-level and come back to determine a lower-level steps in the algorithm*
- *Also, another optional step is to convert the algorithm (written in pseudo-code) into a more formal pseudo-code, that almost looks like the final code. This part is optional and may not always be needed. See an example below*
- _We should be able to write a plain English solution to the problem. **If we can't do that, we won't be able to code it**_

#### high-level algorithm

```ruby
# Algorithm:
#  - initialize a result variable to an empty array
#  - create an array named substring_arr that contains all of the
#    substrings of the input string that are at least 2 characters long.
#  - loop through the words in the substring_arr array.
#  - if the word is a palindrome, append it to the result
#    array
#  - return the result array
```

- This algorith does not tackle some of the hardest parts of the problem, which may need to be develop at a lower level:
  - finding all substrings of a given string
  - determining if a string is a palindrome 
  - in this case, it means defining lower-level algorithms for two methods to find substrings and to find palindromes


### 5) CODE WITH INTENT

**We can use the "high-level" algorithm from above and first write the code for it**

```ruby
def palindrome_substrings(str)
  result = []
  substrings_arr = substrings(str)
  substrings_arr.each do |substring|
    result << substring if is_palindrome?(substring)
  end
  result
end
```

- Once the high-level algorithm is converted into code, we realise we need to determine, at a lower-level, the algorithms for the methods `substrings(str)` and `is_palindrome?(str)`
- So we get **back to the algorithm step** to determine these

### 4) ALGORITHM

- So back to this step, we first tackle the `substrings(str)` method, but where to start?

  - To find a correct algorithm, we can use a small example, like the string `halo` and extract all substrings
  - We soon realise that: 
    - we need a minimum of 2 characters to have a string 
    - the max lenght of a substring is the lenght of the string
    - we need to iterate over the string, starting at index 0 char and ending at string length -2 (two chars before the end)
    - we can implement a double loop to get these
    - we may come up with a pseudo-code like this:
    ```ruby
    # for each starting index from 0 through the next to last index position
      # for each substring length from 2 until there are no substrings of that length
        # extract the substring of the indicated length starting at the indicate index position
      # end of inner loop
    # end of outer loop.
    ```

  - We still need to destile this pseudo-code using some small examples to try to find a way to come up with `'ha'` `'hal'` `'halo'` `'al'` `'alo'` `'lo'` as possible substrings of `'halo'`
  - Looking at these examples, we can determine that we need:
    - an outer loop that iterates over indexes from 0 to the length of the next to the last index position (`string.length - 2`). 
    - an inner loop that ranges from 2 to the original string length minus the starting index (`string.length - startingIndex`). 
    - we can use both of these facts in our algorithm. Let's go ahead and write the complete algorithm for this method:
    
    ```ruby
    # create an empty array called `result` that will contain all required substrings
    # create a `starting_index` variable (value `0`) for the starting index of a substring
    # start a loop that iterates over `starting_index` from `0` to the length of the string minus 2
      # create a `num_chars` variable (value `2`) for the length of a substring
      # start an inner loop that iterates over `num_chars` from `2` to `string.length - starting_index`
        # extract a substring of length `num_chars` from `string` starting at `starting_index`
        # append the extracted substring to the `result` array
        # increment the `num_chars` variable by `1`
      # end the inner loop
      # increment the `starting_index` variable by `1`
    # end the outer loop
    # return the `result` array
    ```

##### Formal pseudo-code

- this step is totally optional, but for some complex pseudo-code like in the lower-level algorithm for the method we've just defined, writting a formal pseudo-code version can be very helpful *(and it'll almost look like the final code for the method)*
```ruby
# START

  # /* Given a string named `string` */

  # SET result = []
  # SET starting_index = 0

  # WHILE starting_index <= length of string - 2
    # SET numChars = 2
    # WHILE numChars <= length of string - starting_index
      # SET substring = num_chars characters from string starting at index starting_index
      # append substring to result array
      # SET num_chars = num_chars + 1

    # SET starting_index = starting_index + 1

  # RETURN result

# END
```

### 5) CODE WITH INTENT

- Again here, to transform the pseudo-code into a real code. *We can see how similar from the formal pseudo-code this is*

```ruby
def substrings(str)
  result = []
  starting_index = 0;

  while (starting_index <= str.length - 2)
    num_chars = 2
    while (num_chars <= str.length - starting_index)
      substring = str.slice(starting_index, num_chars)
      result << substring
      num_chars += 1
    end
    starting_index += 1
  end
  result
end
```

### 4) ALGORITHM

- Once again in the algorithm step, to now tackle the other method, `is_palindrome?(str)`
- In this case is easier, as we can make use of the String#reverse method, which *Returns a new string with the characters from str in reverse order*
- In pseudo-code this may look like:

```ruby
# Inside the `is_palindrome?` method, check whether the string value is equal to its reversed value. 
# You can use the String#reverse method.
```

### 5) CODE WITH INTENT

- Finally, the code for this second method

```ruby
def is_palindrome?(str)
  return str == str.reverse
end
```

=====================================

### SO, THE COMPLETE PSEUDO-CODE FOR THE ENTIRE PROBLEM COULD BE:

```ruby
# input: a string
# output: an array of substrings
# rules: palindrome words should be case sensitive, meaning "abBA" is not a palindrome

# Algorithm:

#  substrings method
#  =================
  # create an empty array called `result` that will contain all required substrings
  # create a `starting_index` variable (value `0`) for the starting index of a substring
  # start a loop that iterates over `starting_index` from `0` to the length of the string minus 2
    # create a `num_chars` variable (value `2`) for the length of a substring
    # start an inner loop that iterates over `num_chars` from `2` to `string.length - starting_index`
      # extract a substring of length `num_chars` from `string` starting at `starting_index`
      # append the extracted substring to the `result` array
      # increment the `num_chars` variable by `1`
    # end the inner loop
    # increment the `starting_index` variable by `1`
  # end the outer loop
  # return the `result` array

#  is_palindrome? method
#  =====================
  # Inside the `is_palindrome?` method, check whether the string value is equal to its reversed value. 
  # You can use the String#reverse method.

#  palindrome_substrings method
#  ============================
#  initialize a result variable to an empty array
#  create an array named substring_arr that contains all of the substrings of the input string that are at least 2 chars long.
#  loop through the words in the substring_arr array.
#  if the word is a palindrome, append it to the result array
#  return the result array
```

### AND THE CODE FOR THE ENTIRE PROBLEM COULD BE *(includes test cases)*:

```ruby
def substrings(str)
  result = []
  starting_index = 0;

  while (starting_index <= str.length - 2)
    num_chars = 2
    while (num_chars <= str.length - starting_index)
      substring = str.slice(starting_index, num_chars)
      result << substring
      num_chars += 1
    end
    starting_index += 1
  end
  result
end

def is_palindrome?(str)
  str == str.reverse
end

def palindrome_substrings(str)
  result = []
  substrings_arr = substrings(str)
  substrings_arr.each do |substring|
    result << substring if is_palindrome?(substring)
  end
  result
end

p palindrome_substrings("supercalifragilisticexpialidocious"); # ["ili"]
p palindrome_substrings("abcddcbA");   # ["bcddcb", "cddc", "dd"]
p palindrome_substrings("palindrome"); # []
p palindrome_substrings("");           # []
```