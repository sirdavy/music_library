require "album_repository"
require "album"

RSpec.describe AlbumRepository do
  def reset_albums_table
    seed_sql = File.read("spec/seeds_albums.sql")
    connection = PG.connect({ host: "127.0.0.1", dbname: "music_library_test" })
    connection.exec(seed_sql)
  end

  before(:each) { reset_albums_table }

  it "returns two albums" do
    repo = AlbumRepository.new
    albums = repo.all
    expect(albums.length).to eq(2)
    expect(albums[0].id).to eq "1"
    expect(albums[0].title).to eq "Thriller"
    expect(albums[0].release_year).to eq "1981"
    expect(albums[0].artist_id).to eq "1"
    expect(albums[1].id).to eq "2"
    expect(albums[1].title).to eq "Off The Wall"
    expect(albums[1].release_year).to eq "1978"
    expect(albums[1].artist_id).to eq "1"
  end
end

# albums[1].id # =>  2
# albums[1].title # =>  'Off The Wall'
# albums[1].release_year # =>  '1978'
# albums[1].artist_id # =>  '1'

# # 2
# # Get a single album

# repo = AlbumsRepository.new

# album = repo.find(1)

# album.id # =>  1
# album.name # =>  'Thriller'
# album.release_year # =>  '1981'
# album.artist_id # =>  '1'

# # 3
# # takes an album as an argument and adds it to the database
# repo = AlbumsRepository.new
# new_album = Album.new
# new_album.title = 'Bad'
# new_album.release_year = '1987'
# new_album.artist_id = '1'
# # new_album.id not certain about whether this is necessary or if table assigns it
# repo.create(new_album)
# expect(repo.all) # => []
