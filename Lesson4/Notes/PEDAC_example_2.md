## PEDAC: Example 2 .- Sum Even Number Rows

### Problem description

Imagine a sequence of consecutive even integers beginning with 2. The integers are grouped in rows, with the first row containing one integer, the second row two integers, the third row three integers, and so on. Given an integer representing the number of a particular row, return an integer representing the sum of all the integers in that row.


### P: UNDERSTANDING THE PROBLEM

#### Initial understanding of the problem:

*Explicit information from problem description:*
*(we use this format for clarity)*

#### Rules / requirements

*We explicitly know that...*

- Sequence of even integers
- Sequence begins with two
- Integers are consecutive
- Sequence is grouped in to rows
- Each row incrementally larger: 1, 2, 3, ...
- Row 'number' equals the number of elements in the row
  - Row 1 has 1 element, row 2 has 2 elements, ...
- Input: a single integer
  - Identifies a 'row', which is a subset of a sequence of integers
- Output: a single integer
  - The sum of the integers in the row indetified by the input integer    

#### Visual representation of the sequence:

*as we can deduce from the problem statement*
```ruby
2, 4, 6, 8, 10, 12, 14, 16, 18, 20, ...

2
4, 6
8, 10, 12
14, 16, 18, 20
... *=> as many rows as the input integers indicates*
```
#### Questions:

*in order to understand the implicit requirements*

- How do we create the structure?


### E: EXAMPLES AND TEST CASES
```ruby
row number: 1 --> sum of integers in row: 2
row number: 2 --> sum of integers in row: 10
row number: 4 --> sum of integers in row: 68


2 -->  2
4, 6 --> 10
14, 16, 18, 20 --> 68
```

### D: DATA STRUCTURES

#### Having this visual representation...
```ruby
2
4, 6
8, 10, 12
14, 16, 18, 20
... 
```

#### ...we can assume that:
- Overall structure represents sequence as a whole
- Individual rows within overall structure
- Individual rows in a set order in context of sequence
- Individual rows contain integers
- Can assume that integers are in a set order in the context of the sequence
```ruby
[
  [2],
  [4, 6],
  [8, 10, 12],
  [14, 16, 18, 20],
  ...
]
```
### A: Algorithm

**First we document our understanding of the problem so far, in steps**

1. Create an empty 'rows' array to contain all of the rows
2. Create a 'row' array and add it to the overall 'row' array
  - *developed below*
3. Repeat step 2 until all the necessary rows have been created
  - All the rows have been created when the length of the 'rows' array is equal to the input integer
4. Sum the final row
5. Return the sum

**Parts of the problem may need further details**

- We can see that some of these steps are a bit vague, for example:
  - 2. Create a 'row' *=> this seems to be important step that has not defined steps*
  - so we can extract the complex parts of the problem into a separate complete process*
- Whereas other steps that are a bit complex but not enough, for example:
  - 3. Repeat step 2 until [...]
  - can be explained further with a note in the same algorithm, without being developed apart 

==============================================================================================
#### Sub-Problem: Create a row
*we repeat every step of PEDAC for this subproblem*

##### Rules / requirements:
- Row is an array
- Arrays contain integers
- Integers are consecutige even numbers
- Integers in each row form part of an overall larger sequence
- Rows are of different length
- Input: the information needed to create the output
  - the starting integer
  - length of the row
- Output: the row itself: `[8, 10, 12]`

##### Examples / test cases:
```ruby
start: 2, length: 1 --> [2]
start: 4, length: 2 --> [4, 6]
start: 8, length: 3 --> [8, 10, 12]
```
##### Data structure:
- An array of integers

##### Algorithm:
1. Create en empty 'row' array to contain the integers
2. Add the starting integers (which will be one of the inputs)
3. Increment the starting integer by 2 to get the next integer in the sequence
4. Repeat step 2 and 3 until the array reached the correct lenght
5. Return the 'row' array
==============================================================================================


### C: Implementing a solution in Code

##### First we set up the base for the methods we need and their arguments

```ruby
def sum_even_number_row(row_number)

end

def create_row(start_integer, row_length)

end
```

##### Then we set the test cases for both examples 
*at one point we'd need to test the code against these test cases*
*we use the test cases we created in the step 2) Example/Test Cases*
*we want to run the code often, so we can make sure is working as expected* 
*we use these test cases to make sure we get the expected output*
```ruby
row number: 1 --> sum of integers in row: 2
row number: 2 --> sum of integers in row: 10
row number: 4 --> sum of integers in row: 68


p sum_even_number_row(1) == 2 # => true
p sum_even_number_row(2) == 10 
p sum_even_number_row(4) == 68

-----

start: 2, length: 1 --> [2]
start: 4, length: 2 --> [4, 6]
start: 8, length: 3 --> [8, 10, 12]

p create_row(2, 1) == [2] #=> true
p create_row(4, 2) == [4, 6]
p create_row(8, 3) == [8, 10, 12]
```

