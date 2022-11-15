require "diary_todo_tracker"

RSpec.describe DiaryTodoTracker do
  context "initialize class" do
    it "returns empty diary list" do
      diary = DiaryTodoTracker.new
      expect(diary.all_diary).to eq []
    end
    it "returns empty todo list" do
      diary = DiaryTodoTracker.new
      expect(diary.all_todo).to eq []
    end
    xit "returns nil for best entry when no diary entries" do 
      diary = DiaryTodoTracker.new
      diary.find_best_entry(1, 1) # => nil
    end
    xit "returns empty phone number list when no diary entries" do
      diary = DiaryTodoTracker.new
      diary.list_phone_numbers  # => []
    end
  end
end