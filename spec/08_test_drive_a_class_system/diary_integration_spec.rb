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

    it "returns word count from single entry" do 
      my_diary = Diary.new
      entry_1 = DiaryEntry.new("Today", "Test driving a class system")
      my_diary.add(entry_1)
      expect(my_diary.count_words).to eq 5
    end 

    it "returns word count from mutiple entries" do 
      my_diary = Diary.new
      entry_1 = DiaryEntry.new("Today", "Test driving a class system")
      entry_2 = DiaryEntry.new("Friday", "Debugging")
      my_diary.add(entry_1)
      my_diary.add(entry_2)
      expect(my_diary.count_words).to eq 6
    end 

  end

  describe "reading_time method" do
      it "returns reading time for single entry" do
        my_diary = Diary.new
        entry_1 = DiaryEntry.new("Today", "Test driving a class system")
        my_diary.add(entry_1)
        expect(my_diary.reading_time(1)).to eq 5
      end

      it "returns reading time for mutiple entries" do
        my_diary = Diary.new
        entry_1 = DiaryEntry.new("Today", "Test driving a class system")
        entry_2 = DiaryEntry.new("Friday", "Debugging")
        my_diary.add(entry_1)
        my_diary.add(entry_2)
        expect(my_diary.reading_time(1)).to eq 6
      end

  end

  describe "find_best_entry_for_reading_time method" do
      it "returns correct instance for two entries when both are below the total words" do 
        my_diary = Diary.new
        entry_1 = DiaryEntry.new("Today", "one two three four five")
        entry_2 = DiaryEntry.new("Friday", "six")
        my_diary.add(entry_1)
        my_diary.add(entry_2)
        expect(my_diary.find_best_entry_for_reading_time(5, 1)).to eq entry_1
      end

      it "returns correct instance for two entries when one is over the total words" do 
        my_diary = Diary.new
        entry_1 = DiaryEntry.new("Today", "one two three four five")
        entry_2 = DiaryEntry.new("Friday", "one two three four five six seven eight nine ten")
        my_diary.add(entry_1)
        my_diary.add(entry_2)
        expect(my_diary.find_best_entry_for_reading_time(4, 2)).to eq entry_1
      end

      it "returns correct instance for three entries" do 
        my_diary = Diary.new
        entry_1 = DiaryEntry.new("Today", "one two three four five")
        entry_2 = DiaryEntry.new("Friday", "one two three four five six")
        entry_3 = DiaryEntry.new("Monday", "one two three four five six seven eight nine ten")
        my_diary.add(entry_1)
        my_diary.add(entry_2)
        my_diary.add(entry_3)
        expect(my_diary.find_best_entry_for_reading_time(4, 2)).to eq entry_2
      end

      it "returns fail if no instances are below or equal to the total words" do 
        my_diary = Diary.new
        entry_1 = DiaryEntry.new("Today", "one two three four five")
        entry_2 = DiaryEntry.new("Friday", "one two three four five six")
        entry_3 = DiaryEntry.new("Monday", "one two three four five six seven eight nine ten")
        my_diary.add(entry_1)
        my_diary.add(entry_2)
        my_diary.add(entry_3)
        expect{ my_diary.find_best_entry_for_reading_time(1, 2)}.to raise_error "All entries too long"
      end

  end   


end
