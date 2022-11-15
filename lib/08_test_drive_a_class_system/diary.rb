class Diary
  def initialize
    @diary = []
  end


  def add(entry) # entry is an instance of DiaryEntry
    @diary << entry
  end

  def all
    @diary
  end

  def count_words
    word_count = 0
    @diary.each do |entry|
      word_count += entry.count_words
    end

    return word_count

  end

  def reading_time(wpm) 
    fail "Error, wpm cannot be 0" if wpm == 0
    words_per_min = count_words.to_f / wpm
    words_per_min.ceil  
  end

  def find_best_entry_for_reading_time(wpm, minutes)

    best_entry = @diary[0]
    max_number_of_words = wpm * minutes
    @diary.each do |entry|
      valid_entry = entry.count_words <= max_number_of_words
      better_entry = entry.count_words > best_entry.count_words
      if valid_entry && better_entry
          best_entry = entry
      end
    end

    fail "All entries too long" if best_entry.count_words > max_number_of_words
    return best_entry

  end

end

