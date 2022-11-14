class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    @title = title
    @contents = contents
    @starting_index = 0
  end

  def title
    @title
  end

  def contents
    @contents
  end

  def count_words
    @contents.split.count
  end

  def reading_time(wpm)
    fail "Error, wpm cannot be 0" if wpm == 0
    words_per_min = @contents.split(" ").count.to_f / wpm
    words_per_min.ceil
  end

  def reading_chunk(wpm, minutes)
    fail "Error, wpm or reading time cannot be 0" if wpm == 0 || minutes == 0
    number_of_words = (wpm * minutes)
    first_word = @starting_index
    last_word = @starting_index + number_of_words
    printed_reading_chunk = @contents.split(" ")[first_word...last_word].join(" ")

    @starting_index += number_of_words 
    @starting_index = 0 if @starting_index >= count_words

    return printed_reading_chunk

  end

end
