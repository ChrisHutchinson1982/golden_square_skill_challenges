# {{music_tracker}} Class Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

As a user
So that I can keep track of my music listening
I want to add tracks I've listened to and see a list of them.

## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby
# EXAMPLE

class MusicTracker
  def initialize
    # empty array
  end

  def add(track) # track is a string
    # No return value
  end

  def track_list
    # Returns list of tracks
  end
end
```

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations._

```ruby
# EXAMPLE

# 1 return empty list
music_tracker = MusicTracker.new
music_tracker.track_list # returns []

# 2 add and return a track
music_tracker = MusicTracker.new
music_tracker.add("Yesterday")
music_tracker.track_list # returns ["Yesterday"]

# 3 add and return 2 tracks
music_tracker = MusicTracker.new
music_tracker.add("Yesterday")
music_tracker.add("Hey Jude")
music_tracker.track_list # returns ["Yesterday", "Hey Jude"]

```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
