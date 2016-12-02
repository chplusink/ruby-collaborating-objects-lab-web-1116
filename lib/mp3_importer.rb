require "pry"

class MP3Importer

  attr_reader :path
# Dir["/path/to/search/*"]

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(path)[2..-1]
  end

  def import
    files.each do |file|
      artist = Artist.find_or_create_by_name(file.split(" - ").first) # get artist
      artist.songs << Song.new_by_filename(file) # shovel new song into artist's songs array
    end
  end

end
