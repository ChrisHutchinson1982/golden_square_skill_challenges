require "diary_todo_tracker"
require "diary_entry"
require "todo"

RSpec.describe "diary_todo_tracker_integration" do
  context "returns all diary entries" do
    it "when two entries added" do
      diary = DiaryTodoTracker.new
      entry_1 = DiaryEntry.new("entry_1", "One")
      entry_2 = DiaryEntry.new("entry_2", "One Two")
      diary.add_entry(entry_1)
      diary.add_entry(entry_2)
      expect(diary.all_diary).to eq [entry_1, entry_2]
    end
  end
end