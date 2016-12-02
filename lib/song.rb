class Song

  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    new_song = self.new(filename)
    new_song.name= filename.split(" - ")[1]
    new_song.artist= Artist.find_or_create_by_name(filename.split(" - ").first)
    new_song
  end
end
