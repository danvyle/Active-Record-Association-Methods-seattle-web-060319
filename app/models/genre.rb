class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    self.songs.count
  end

  def artist_count
    self.songs.group(:artist_id).length
  end

  def all_artist_names
    # return an array of strings containing every musician's name
    self.songs.map {|song| song.artist.name}
  end
end
