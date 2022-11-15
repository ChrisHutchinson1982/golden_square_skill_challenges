# Diary and Todo Tracker - Multi-Class Planned Design Recipe

## 1. Describe the Problem

As a user
So that I can record my experiences
I want to keep a regular diary
As a user
So that I can reflect on my experiences
I want to read my past diary entries
As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed
As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary
As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries


## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```

┌──────────────────────────────┐
│ DiaryTodoTracker             │
│ ________________             │
│                              │
│ - add_entry(diary_entry)     │
│ - add_task(task)             │
│ - all_diary                  │
│ - all_todo                   ├───────────────────┐
│ - find_best_entry(wpm, mins) │                   │
│ - list_phone_numbers         │                   │
│                              │                   │
│                              │                   │
└───────────────┬──────────────┘                   │
                │                                  │
                │                                  │
                │ DiaryTodoTracker                 │ DiaryTodoTracker 
                │ contains 0 or more DiaryEntry    │ contains 0 or more TodoEntry
                │                                  │
                │                                  │
┌───────────────▼─────────────┐     ┌──────────────▼────────────────┐
│ DiaryEntry(tite, contents)  │     │ TodoEntry(task)               │
│ _________________           │     │  _________________            │
│                             │     │                               │
│ - title                     │     │  -  task_details              │
│ - contents                  │     │                               │
│ - count_words               │     │                               │
│                             │     │                               │
│                             │     │                               │
│                             │     │                               │
│                             │     │                               │
│                             │     │                               │
└─────────────────────────────┘     └───────────────────────────────┘
```

_Also design the interface of each class in more detail._

```ruby
class DiaryTodoTracker
  def initialize
    # ...
  end

  def add_entry(diary_entry) # diary_entry is an instance of DiaryEntry
    # Track gets added to the diary library
    # Returns nothing
  end

  def add_task(task) # task is an instance of TodoEntry
    # Track gets added to the todo library
    # Returns nothing
  end

  def all_diary
    # Returns a list of diary_entry objects
  end

  def all_todo
    # Returns a list of task objects
  end
  
  def find_best_entry(wpm, mins)
    # `wpm` is an integer representing the number of words the user can read
        # per minute.
        # `minutes` is an integer representing the number of minutes the user
        # has to read.
    # Returns an instance of diary entry representing the entry that is closest 
    # to, but not over, the length that the user could read in the minutes they
    # have available given their reading speed.
  end

  def list_phone_numbers 
    # Returns a list of phone numbers extracted from all diary entries
  end 

end

class DiaryEntry
  def initialize(title, contents) # title and contents are both strings
  end

  def title
    # Returns the title as a string
  end

  def contents
    # Returns contents as a string
  end

  def count_words
    # Returns the number of words in the contents as an integer
  end

end

class Todo
  def initialize(task) # task is a strings
  end

  def task_details
    # Returns the task details as a string
  end
end

