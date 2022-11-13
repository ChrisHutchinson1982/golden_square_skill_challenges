# {{todo tracker}} Class Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

As a user
So that I can keep track of my tasks
I want a program that I can add todo tasks to and see a list of them.
As a user
So that I can focus on tasks to complete
I want to mark tasks as complete and have them disappear from the list.

## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby
# EXAMPLE

class TodoTracker
  def initialize
    # todo_list: empty array 
  end

  def add(todo) # todo is a string
    # Throws an exception if todo is already set
    # No return value
  end

  def todo_list
    # returns a list of todo's 

  def complete(todo)
    # Throws an exception if no todo is set
    # Otherwise, removes todo from list of todo's 
  end
end
```

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations._

```ruby
# EXAMPLE

# 1 returns empty array
todo_tracker = TodoTracker.new
todo_tracker.todo_list # => []

# 2 add and returns one todo
todo_tracker = TodoTracker.new
todo_tracker.add("Shopping")
todo_tracker.todo_list # => ["Shopping"]

# 3 add and returns mutiple todo's
todo_tracker = TodoTracker.new
todo_tracker.add("Shopping")
todo_tracker.add("Walk the dog")
todo_tracker.todo_list # => ["Shopping", "Walk the dog"]

# 4 throws an exception if todo is already set
todo_tracker = TodoTracker.new
todo_tracker.add("Shopping")
todo_tracker.add("Shopping") # => "Error, Todo already in Todo list"

# 5 throws an exception if no todo is set
todo_tracker = TodoTracker.new
todo_tracker.complete("Shopping") # => "Error, no matching Todo in Todo list"

# 6 removes todo from list
todo_tracker = TodoTracker.new
todo_tracker.add("Walk the dog")
todo_tracker.complete("Walk the dog")
todo_tracker.todo_list # => []

# 6 removes todo from list with mutiple todo's
todo_tracker = TodoTracker.new
todo_tracker.add("Shopping")
todo_tracker.add("Walk the dog")
todo_tracker.complete("Walk the dog")
todo_tracker.todo_list # => ["Shopping"]

```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._