##### Now we start developing the methods --> First the create_row method 

**We base our code in the algorithm we defined for this method before**
*It may be a good idea to copy paste the algorithm in the code file for reference*

1. Create en empty 'row' array to contain the integers
2. Add the starting integers (which will be one of the inputs)
3. Increment the starting integer by 2 to get the next integer in the sequence
4. Repeat step 2 and 3 until the array reached the correct lenght
5. Return the 'row' array

```ruby
def create_row(start_integer, row_length)
  row = []                                # => step 1
  #steps 2-4                              # => steps 2-4
  row                                     # => step 5
end
```

**Now we focus on steps 2-4**

- When we see something like 'repeat' in our algorithm is a sign of some sort of looping mechanism
- We realise we need to add some more comments to our algorithm, in this case about the loop

    - Start the loop
      - Add the start integer to the row
      - Increment the start integer by 2
      - Break out the loop if length of row equals row_length

- Now, based on this algorithm, we can code that loop into the method:

```ruby
def create_row(start_integer, row_length)
  row = []
  loop do                                
    row << start_integer
    start_integer += 2
    break if row.length == row_length
  end
  row                                     
end
```
**Remember to run the code every time we implement some code**
**Is it working as expected? good, we can then move to next step**

##### Now we move to the next method we need to create --> Now the sum_even_number_row method

**Again, we base our code in the algorithm we defined for this method before**
*It may be a good idea to copy paste the algorithm in the code file for reference*

1. Create an empty 'rows' array to contain all of the rows
2. Create a 'row' array and add it to the overall 'row' array
3. Repeat step 2 until all the necessary rows have been created
  - All the rows have been created when the length of the 'rows' array is equal to the input integer
4. Sum the final row
5. Return the sum

```ruby
def sum_even_number_row(row_number)
  rows = []                                     # step 1
  # steps 2-3                                   # step 2-3
  rows # TODO: expected sum of rows elements    # step 4-5
end
```

**Now we can focus on steps 2-3**

*first it'd be a good idea to run the code to make sure the output is as expected (as this point it'd be an empty arr)*

```ruby
def sum_even_number_row(row_number)
  rows = []
  row_length = 1                                     
  loop do
    rows << create_row(row_length)      #this method call needs a second arg, `start_integer`.
    row_length += 1
    break if rows.length == row_number
  end
  rows # TODO: expected sum of rows elements
end
```

**At this point we need the second argument, `starting_integer`, for the `create_row` method, but how to obtain it in the context of the `sum_even_number_row` method? We need to look at our data structure and create a mini algorithm for this arg**

- Calculating the start integer:
- Rule: first integer of row == last integer of preceding row + 2
- Algorithm:
  - Get the last row of the rows array 
  - Get last integer of that row
  - Add 2 to the integer

**Now let's implement this into our method**

```ruby
def sum_even_number_row(row_number)
  rows = []
  row_length = 1
  start_integer = 2                                     
  loop do
    rows << create_row(start_integer, row_length)
    start_integer = rows.last.last + 2              # => this is the implementation of the mini algorithm for `start_integer`
    row_length += 1
    break if row.length == row_number
  end
  rows # TODO: expected sum of rows elements
end
```

**Finally we have to make sure the return value is the sum of elements in `rows`**

```ruby
def sum_even_number_row(row_number)
  rows = []
  row_length = 1
  start_integer = 2                                     
  loop do
    rows << create_row(start_integer, row_length)
    start_integer = rows.last.last + 2              
    row_length += 1
    break if rows.length == row_number
  end
  final_row_sum = 0
  rows.last.each{ |num| final_row_sum += num }
  final_row_sum
end
```

##### So, our final code looks like that (including the test cases at the bottom):

```ruby
def sum_even_number_row(row_number)
  rows = []
  row_length = 1
  start_integer = 2                                     
  loop do
    rows << create_row(start_integer, row_length)
    start_integer = rows.last.last + 2              
    row_length += 1
    break if rows.length == row_number
  end
  final_row_sum = 0
  rows.last.each{ |num| final_row_sum += num }
  final_row_sum
end

def create_row(start_integer, row_length)
  row = []
  loop do                                
    row << start_integer
    start_integer += 2
    break if row.length == row_length
  end
  row                                     
end

p sum_even_number_row(1) == 2   # => expected true
p sum_even_number_row(2) == 10  # => expected true
p sum_even_number_row(4) == 68  # => expected true
```
