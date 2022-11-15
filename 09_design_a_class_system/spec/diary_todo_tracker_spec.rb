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
    it "returns error for best entry when no diary entries" do 
      diary = DiaryTodoTracker.new
      expect { diary.find_best_entry(1, 1) } .to raise_error "Invalid entry due to missing information"
    end
    xit "returns empty phone number list when no diary entries" do
      diary = DiaryTodoTracker.new
      diary.list_phone_numbers  # => []
    end
  end
end