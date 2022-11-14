require "08_test_drive_a_class_system/diary_entry"

RSpec.describe DiaryEntry do

  context "initialize class" do
    it "returns nothing" do
      entry_1 = DiaryEntry.new("Today", "Test driving a class system")
    end
  end
  
  describe "title method" do
    it "returns title" do
      entry_1 = DiaryEntry.new("Today", "Test driving a class system")
      expect(entry_1.title).to eq "Today"
    end
  end

  describe "contents method" do
    it "returns contents" do
      entry_1 = DiaryEntry.new("Today", "Test driving a class system")
      expect(entry_1.contents).to eq "Test driving a class system"
    end
  end

  describe "count_words method" do
    it "returns word count" do
      entry_1 = DiaryEntry.new("Today", "Test driving a class system")
      expect(entry_1.count_words).to eq 5
    end
  end

  describe "reading time method" do
    it "returns reading time when contents is even number of words" do
      entry_1 = DiaryEntry.new("Today", "Test driving a class")
      expect(entry_1.reading_time(1)).to eq 4
    end

    it "returns reading time when contents odd number of words" do
      entry_1 = DiaryEntry.new("Today", "Test driving a class system")
      expect(entry_1.reading_time(2)).to eq 3
    end

    it "returns error when wpm is 0" do
      entry_1 = DiaryEntry.new("Today", "Test driving a class system")
      expect { entry_1.reading_time(0) }.to raise_error "Error, wpm cannot be 0"
    end

  end

  describe "reading_chunk method" do
    it "returns reading_chunk from contents that user can read in a minute" do 
      entry_1 = DiaryEntry.new("Today", "I am feeling great but think sounds tricky!")
      expect(entry_1.reading_chunk(1, 1)).to eq "I"
    end

    it "returns error if wpm is 0" do
      entry_1 = DiaryEntry.new("Today", "Test driving a class system")
      expect { entry_1.reading_time(0, 5) }.to raise_error "Error, wpm or reading time cannot be 0"
    end 

    it "returns error if reading time is 0" do
      entry_1 = DiaryEntry.new("Today", "Test driving a class system")
      expect { entry_1.reading_time(5, 0)}.to raise_error "Error, wpm or reading time cannot be 0"
    end 

    it "returns second reading_chunk from contents that user can read in a minute" do
      entry_1 = DiaryEntry.new("Today", "I am feeling great but think sounds tricky!")
      entry_1.reading_chunk(1,1)
      expect(entry_1.reading_chunk(2,1)).to eq "am feeling"
    end

    it "returns reading_chunk to start if contents more than fully read" do
      entry_1 = DiaryEntry.new("Today", "I am feeling great but think sounds tricky!")
      entry_1.reading_chunk(4,1)
      entry_1.reading_chunk(3,1)
      entry_1.reading_chunk(4,1)
      expect(entry_1.reading_chunk(1,1)).to eq "I"
    end

    it "returns reading_chunk to start if contents equal to fully read" do
      entry_1 = DiaryEntry.new("Today", "I am feeling great but think sounds tricky!")
      entry_1.reading_chunk(4,1)
      entry_1.reading_chunk(3,1)
      entry_1.reading_chunk(1,1)
      expect(entry_1.reading_chunk(1,1)).to eq "I"
    end

  end 


end

