require '05_test_drive_a_class/diary_entry'

RSpec.describe DiaryEntry do
  
  it "adds and returns a string of the title" do
    diary_entry = DiaryEntry.new("Today", "I am feeling great!")
    expect(diary_entry.title).to eq "Today"
  end

  it "adds and returns a string contents" do
    diary_entry = DiaryEntry.new("Today", "I am feeling great!")
    expect(diary_entry.contents).to eq "I am feeling great!"
  end

  describe "@count_words" do
    it "returns number of words of contents" do
      diary_entry = DiaryEntry.new("Today", "I am feeling great!")
      expect(diary_entry.count_words). to eq 4
    end

    it "returns 0 when of contents when empty" do
      diary_entry = DiaryEntry.new("Today", "")
      expect(diary_entry.count_words). to eq 0
    end
  end

  describe "@reading_time" do
    it "returns estimated wpm user can read" do
      diary_entry = DiaryEntry.new("Today", "I am feeling great!")
      expect(diary_entry.reading_time(1)).to eq 4
    end

    it "returns 0 when of contents when empty" do
      diary_entry = DiaryEntry.new("Today", "")
      expect(diary_entry.reading_time(1)).to eq 0
    end

    it "returns error when of wpm when empty" do
      diary_entry = DiaryEntry.new("Today", "I am feeling great!")
      expect { diary_entry.reading_time(0) }.to raise_error "Error, wpm cannot be 0 or nil"
    end

    it "returns error when of wpm when nil" do
      diary_entry = DiaryEntry.new("Today", "I am feeling great!")
      expect { diary_entry.reading_time(nil) }.to raise_error "Error, wpm cannot be 0 or nil"
    end
    
  end 

  describe "@reading_chunk" do
    it "add and returns reading_chunk from contents that user can read in a minute" do
      diary_entry = DiaryEntry.new("Today", "I am feeling great but think sounds tricky!")
      expect(diary_entry.reading_chunk(1, 1)).to eq "I"
    end

    it "returns error if wpm or minutes is 0" do
      diary_entry = DiaryEntry.new("Today", "I am feeling great but think sounds tricky!")
      expect { diary_entry.reading_chunk(0, 0) }.to raise_error "Error, wpm or minutes cannot be 0 or nil"
    end

    it "returns error if wpm or minutes is nil" do
      diary_entry = DiaryEntry.new("Today", "I am feeling great but think sounds tricky!")
      expect { diary_entry.reading_chunk(nil, nil) }.to raise_error "Error, wpm or minutes cannot be 0 or nil"
    end

    it "add and returns second reading_chunk from contents that user can read in a minute" do
      diary_entry = DiaryEntry.new("Today", "I am feeling great but think sounds tricky!")
      diary_entry.reading_chunk(1,1)
      expect(diary_entry.reading_chunk(2,1)).to eq "am feeling"
    end

    it "dd and returns third reading_chunk from contents that user can read in a minute" do
      diary_entry = DiaryEntry.new("Today", "I am feeling great but think sounds tricky!")
      diary_entry.reading_chunk(4,1)
      diary_entry.reading_chunk(3,1)
      expect(diary_entry.reading_chunk(4,1)).to eq "tricky!"
    end

    it "returns reading_chunk to start if contents more than fully read" do
      diary_entry = DiaryEntry.new("Today", "I am feeling great but think sounds tricky!")
      diary_entry.reading_chunk(4,1)
      diary_entry.reading_chunk(3,1)
      diary_entry.reading_chunk(4,1)
      expect(diary_entry.reading_chunk(1,1)).to eq "I"
    end

    it "returns reading_chunk to start if contents equal to fully read" do
      diary_entry = DiaryEntry.new("Today", "I am feeling great but think sounds tricky!")
      diary_entry.reading_chunk(4,1)
      diary_entry.reading_chunk(3,1)
      diary_entry.reading_chunk(1,1)
      expect(diary_entry.reading_chunk(1,1)).to eq "I"
    end
  end

end