# File: lib/music_library.rb

class MusicLibrary
  def initialize
    @music_library = []
  end

  def add(track)
    @music_library << track
  end

  def all
    @music_library
  end
  
  def search(keyword) # keyword is a string
    return @music_library.filter(&:keyword)
  end
end