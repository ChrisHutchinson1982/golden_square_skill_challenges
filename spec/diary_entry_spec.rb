require 'diary_entry'

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


end