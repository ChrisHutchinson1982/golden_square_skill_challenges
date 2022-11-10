require 'reading_time'

RSpec.describe "give an estimate of someone's reading time in minutes" do

  it "returns 0 for an empty string" do
    result = reading_time("")
    expect(result).to eq 0
  end

  it "returns 1 for 200 words" do
    words = ("hello " * 200).chop
    result = reading_time(words)
    expect(result).to eq 1
  end

  it "returns 2 for 400 words" do
    words = ("hello " * 400).chop
    result = reading_time(words)
    expect(result).to eq 2
  end

  it "returns 1 for 299 words" do
    words = ("hello " * 299).chop
    result = reading_time(words)
    expect(result).to eq 1
  end

  it "returns 2 for 300 words" do
    words = ("hello " * 300).chop
    result = reading_time(words)
    expect(result).to eq 2
  end

  it "returns error if nil" do
    expect { reading_time(nil) }.to raise_error "Invalid nil entry"
  end

end