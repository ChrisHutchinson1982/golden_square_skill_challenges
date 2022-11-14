require "08_test_drive_a_class_system/diary_entry"
require "08_test_drive_a_class_system/diary"

RSpec.decribe "Diary Integration" do

  it "returns 1 diary entry from list" do 
    my_diary = Diary.new
    entry_1 = DiaryEntry.new("Today", "Test driving a class system")
    my_diary.add(entry_1)
    expect(my_diary.all).to eq [["Today", "Test driving a class system"]]
  end 


  it "returns 2 diary entries from list" do 
    my_diary = Diary.new
    entry_1 = DiaryEntry.new("Today", "Test driving a class system")
    entry_2 = DiaryEntry.new("Friday", "Debugging")
    my_diary.add(entry_1)
    my_diary.add(entry_2)
    expect(my_diary.all).to eq [["Today", "I am test driving a class system"], ["Friday", "Debugging"]]
  end 

end
