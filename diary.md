# {{Diary}} Class Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

As a user
So that I can keep track of diary entries
I want a program that I can add diary entries to and see a list of them.
As a user
I want a program to count words of diary entries
As a user
Given my defined wpm (reading speed)
I want a program to return the estimate reading time in mins if user to read all enrries in diary
As a user
Given a my defined wpm (reading speed) and minutes (time available to read)
I want a program to return an instance of the dairy entry that is closest 
to, but not over, the length that the user could read in the minutes they
have available given their reading speed.

I want to mark tasks as complete and have them disappear from the list.

## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby
# File: lib/diary.rb
class Diary
  def initialize
  end

  def add(entry) # entry is an instance of DiaryEntry
    # Returns nothing
  end

  def all
    # Returns a list of instances of DiaryEntry
  end

  def count_words
    # Returns the number of words in all diary entries
    # HINT: This method should make use of the `count_words` method on DiaryEntry.
  end

  def reading_time(wpm) # wpm is an integer representing
                        # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # if the user were to read all entries in the diary.
  end

  def find_best_entry_for_reading_time(wpm, minutes)
        # `wpm` is an integer representing the number of words the user can read
        # per minute.
        # `minutes` is an integer representing the number of minutes the user
        # has to read.
    # Returns an instance of diary entry representing the entry that is closest 
    # to, but not over, the length that the user could read in the minutes they
    # have available given their reading speed.
  end
end

# File: lib/diary_entry.rb
class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    # ...
  end

  def title
    # Returns the title as a string
  end

  def contents
    # Returns the contents as a string
  end

  def count_words
    # Returns the number of words in the contents as an integer
  end

  def reading_time(wpm) # wpm is an integer representing
                        # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # for the contents at the given wpm.
  end

  def reading_chunk(wpm, minutes) # `wpm` is an integer representing the number
                                  # of words the user can read per minute
                                  # `minutes` is an integer representing the
                                  # number of minutes the user has to read
    # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.
  end
end
```

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations._

```ruby
# EXAMPLE

# 1 returns empty array
my_diary = Diary.new
my_diary.all # => []

# 2 add diary entry and returns title
entry_1 = DiaryEntry.new("Today", "Test driving a class system")
entry_1.title # => "Today"

# 3 add diary entry and returns contents
entry_1 = DiaryEntry.new("Today", "Test driving a class system")
entry_1.contents # => "Test driving a class system"

# 4 add diary entry and returns word count
entry_1 = DiaryEntry.new("Today", "Test driving a class system")
entry_1.count_words # => 5

# 5 add diary entry and returns reading time when even number or words
entry_1 = DiaryEntry.new("Today", "Test driving a class")
entry_1.reading_time(1) # => 4

# 6 add diary entry and returns reading time when odd number of words
entry_1 = DiaryEntry.new("Today", "Test driving a class system")
entry_1.reading_time(2) # => 3

# 7 add diary entry and returns error when wpm is 0
entry_1 = DiaryEntry.new("Today", "Test driving a class system")
entry_1.reading_time(0) # => "Error, wpm cannot be 0"

# 8 add diary entry and returns reading_chunk from contents that user can read in a minute
entry_1 = DiaryEntry.new("Today", "I am feeling great but think sounds tricky!")
entry_1 .reading_chunk(1, 1)) # => "I"


# 9 add diary entry and returns error if wpm is 0
entry_1 = DiaryEntry.new("Today", "Test driving a class system")
entry_1.reading_time(0, 5) # => "Error, wpm or reading time cannot be 0"

# 10 add diary entry and returns error if reading time is 0
entry_1 = DiaryEntry.new("Today", "Test driving a class system")
entry_1.reading_time(5, 0) # => "Error, wpm or reading time cannot be 0"

# 11 add diary entry and returns second reading_chunk from contents that user can read in a minute" do

entry_1 = DiaryEntry.new("Today", "I am feeling great but think sounds tricky!")
entry_1.reading_chunk(1,1)
entry_1.reading_chunk(2,1)) # => "am feeling"

# 12 returns reading_chunk to start if contents more than fully read
entry_1 = DiaryEntry.new("Today", "I am feeling great but think sounds tricky!")
entry_1.reading_chunk(4,1)
entry_1.reading_chunk(3,1)
entry_1.reading_chunk(4,1)
entry_1.reading_chunk(1,1)) # => "I"

# 13 returns reading_chunk to start if contents equal to fully read 
entry_1 = DiaryEntry.new("Today", "I am feeling great but think sounds tricky!")
entry_1.reading_chunk(4,1)
entry_1.reading_chunk(3,1)
entry_1.reading_chunk(1,1)
entry_1.reading_chunk(1,1)) # => "I"

# 14 add and returns 1 diary entry from list
my_diary = Diary.new
entry_1 = DiaryEntry.new("Today", "Test driving a class system")
my_diary.add(entry_1)
my_diary.all # => [["Today", "Test driving a class system"]]

#  15 add and returns 2 diary entries from list
my_diary = Diary.new
entry_1 = DiaryEntry.new("Today", "Test driving a class system")
entry_2 = DiaryEntry.new("Friday", "Debugging")
my_diary.add(entry_1)
my_diary.add(entry_2)
my_diary.all # => [["Today", "I am test driving a class system"], ["Friday", "Debugging"]]


```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._

