class Artist

@@all = []

  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def self.all
    @@all
  end

  def save
    @@all << self
    self
  end

  def self.create_by_name(n)
    self.new(n).save
  end

  def self.find_by_name(n)
    all.find{|artist| artist.name == n}
  end

  def self.find_or_create_by_name(n)
    self.find_by_name(n) ? self.find_by_name(n) : self.create_by_name(n)
  end

  def print_songs
    @songs.each {|song| puts song.name}
  end


end
