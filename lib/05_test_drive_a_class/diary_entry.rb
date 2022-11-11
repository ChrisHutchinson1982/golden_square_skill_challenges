class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    @title = title
    @contents = contents
    @starting_index = 0
  end

  def title
    # Returns the title as a string
    @title
  end

  def contents
    # Returns the contents as a string
    @contents
  end

  def count_words
    # Returns the number of words in the contents as an integer
    @contents.split.count
  end

  def reading_time(wpm) 
    # wpm is an integer representing the number of words the
    # user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # for the contents at the given wpm.
    words_per_min = @contents.split(" ").count.to_f / wpm
    words_per_min.round
  end

  def reading_chunk(wpm, minutes) 
    # `wpm` is an integer representing the number
    # of words the user can read per minute
    # `minutes` is an integer representing the
    # number of minutes the user has to read
    # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.

    return "" if wpm == 0 || minutes == 0
    
    number_of_words = (wpm * minutes)

    output = @contents.split(" ")[@starting_index...(@starting_index + number_of_words)].join(" ")
    @starting_index = number_of_words

    return output
  end

end