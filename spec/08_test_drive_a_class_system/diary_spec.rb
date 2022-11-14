require "08_test_drive_a_class_system/diary"

RSpec.describe Diary do
  context "initialize class" do
    it "returns empty array" do
      my_diary = Diary.new
      expect(my_diary.all).to eq []
    end
  end
end