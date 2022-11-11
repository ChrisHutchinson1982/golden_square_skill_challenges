require "05_test_drive_a_class/grammar_stats"

RSpec.describe GrammarStats do

  context "returns true" do
    it "when string is 'Hello.'" do
      string = GrammarStats.new
      expect(string.check("Hello.")).to eq true
    end

    it "when string is 'Hello?'" do
      string = GrammarStats.new
      expect(string.check("Hello?")).to eq true
    end

    it "when string is 'Hello!'" do
      string = GrammarStats.new
      expect(string.check("Hello!")).to eq true
    end
 
  end

  context "returns false" do
    it "when string is 'hello.'" do
      string = GrammarStats.new
      expect(string.check("hello.")).to eq false
    end

    it "when string is 'Hello'" do
      string = GrammarStats.new
      expect(string.check("Hello")).to eq false
    end
  end

  context "returns % of passed test" do
    it "when 1 tests is pass return 100" do
      string = GrammarStats.new
      string.check("Hello?")
      expect(string.percentage_good).to eq 100
    end  
    it "when 1 tests is pass and other is fail return 50" do
      string = GrammarStats.new
      string.check("Hello?")
      string.check("Hello")
      expect(string.percentage_good).to eq 50
    end 
    
    it "when 2 tests is pass and other is fail return 50" do
      string = GrammarStats.new
      string.check("Hello?")
      string.check("Hello?")
      string.check("Hello")
      expect(string.percentage_good).to eq 67
    end  

  end

end