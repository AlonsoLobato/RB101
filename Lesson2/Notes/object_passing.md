## Understanding object passing with some examples: 

### 1) Variable assignment
```ruby
a = 'Hello'
b = a
p a       # => ‘Hello’
p b       # => ‘Hello’
```

#### WHAT'S GOING ON?
- We declare var `a`, which references the str obj `Hello` 
- We declare var `b`, which references the str obj that var `a` references (in this case, `Hello`)
- Now both var `a` and var `b` reference the same str obj in memory (`Hello`)

#### REMEMBER:
- This is an example of **obj pass by reference**: 
  - The assignment operator (`=`) *passes a reference* of the obj referenced by var `a` to var `b`
  - Same thing with `a = 'Hello'`; a reference of the str obj `Hello` is passed to the var `a`


### 2) Variable reassignment
```ruby
a = 'Hello'
b = a
b = 'Goodbye'
p b           # => ‘Goodbye’
p a           # => ‘Hello’
```

#### WHAT'S GOING ON?
- We declare var `a`, which references the str obj `Hello`  
- We declare var `b`, which references the str obj that var `a` references
- We reassign var `b` to reference the new str obj `Goodbye` 
- Var `b` has changed from referencing the obj that var `a` references, to reference a new str obj (in this case, `Goodbye`)
- Var `a` remains the same

#### REMEMBER:
- This is an example of **obj pass by reference**:
  - The assignment operator (`=`), *passes a reference* of the str obj `Goodbye` to var `b`
  - Note how the str obj `Hello` hasn’t mutated, but var `b` has been reassigned and now references a different obj

### 3) Variable reassignment (numbers)
```ruby
number = 3
p number              # => 3
number = number * 2   # => 6    # number *= 2 is a shorter version of same code
p number              # => 6
```

#### WHAT'S GOING ON?
- We declare a var `number` which references the int obj `3`
- We output the obj reference stored in var `number` (in this case, the int obj `3`)
- We reassign var `number` to a new obj that results from multiplying the int obj that var `number` referenced and int `2` (in this case, it results that var `number` now references int obj `6`)

#### REMEMBER:
- This is an example of **obj pass by value**: 
  - Numbers are immutable objs
  - There seems to be an obj mutation, but it's a var reassignment instead
- The expression `number = number * 2` could be shortened to `number += 2` (var reassignment)
- `+=`, `-=`, `*=`, `/=`, `%=` and `=` are all assignment operators, and as such, don't mutate the original obj but reassign vars to new objs resulting from these operations

### 4) Variable reassignment (numbers) inside a defined method
```ruby
def increment(a)
  a = a + 1
end

b = 3
p increment(b)    # => 4
p b               # => 3
```

#### WHAT'S GOING ON?
- We define a method that takes one argument, `a`, and includes a non-mutating method (`Integer#+`) in a block, within it
- We declare a var `b` which references the int obj `3`
- We call the method by passing in the var `b` as argument. The argument is an alias for the obj that var `b` references (in this case, the int obj `3`)
- The method returns the argument reassigned to a new object which reference the int obj `4` (resulting from the operation inside the block)
- The var `b` remains unchanged  

#### REMEMBER:
- This is an example of **obj pass by value**: 
  - Numbers are immutable so the obj is passed on to the method by value (a copy of the original)
  - The block within the method operates with the copy of the value referenced by var `b` but cannot mutate it
  - Pass by value does not create aliases but copies of the original objs, so original objs aren't mutated

### 5) Object mutation (_use of mutating method_)
```ruby
a = 'Hello'
b = a
b << ' there!'
p b       # => Hello there!’
p a       # => ‘Hello there!’
```

#### WHAT'S GOING ON?
- We declare var `a`, which references the str obj `Hello`  
- We declare var `b`, which references the str obj that var `a` references
- We mutate the str obj referenced by var `b` (`Hello`) by appending the str obj ` there`
- Var `b` still points to the same obj, but that obj has been mutated (from `Hello` to `Hello there`) 
- Var `a` still points to the same obj, but that obj has been mutated (through a mutation made in var *alias* `b`) 

