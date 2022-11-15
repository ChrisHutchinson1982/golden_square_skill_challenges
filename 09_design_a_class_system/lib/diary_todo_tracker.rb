class DiaryTodoTracker
  def initialize
    @diary_list = []
    @todo_list = []

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
    @diary_list
  end

  def all_todo
    @todo_list
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
