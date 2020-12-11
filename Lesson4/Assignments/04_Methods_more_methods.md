##  Practice Problems: Methods and More Methods
### (Iteration, selection and transformation over collections)

**from Lesson4: Ruby collections > 10.Practice Problems: Methods and More Methods**

=====================================================================================


The key things to think about are:

* How does the method treat the block's return value?
* What is the return value of the method?
* How can you use the Ruby docs to learn more about a method?
* Is the method destructive?


### Practice Problem 1

What is the return value of the `select` method below? Why?

```ruby
[1, 2, 3].select do |num|
  num > 5
  'hi'
end
```

#### My (WRONG) answer 

- The return value will be `'hi'`
- The last statement in this method's block is the string `'hi'`. As with every method, the last line of code being executed in the block of this `select` method is that string, therefore this is the return value. 

##### NOTES 

- Although the return values is `'hi'` (last statement in being executed) the method outputs `[1, 2, 3]` as these are the elements of obj that meets the select method condition.
 
#### School answer

- The return value will be `[1, 2, 3]`
- `select` performs selection based on the truthiness of the block's return value. In this case the return value will always be `'hi'`, which is a "truthy" value. Therefore `select` will return a new array containing all of the elements in the original array.

### Practice Problem 2

How does count treat the block's return value? How can we find out?

```ruby
['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end
```

#### My answer

- We can find out this information in Ruby-Doc / `Array#count`
- `count`, as `select` performs selection based on the truthiness of the block's return value.
- `count` can be called with or without block. If a block is given, it counts the number of elements for wich the block returns true
- In this case, the return value will be `2`, which is the number of elements which length is less than 4 chars

### Practice Problem 3

What is the return value of `reject` in the following code? Why?

```ruby
[1, 2, 3].reject do |num|
  puts num
end
```

#### My answer
- We can find the answer in Ruby-Doc / `Array#reject`
- The description there says: `Returns a new array containing the items in self for which the given block is not true. The ordering of non-rejected elements is maintained.`
- In this case, the return value of the code is the original array `[1, 2, 3]` as the return of the given block is `nil` (`puts` returns `nil`) so non element is *rejected*

##### NOTES 

- Also, the code outputs the elements of the array `1`, `2` and `3` in separate lines (because of `puts`)

#### School answer

- Since `puts` always returns `nil`, you might think that no values would be selected and an empty array would be returned. 
- The important thing to be aware of here is how `reject` treats the return value of the block. 
- `reject` returns a new array containing items where the block's return value is "falsey". In other words, if the return value was `false` or `nil` the element would be selected.

### Practice Problem 4

What is the return value of `each_with_object` in the following code? Why?

```ruby
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end
```

#### My (WRONG) answer

