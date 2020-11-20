class Song
  attr_accessor :song, :artist_name
  attr_writer :name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end
  def name()
    name = song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    check = nil
    @@all.each do |song|
      if song.name == name
        check = song
        return check
      end
    end
    check
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end
  def self.new_from_filename(filename)
    artist_and_song = filename.split(".").first
    artist_and_song = artist_and_song.split(" - ")
    artist = artist_and_song[0]
    song = artist_and_song[1]
    new_song = Song.new
    new_song.name = song
    new_song.artist_name = artist
    new_song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

  def self.destroy_all
    @@all = []
  end

end

