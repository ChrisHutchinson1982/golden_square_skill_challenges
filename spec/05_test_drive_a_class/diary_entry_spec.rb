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

  it "adds and returns number of words of contents" do
    diary_entry = DiaryEntry.new("Today", "I am feeling great!")
    expect(diary_entry.count_words). to eq 4
  end

  it "adds and returns estimated wpm user can read" do
    diary_entry = DiaryEntry.new("Today", "I am feeling great!")
    expect(diary_entry.reading_time(1)).to eq 4
  end

  it "add and returns reading_chunk from contents that user can read in a minute" do
    diary_entry = DiaryEntry.new("Today", "I am feeling great but think sounds tricky!")
    expect(diary_entry.reading_chunk(1, 1)).to eq "I"
  end

  it "add and returns "" if wpm or minutes is 0" do
    diary_entry = DiaryEntry.new("Today", "I am feeling great but think sounds tricky!")
    expect(diary_entry.reading_chunk(0, 0)).to eq ""
  end

  it "add and returns second reading_chunk from contents that user can read in a minute" do
    diary_entry = DiaryEntry.new("Today", "I am feeling great but think sounds tricky!")
    diary_entry.reading_chunk(1,1)
    expect(diary_entry.reading_chunk(2,1)).to eq "am feeling"
  end

end