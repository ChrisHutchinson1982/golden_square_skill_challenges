require 'string_checker'

# As a user
# So that I can keep track of my tasks
# I want to check if a text includes the string #TODO.

RSpec.describe "checks if the string includes '#TODO'" do

  context "returns true" do
    it "string is equal to '#TODO'" do
      result = string_checker("#TODO")
      expect(result).to eq true
    end

    it "string includes '#TODO" do
      result = string_checker("#TODO hello")
      expect(result).to eq true
    end
  end
 
  context "returns false" do
    it "string doesn't include '#TODO'" do
      result = string_checker("hello")
      expect(result).to eq false
    end
    
    it "string is empty" do
      result = string_checker("")
      expect(result).to eq false
    end
  end

  context "it fails" do
    it "if nil" do
      expect { string_checker(nil) }.to raise_error "Invalid nil entry"
    end
  end
end