require_relative "./album"

class AlbumRepository
  def all
    albums = []
    sql = "SELECT id, title, release_year, artist_id FROM albums;"
    result_set = DatabaseConnection.exec_params(sql, [])
    result_set.each { |record| albums << album_inflate(record) }
    return albums
  end

  def find(id)
    sql = "SELECT * FROM albums WHERE id = $1"
    sql_params = [id]
    result_set = DatabaseConnection.exec_params(sql, sql_params)
    record = result_set[0]
    return album_inflate(record)
  end

  def create(album)
    sql =
      "INSERT INTO 
          albums (title, release_year, artist_id) 
          VALUES ($1, $2, $3);"
    sql_params = [album.title, album.release_year, album.artist_id]
    DatabaseConnection.exec_params(sql, sql_params)
  end

  private

  def album_inflate(record)
    album = Album.new
    album.id = record["id"].to_i
    album.title = record["title"]
    album.release_year = record["release_year"].to_i
    album.artist_id = record["artist_id"].to_i
    return album
  end
end