```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby

# Gets all diary entries
# diary = DiaryTodoTracker.new
# entry_1 = DiaryEntry.new("entry_1", "One")
# entry_2 = DiaryEntry.new("entry_2", "One Two")
# diary.add_entry(entry_1)
# diary.add_entry(entry_2)
# diary.all_diary # => [entry_1, entry_2]

# Gets all todo entries
# diary = DiaryTodoTracker.new
# task_1 = Todo.new("task_1")
# task_2 = Todo.new("task_2")
# diary.add_task(task_1)
# diary.add_task(task_2)
# diary.all_todo # => [task_1, task_2]

# Returns best entry when one valid entry
# diary = DiaryTodoTracker.new
# entry_1 = DiaryEntry.new("entry_1", "One")
# entry_2 = DiaryEntry.new("entry_2", "One Two")
# diary.add_entry(entry_1)
# diary.add_entry(entry_2)
# diary.find_best_entry(1, 1) # => entry_1

# Returns best entry when more than one valid entry
# diary = DiaryTodoTracker.new
# entry_1 = DiaryEntry.new("entry_1", "One")
# entry_2 = DiaryEntry.new("entry_2", "One Two")
# entry_3 = DiaryEntry.new("entry_3", "One Two Three")
# diary.add_entry(entry_1)
# diary.add_entry(entry_2)
# diary.add_entry(entry_3)
# diary.find_best_entry(2, 1) # => entry_2

# Returns nil when no valid entry
# diary = DiaryTodoTracker.new
# entry_1 = DiaryEntry.new("entry_1", "One Two Three Four")
# entry_2 = DiaryEntry.new("entry_2", "One Two Three Four Five")
# entry_3 = DiaryEntry.new("entry_3", "One Two Three Four Five Six")
# diary.add_entry(entry_1)
# diary.add_entry(entry_2)
# diary.add_entry(entry_3)
# diary.find_best_entry(2, 1) # => nil

# Returns error is wpm is 0
# diary = DiaryTodoTracker.new
# entry_1 = DiaryEntry.new("entry_1", "One Two Three Four")
# entry_2 = DiaryEntry.new("entry_2", "One Two Three Four Five")
# entry_3 = DiaryEntry.new("entry_3", "One Two Three Four Five Six")
# diary.add_entry(entry_1)
# diary.add_entry(entry_2)
# diary.add_entry(entry_3)
# diary.find_best_entry(0, 1) # => "Wpm or Mins cannot be 0"

# # Returns error is mins is 0
# diary = DiaryTodoTracker.new
# entry_1 = DiaryEntry.new("entry_1", "One Two Three Four")
# entry_2 = DiaryEntry.new("entry_2", "One Two Three Four Five")
# entry_3 = DiaryEntry.new("entry_3", "One Two Three Four Five Six")
# diary.add_entry(entry_1)
# diary.add_entry(entry_2)
# diary.add_entry(entry_3)
# diary.find_best_entry(1, 0) # => "Wpm or Mins cannot be 0"

# Returns phone number list when one valid entry where phone number is full contents string
diary = DiaryTodoTracker.new
entry_1 = DiaryEntry.new("entry_1", "01234567890")
entry_2 = DiaryEntry.new("entry_2", "One Two")
diary.add_entry(entry_1)
diary.add_entry(entry_2)
diary.list_phone_numbers # => ["01234567890"]

# Returns phone number list when two valid entries where phone number is full contents string
diary = DiaryTodoTracker.new
entry_1 = DiaryEntry.new("entry_1", "01234567890")
entry_2 = DiaryEntry.new("entry_2", "01234567891")
diary.add_entry(entry_1)
diary.add_entry(entry_2)
diary.list_phone_numbers # => ["01234567890", "01234567891"]

# Returns phone number list when one valid entry where phone number is part of contents string
diary = DiaryTodoTracker.new
entry_1 = DiaryEntry.new("entry_1", "Your number is 01234567890")
entry_2 = DiaryEntry.new("entry_2", "One Two")
diary.add_entry(entry_1)
diary.add_entry(entry_2)
diary.list_phone_numbers # => ["01234567890"]

# Returns phone number list when two valid entries with one full string and one part string
diary = DiaryTodoTracker.new
entry_1 = DiaryEntry.new("entry_1", "01234567890")
entry_2 = DiaryEntry.new("entry_2", "One Two")
entry_3 = DiaryEntry.new("entry_1", "Your number is 01234567891")
diary.add_entry(entry_1)
diary.add_entry(entry_2)
diary.add_entry(entry_3)
diary.list_phone_numbers # => ["01234567890", "01234567891"]

# Returns phone number list when two valid numbers in contents string
diary = DiaryTodoTracker.new
entry_1 = DiaryEntry.new("entry_1", "Call 01234567890 or 01234567892")
entry_2 = DiaryEntry.new("entry_2", "One Two")
entry_3 = DiaryEntry.new("entry_1", "Your number is 01234567891")
diary.add_entry(entry_1)
diary.add_entry(entry_2)
diary.add_entry(entry_3)
diary.list_phone_numbers # => ["01234567890", "01234567892", "01234567891"]

# Returns empty list when no valid numbers
diary = DiaryTodoTracker.new
entry_1 = DiaryEntry.new("entry_1", "One Two Three Four")
entry_2 = DiaryEntry.new("entry_2", "One Two Three Four Five")
entry_3 = DiaryEntry.new("entry_3", "One Two Three Four Five Six")
diary.add_entry(entry_1)
diary.add_entry(entry_2)
diary.add_entry(entry_3)
diary.list_phone_numbers # => []

```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby

# DiaryTodoTracker unit tests

# # Returns empty diary list when no diary entries
# diary = DiaryTodoTracker.new
# diary.all_diary # => []

# Returns empty todo list when no todo entries
# diary = DiaryTodoTracker.new
# diary.all_todo # => []

# # Returns nil for best entry when no diary entries
# diary = DiaryTodoTracker.new
# diary.find_best_entry(1, 1) # => nil

# # Returns empty phone number list when no diary entries
# diary = DiaryTodoTracker.new
# diary.list_phone_numbers  # => []

# DiaryEntry unit tests

# # Returns title
# entry_1 = DiaryEntry.new("entry_1", "One")
# entry_1.title => "entry_1"

# # Returns contents
# entry_1 = DiaryEntry.new("entry_1", "One")
# entry_1.title => "One"

# # Returns word count of contents as integer
# entry_1 = DiaryEntry.new("entry_1", "One Two Three Four Five")
# entry_1.count_words => 5

# # Returns 0 if contents is empty
# entry_1 = DiaryEntry.new("entry_1", "")
# entry_1.count_words => 0

# Todo unit tests

# Constructs a task
task = Todo.new("Task 1")
task.task_details # => "Task 1"

```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._
