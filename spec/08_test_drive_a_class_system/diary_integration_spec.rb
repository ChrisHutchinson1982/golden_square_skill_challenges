require "08_test_drive_a_class_system/diary_entry"
require "08_test_drive_a_class_system/diary"

RSpec.describe "Diary Integration" do

  it "returns 1 diary entry from list" do 
    my_diary = Diary.new
    entry_1 = DiaryEntry.new("Today", "Test driving a class system")
    my_diary.add(entry_1)
    expect(my_diary.all).to eq [entry_1]
  end 


  it "returns 2 diary entries from list" do 
    my_diary = Diary.new
    entry_1 = DiaryEntry.new("Today", "Test driving a class system")
    entry_2 = DiaryEntry.new("Friday", "Debugging")
    my_diary.add(entry_1)
    my_diary.add(entry_2)
    expect(my_diary.all).to eq [entry_1, entry_2]
  end 

  describe "count_words method" do

    xit "returns word count from single entry" do 
      my_diary = Diary.new
      entry_1 = DiaryEntry.new("Today", "Test driving a class system")
      my_diary.add(entry_1)
      expect(my_diary.count_words).to eq 5
    end 

    xit "returns word count from mutiple entries" do 
      my_diary = Diary.new
      entry_1 = DiaryEntry.new("Today", "Test driving a class system")
      entry_2 = DiaryEntry.new("Friday", "Debugging")
      my_diary.add(entry_1)
      my_diary.add(entry_2)
      expect(my_diary.count_words).to eq 6
    end 

  end


end
