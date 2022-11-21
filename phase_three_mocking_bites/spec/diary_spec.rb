require "diary"

RSpec.describe Diary do
  it "contructs" do
    diary_entry = Diary.new("Hello world")
    expect(diary_entry.read).to eq "Hello world"
  end
end