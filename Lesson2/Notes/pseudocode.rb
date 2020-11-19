=begin

# Write out pseudo-code (both casual and formal) that does the following:

1. a method that returns the sum of two integers

  Casual:
  - Given two integers
  - Save each of them in a variable
  - Perform the sum of both variables and save the result in a third variable
  - Output the variable that contains the result of the sum

  Formal:
  START Given two integers
  SET int1 = first given int
  SET int2 = secodn given int
  SET sum = int1 + int2
  PRINT sum
  END

2. a method that takes an array of strings, and returns a string that is all those strings concatenated together

  Casual:
  - Given an array of strings
  - Extract every string in the array
  - Put them all together in a new long single string, without spaces in between them
  - Output the new strings

  Formal:
  START given an array of strings
  SET iterator = 0
  READ the elements of the array 
  WHILE iterator <= size of array 
    SET string1 = array index iterator
    SET string2 = array index iterator
    SET string3 = array index iterator 
    iterator = iterator + 1
  SET string_concatenated = string1 + string2 + string3 + [etc.]
  PRINT string_concatenated

3. a method that takes an array of integers and returns a new array with every other element

  Casual:
  - Given an array of integers
  - Read the array
  - Create a new array
  - Populate the new array with odd indexes of original array
  - Output the new array

  Formal:
  START given an array of integers
  SET new_array = empty array
  SET iterator = 0
  WHILE iterator <= size of array
    IF iterator is odd number
      SET new_array = ADD element at current index to new_array
    ELSE
      skipt to next index
    iterator = iterator + 1     
  
  PRINT new_array

=end