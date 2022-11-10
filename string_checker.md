# {{grammar_checker}} Method Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

As a user
So that I can improve my grammar
I want to verify that a text starts with a capital letter and ends with a suitable sentence-ending punctuation mark.

## 2. Design the Method Signature

```ruby
# EXAMPLE

# `reading_time` outputs an estimate of reading time in minutes

grammar_check = grammar_checker(text)
text: a string
grammar_check: outputs boolean (true or false)

# The method doesn't print anything or have any other side-effects
```

## 3. Create Examples as Tests

_Make a list of examples of what the method will take and return._

```ruby
# EXAMPLE

grammar_checker("Hello.") => true
grammar_checker("hello.") => false
grammar_checker("Hello") => false
grammar_checker("Hello?") => true
grammar_checker("Hello!") => true
grammar_checker("") => "This text is empty."
grammar_checker(nil) => "This text is empty."


```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