- The return value of the above code will be the following hash: `{'ant' => 'ant', 'bear' => 'bear', 'cat' => 'cat'}`
- According to Ruby_doc, the `Enumerable#each_with_object` method `iterates the given block for each element with an arbitrary object given, and returns the initially given object.`
- In this case, the method is being called in an array and the object given to the method (or method's argument) is an empty hash. The code intends to store the elements of the arr as key-values pairs in a hash. 
- In the block within the method, the first argument (`'value'`) referst to each elements in the arr, and the second argument (`'hash'`), refers to the collection obj passed in as arg to the method (`{}`)
- In the block, an index reference is used to assign each element in the original arr as key and the same element is assigned as value.  

#### School answer
- The return value of the above code will be the following hash: `{'a' => 'ant', 'b' => 'bear', 'c' => 'cat'}`
- When we invoke `each_with_object`, we pass in an object (`{}` here) as an argument. That object is then passed into the block and its updated value is returned at the end of each iteration. Once `each_with_object` has iterated over the calling collection, it returns the initially given object, which now contains all of the updates.
- In this code, we start with the hash object, `{}`. On the first iteration, we add `"a" => "ant"` to the hash. On the second, we add `"b" => "bear"`, and on the last iteration, we add `"c" => "cat"`. Thus, `#each_with_object` in this example returns a hash with those 3 elements.

##### NOTES 

- The reason for the keys to be `a`, `b` and `c` is because the block references, by index, the first letter of each element in the original collection: 
  - so value[0] is `a` in first iteration ([0] index of string `ant`), value[0] is a `b` in second iterarion ([0] index of string `bear`) and value[0] is `c` in third iteration ([0] index of string `cat`).

### Practice Problem 5

What does shift do in the following code? How can we find out?

```ruby
hash = { a: 'ant', b: 'bear' }
hash.shift
```

#### My answer

- We can find this information in Ruby_Doc `Hash#shift` method
- There it says `Removes a key-value pair from hsh and returns it as the two-item array `[ key, value ]``
- In this case shift removes the first key-value pair and returns it in a new array, so `[:a, 'ant']`

##### NOTES 
 
- `shift` destructively removes the first key-value pair in hash and returns it as a two-item array.  

### Practice Problem 6

What is the return value of the following statement? Why?

```ruby
['ant', 'bear', 'caterpillar'].pop.size
```

#### My answer

- the return value will be `11` which is the size of the last element in the array where the pop method was called
- this is an example of methods of different classes chained. They both well because they operate on the return value from of the callee. In this case, pop merhod's callee is the array `['ant', 'bear', 'caterpillar']` and size's method callee is the string `'caterpillar'` which is the element popped from original array after pop method is executed.


##### NOTES 

- According to Ruby-Doc:
  - `Array#pop` method `(destructively) removes the last element from self and returns it, or nil if the array is empty.`
  - `String#size` method `Returns the character length of str.`

### Practice Problem 7

What is the block's return value in the following code? How is it determined? Also, what is the return value of `any?` in this code and what does it output?

```ruby
[1, 2, 3].any? do |num|
  puts num
  num.odd?
end
```

#### My (PARTIALLY WRONG) answer

- The block's return value is the boolean `true`, which is returning from the last statement in the block, which is the `Integer#odd?` method 
  - `Integer#odd?` returns true if int is an odd number
- The return value of `Array#any?` method is `true` because `any?` takes into account the truthiness of the block, which in this case is `true` as we explained in the point above
- The output of this code will be the numbers `1`, `2` and `3` in separate lines, due to `puts` method   

#### School answer

- The return value of the block is determined by the return value of the last expression within the block. In this case the last statement evaluated is `num.odd?`, which returns a boolean. Therefore the block's return value will be a boolean, since `Integer#odd?` can only return true or false.

- Since the `Array#any?` method returns `true` if the block ever returns a value other than `false` or `nil`, and the block returns `true` on the first iteration, we know that `any?` will return `true`. 
- What is also interesting here is `any?` stops iterating after this point since there is no need to evaluate the remaining items in the array; therefore, `puts num` is only ever invoked for the first item in the array: therefore the output `1`.

### Practice Problem 8

How does `take` work? Is it destructive? How can we find out?

```ruby
arr = [1, 2, 3, 4, 5]
arr.take(2)
```

#### My answer

- To find out about any method and how it works we can use Ruby-Doc. In this case we'll be looking into `Array#take` method
- According to the documentation
  - `take` returns first n elements from the array.
  - It's a non destructive method; it returns a new array with the elements selected
- The return value in this code will be `[1, 2]`   

### Practice Problem 9

What is the return value of map in the following code? Why?

```ruby
{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end
```

#### My (WRONG) answer

- The return value will be a hash with only one pair of key-value: `{b: 'bear'}`
- `map` method iterates over a collection and return a new object with the elements from original elements that meet a certain requirement dictated by a statement. 
- In this case the condition statement is an `if` statement that requires that the `size` of each element is greater than 3 to be selected
- The block in `map` just return the values that meet the criteria, without making any transformation on to them
- Also, here we see `map` being called in a hash. Therefore, the method needs two arguments, one to represent the keys and another to represent the values. 
- So, the return value of this code will be `{b: 'bear'}` as `bear` is the only element which size is larger than 3 (so it meets the requirement set in the condition statement)

#### School answer

- The answer is `[nil, 'bear']`
- There are some interesting things to point out here. 
- First, the return value of `map` is an array, which is the collection type that `map` always returns. 
- Second, where did that `nil` come from? If we look at the `if` condition (`value.size > 3`), we'll notice that it evaluates to `true` when the length of value is greater than `3`. In this case, the only value with a length greater than `3` is `'bear'`. This means that for the first element, `'ant'`, the condition evaluates to `false` and value isn't returned.
- When none of the conditions in an if statement evaluates as true, the `if` statement itself returns `nil`. That's why we see `nil` as the first element in the returned array.

### Practice Problem 10

What is the return value of the following code? Why?

```ruby
[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end
```

#### My answer

- The return value of the above code will be `[1, nil, nil]`
- Whereas the output of the code will be integers `2` and `3`
- Why?
  - `map` transforms a collection (arr, hash, range) into a new array by going over every element and applying some logic to it (with a block)
  - In this case, the logic says, output the element if greater than 1, return the element otherwise. 
  - First element of arr does not meet the if statement requirement, therefore it falls into the `else` branch and it gets returned
  - Second and third elements, otherwise, fall into the if branch of the if/else statement, therefore get printed to the screen and `output` returns `nil`

##### NOTES 

- We can determine the block's return value by looking at the return value of the last statement evaluated within the block. 
- In this case it's a bit tricky because of the `if` statement. 
  - For the first element, the `if` condition evaluates to `false`, which means `num` is the block's return value for that iteration. 
  - For the rest of the elements in the array, `num > 1` evaluates to `true`, which means `puts num` is the last statement evaluated, which in turn, means that the block's return value is `nil` for those iterations.
