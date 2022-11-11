class MusicTracker
  def initialize
    @track_list = []
  end

  def add(track) # track is a string
    @track_list << track
  end

  def track_list
    # Returns list of tracks
    @track_list
  end
end