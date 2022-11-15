class DiaryTodoTracker
  def initialize
    @diary_list = []
    @todo_list = []

  end

  def add_entry(diary_entry) 
    @diary_list << diary_entry
  end

  def add_task(task)
    @todo_list << task
  end

  def all_diary
    @diary_list
  end

  def all_todo
    @todo_list
  end
  
  def find_best_entry(wpm, mins)
    
    fail "Invalid entry due to missing information" if wpm == 0 || mins == 0 || @diary_list == []
    best_entry = @diary_list[0]
    max_number_of_words = wpm * mins
    @diary_list.each do |entry|
      valid_entry = entry.count_words <= max_number_of_words
      better_entry = entry.count_words > best_entry.count_words
      if valid_entry && better_entry
          best_entry = entry
      end
    end

    best_entry.count_words > max_number_of_words ? nil : best_entry

  end

  def list_phone_numbers 
    # Returns a list of phone numbers extracted from all diary entries
  end 

end
