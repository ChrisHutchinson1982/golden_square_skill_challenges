# {{Reading Timer}} Method Design Recipe

## 1. Describe the Problem

_As a user
So that I can manage my time
I want to see an estimate of reading time for a text, assuming that I can read 200 words a minute._

## 2. Design the Method Signature

_Include the name of the method, its parameters, return value, and side effects._

```ruby
# `reading_timer` extracts reading time for a text when can read 200 words a minute

reading_time = reading_timer(text)
text: a string
reading_time: a string that outputs time in mins and secs

# The method doesn't print anything or have any other side-effects
```

## 3. Create Examples as Tests

_Make a list of examples of what the method will take and return._

```ruby

reading_timer("") => "0 secs"
reading_timer("One two three four five six seven eight nine ten") => "3 secs"
reading_timer("One two three four five six seven eight nine ten eleven twelve thirteen fourteen fifthteen") => "4.5 secs"
reading_timer("One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten") => "1 mins"
reading_timer("One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten") => "1 mins 3 secs"
reading_timer("One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten One two three four five six seven eight nine ten") => "2 mins 3 secs"
reading_timer(nil) throws an error
```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._

