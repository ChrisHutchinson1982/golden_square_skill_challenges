require "track"

RSpec.describe Track do
  it "outputs true with keyword in artist" do
    track_1 = Track.new("track 1", "keyword")
    expect(track_1.matches?("keyword")).to eq true
  end

  it "outputs true with keyword in title" do
    track_1 = Track.new("keyword", "artist 1")
    expect(track_1.matches?("keyword")).to eq true
  end

  it "outputs false when no keyword in title" do
    track_1 = Track.new("track 1", "artist 1")
    expect(track_1.matches?("keyword")).to eq false
  end
end