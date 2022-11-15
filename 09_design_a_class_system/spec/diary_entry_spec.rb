require "diary_entry"

RSpec.describe DiaryEntry do
  context "initialize class" do
    it "returns title as string" do 
      entry_1 = DiaryEntry.new("Today", "One")
      expect(entry_1.title).to eq "Today"
    end 
    it "returns contents as string" do
      entry_1 = DiaryEntry.new("Today", "One")
      expect(entry_1.contents).to eq "One"
    end
  end

  describe "count_words method" do
    it "returns word count of contents as integer" do
      entry_1 = DiaryEntry.new("entry_1", "One Two Three Four Five")
      expect(entry_1.count_words).to eq 5
    end 
    
    it "returns 0 if contents is empty" do 
      entry_1 = DiaryEntry.new("entry_1", "")
      expect(entry_1.count_words).to eq 0
    end
  end

end