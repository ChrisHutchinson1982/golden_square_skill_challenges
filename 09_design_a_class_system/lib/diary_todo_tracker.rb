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
    max_number_of_words = wpm * mins
    valid_entry = @diary_list.filter {|entry| entry if entry.count_words <= max_number_of_words}
    
    best_entry = valid_entry.sort_by(&:count_words).last

  end

  def list_phone_numbers 
    # Returns a list of phone numbers extracted from all diary entries
    contents_array = []
    @diary_list.each do |diary_entry|
      contents_array << diary_entry.contents
    end

    phone_numbers = contents_array.join(" ").scan(/[0-9]{11}/).uniq

  end 

end
