require_relative "artist.rb"

class ArtistRepository

  def all
    query = "SELECT * FROM artists"
    records = DatabaseConnection.exec_params(query, [])
    records.map do |record|
      artist = Artist.new
      artist.name = record["name"]
      artist.genre = record["genre"]
      artist.id = record["id"]
      artist
    end
  end

end