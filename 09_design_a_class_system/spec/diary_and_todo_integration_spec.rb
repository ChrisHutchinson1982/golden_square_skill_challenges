require "diary_todo_tracker"
require "diary_entry"
require "todo"

RSpec.describe "diary_todo_tracker_integration" do
  context "returns list of all diary entries" do
    it "when two entries added" do
      diary = DiaryTodoTracker.new
      entry_1 = DiaryEntry.new("entry_1", "One")
      entry_2 = DiaryEntry.new("entry_2", "One Two")
      diary.add_entry(entry_1)
      diary.add_entry(entry_2)
      expect(diary.all_diary).to eq [entry_1, entry_2]
    end
  end

  context "returns list of all todo entries" do
    it "when two entries added" do
      diary = DiaryTodoTracker.new
      task_1 = Todo.new("task_1")
      task_2 = Todo.new("task_2")
      diary.add_task(task_1)
      diary.add_task(task_2)
      expect(diary.all_todo).to eq [task_1, task_2] 
    end
  end

  describe "find_best_entry method" do
    xit "returns best entry when one valid entry" do
      diary = DiaryTodoTracker.new
      entry_1 = DiaryEntry.new("entry_1", "One")
      entry_2 = DiaryEntry.new("entry_2", "One Two")
      diary.add_entry(entry_1)
      diary.add_entry(entry_2)
      expect(diary.find_best_entry(1, 1)).to eq entry_1
    end

    xit "returns best entry when more than one valid entry" do
      diary = DiaryTodoTracker.new
      entry_1 = DiaryEntry.new("entry_1", "One")
      entry_2 = DiaryEntry.new("entry_2", "One Two")
      entry_3 = DiaryEntry.new("entry_3", "One Two Three")
      diary.add_entry(entry_1)
      diary.add_entry(entry_2)
      diary.add_entry(entry_3)
      expect(diary.find_best_entry(2, 1)).to eq entry_2
    end
    
    xit "returns nil when no valid entry" do 
      diary = DiaryTodoTracker.new
      entry_1 = DiaryEntry.new("entry_1", "One Two Three Four")
      entry_2 = DiaryEntry.new("entry_2", "One Two Three Four Five")
      entry_3 = DiaryEntry.new("entry_3", "One Two Three Four Five Six")
      diary.add_entry(entry_1)
      diary.add_entry(entry_2)
      diary.add_entry(entry_3)
      expect(diary.find_best_entry(2, 1)).to eq nil
    end 

    xit "returns error is wpm is 0" do 
      diary = DiaryTodoTracker.new
      entry_1 = DiaryEntry.new("entry_1", "One Two Three Four")
      entry_2 = DiaryEntry.new("entry_2", "One Two Three Four Five")
      entry_3 = DiaryEntry.new("entry_3", "One Two Three Four Five Six")
      diary.add_entry(entry_1)
      diary.add_entry(entry_2)
      diary.add_entry(entry_3)
      expect { diary.find_best_entry(0, 1) }.to raise_error "Wpm or Mins cannot be 0"
    end

    xit "returns error is mins is 0" do
      diary = DiaryTodoTracker.new
      entry_1 = DiaryEntry.new("entry_1", "One Two Three Four")
      entry_2 = DiaryEntry.new("entry_2", "One Two Three Four Five")
      entry_3 = DiaryEntry.new("entry_3", "One Two Three Four Five Six")
      diary.add_entry(entry_1)
      diary.add_entry(entry_2)
      diary.add_entry(entry_3)
      expect { diary.find_best_entry(1, 0) }.to raise_error "Wpm or Mins cannot be 0"
    end

  end



end