class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    self.new_by_name(name)
  end

  def self.find_by_name(name)
    self.all.find{ | song | song.name == name }
  end

  def self.find_or_create_by_name(name)
    name_found = self.find_by_name(name)
    name_found != nil ? name_found : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by!{|song| song.name}
  end

  def self.new_from_filename(filename)
    artist_and_song_names = filename.chomp(".mp3").split(" - ")
    song = self.create
    song.artist_name = artist_and_song_names[0]
    song.name = artist_and_song_names[1]
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end