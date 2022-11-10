require 'grammar_checker'

# As a user
# So that I can improve my grammar
# I want to verify that a text starts with a capital letter and 
# ends with a suitable sentence-ending punctuation mark.

RSpec.describe "grammar checker method" do
  
  context "returns true" do
    it "when string is 'Hello.'" do
      result = grammar_checker("Hello.")
      expect(result).to eq true
    end

    it "when string is 'Hello?'" do
      result = grammar_checker("Hello?")
      expect(result).to eq true
    end

    it "when string is 'Hello!'" do
      result = grammar_checker("Hello!")
      expect(result).to eq true
    end
 
  end

  context "returns false" do
    it "when string is 'hello.'" do
      result = grammar_checker("hello.")
      expect(result).to eq false
    end

    it "when string is 'Hello'" do
      result = grammar_checker("Hello")
      expect(result).to eq false
    end
  end

  context "returns fail" do
    it "when nil" do
      expect { grammar_checker(nil) }.to raise_error "Invalid nil value"
    end

    it "when string is ''" do
      expect { grammar_checker("")}.to raise_error "Invalid nil value"
    end
  end

end