require "music_library"
require "track"

RSpec.describe MusicLibrary do
  it "adds and list all tracks" do
    music_library = MusicLibrary.new
    track_1 = Track.new("track 1", "keyword")
    track_2 = Track.new("track 2", "keyword")
    music_library.add(track_1)
    music_library.add(track_2)
    expect(music_library.all).to eq [track_1, track_2]
  end

  it "adds and list all tracks with keyword" do
    music_library = MusicLibrary.new
    track_1 = Track.new("keyword", "track 1")
    track_2 = Track.new("track 2", "keyword")
    track_3 = Track.new("track 3", "artist 3")
    music_library.add(track_1)
    music_library.add(track_2)
    expect(music_library.search("keyword")).to eq [track_1, track_2]
  end    
end