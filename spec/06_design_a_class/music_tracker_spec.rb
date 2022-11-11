require '06_design_a_class/music_tracker'

RSpec.describe MusicTracker do

  it "return empty list" do
    music_tracker = MusicTracker.new
    expect(music_tracker.track_list).to eq [] 
  end

  it "add and return a track" do
    music_tracker = MusicTracker.new
    music_tracker.add("Yesterday")
    expect(music_tracker.track_list).to eq ["Yesterday"]
  end

  it "add and return 2 tracks" do
    music_tracker = MusicTracker.new
    music_tracker.add("Yesterday")
    music_tracker.add("Hey Jude")
    expect(music_tracker.track_list).to eq ["Yesterday", "Hey Jude"]
  end

end