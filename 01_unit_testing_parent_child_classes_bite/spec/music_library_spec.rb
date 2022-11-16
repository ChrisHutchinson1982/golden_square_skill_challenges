require "music_library"

RSpec.describe MusicLibrary do
  it "adds and list all tracks" do
    music_library = MusicLibrary.new
    fake_track_1 = double :track
    fake_track_2 = double :track
    music_library.add(fake_track_1)
    music_library.add(fake_track_2)
    expect(music_library.all).to eq [fake_track_1, fake_track_2]
  end
  
end