#### REMEMBER:
- This is an example of **obj pass by reference** 
  - The assignment operator (`=`) *passes a reference* of the str obj `Goodbye` to var `b` (line 2 of code)
  - Because of the assignment made in line 2, var `a` and var `b` are now *aliases* which reference the same obj in memory.
  - Any mutation made to the obj through any of the aliases will affect the other aliases (the mutations are not made in the aliases or var, but in the object itself)
- In line 3 we use the `String#<<` method (*aka shovel operator*) which is a mutating method. That mutation affects the obj at a global scope

### 6) Object mutation (_use of mutating method within a method's block_)
```ruby
a = 'Hello' 
b = 'Goodby'

def my_method(b)
  b.upcase!
end

p my_method(a)  # => ‘HELLO’
p a             # => ‘HELLO’
p b             # => ‘Goodbye’
```

#### WHAT'S GOING ON?
- We declare var `a`, which references the str obj `Hello`  
- We declare var `b`, which references the str obj `Goodbye`  
- We define a method that takes one argument, `b`, and includes a mutating method (`String#upcase!`) in a block, within it
- We call the method by passing in the var `a` as argument. The argument is the obj that var `a` references (in this case, the str obj `Hello`)
- The method returns the str obj referenced by var `a`, now mutated 
- Var `a` still points to the same obj, but that obj has been mutated (from `Hello` to `HELLO`) 
- Var `b` remains the same 

#### REMEMBER:
- This is an example of **obj pass by reference** 
  - In this case the arg becomes an alias of var `a`, so a *reference of the obj* that is referenced by var `a`, is passed in to the method
  - Remember that as aliases for same obj in memory, any mutation made to the obj through any of the aliases will affect the other aliases
  - Here the method arg is called `b` but it doesn't mean var `b` (method arg could be called anything, `x`, `str`,`i`...)
- Notice how after line 2, the var `b` remains "untouched" by the code (it's not called anymore)

### 7) Local change to an object (_use of non-mutating method within a method's block_)
```ruby
a = 'Hello'
b = ' there'

def my_method(x, y)
  x + y
end

p my_method(a, b)   # => 'Hello there'
p a                 # => 'Hello'
p b                 # => ' there'
```

#### WHAT'S GOING ON?
- We declare var `a`, which references the str obj `Hello`  
- We declare var `b`, which references the str obj ` there`
- We define a method that takes two arguments `x` and `y` and that includes a non-mutating method (`String#+`) in a block, within it
- We call the method passing in var `a` and var `b` as arguments. Remember that the arguments are the obj to which var `a` and var `b` reference (in this case, the str obj `Hello` and the str obj ` there`)
- The method returns a new str obj: the concatenation of the obj referenced by var `a` and obj referenced by var `b` (in this case, `Hello there`) 
- The objs that `a` and `b` referenced originally haven't been mutated, so `a` and `b` still reference the same objs (in this case, `Hello` and ` there` )

#### REMEMBER:
- This is an example of **obj pass by reference**
  - But in this case we don't mutate the obj referenced by the arg. The `String#+` method is not mutating, but returns a new obj
  - The new str obj returned by the method call is not a mutation of any of the obj originally referenced by var `a` or var `b`, but a concatenation of objs done within the local scope of the method, without any effect in the outer scope

## 8) Mutation of element(s) in a collection
```ruby
a = %w(a b c)
p a               # => ["a", "b", "c"]
p a[1]            # => "b"
a[1] = '-'    
p a[1]            # => "-"
p a               # => ["a", "-", "c"]
```

#### WHAT'S GOING ON?
- We declare a var `a`, which references the arr obj `["a", "b", "c"]`
- We call the mutating method `Array#[]=` on arr obj element at index 1 and mutate its value to str obj `-`
- We can now see how arr element at index 1 has mutated from obj `b` to obj `-`
- Var `a` remains the same, it still references the same arr obj, what has changed is one of elements the obj contains

#### REMEMBER:
- We can check this out by calling object_id in var `a` before and after the mutation at index 1, the obj id will be the same
- If we run object_id in `a[1]` before and after the mutation, the obj id will be different
- A var can reference a collection obj and within that collection there will be X number of elements and each references to other objs