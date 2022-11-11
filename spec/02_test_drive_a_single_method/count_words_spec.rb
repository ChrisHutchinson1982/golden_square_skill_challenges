# A method called count_words 
# that takes a string as an argument 
# and returns the number of words in that string.

require '02_test_drive_a_single_method/count_words'

RSpec.describe "count_words method" do
  context "given a empty string" do
    it "returns a 0" do
      result = count_words("")
      expect(result).to eq 0
    end
  end

  context "given one word string" do
    it "returns a 1" do
      result = count_words("Hello")
      expect(result).to eq 1
    end
  end

  context "given five word string" do 
    it "returns a 5" do
      result = count_words("Hello my name is Chris")
      expect(result).to eq 5
    end
  end

  context "given five word string with !" do
    it "returns a 5" do
      result = count_words("Hello! My name is Chris")
      expect(result).to eq 5
    end
  end

  context "given six word string with -" do
    it "returns a 5" do
      result = count_words("Hello! My name is Chris-Hutchinson")
      expect(result).to eq 6
    end
  end
  
end