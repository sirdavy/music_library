require_relative 'lib/database_connection'
require_relative 'lib/album_repository'

DatabaseConnection.connect('music_library')

album_repository = AlbumRepository.new

test = album_repository.all.sort_by { |hash| hash.id.to_i }

test.each do |album|
  puts "#{album.id}".ljust(3) + "- #{album.title}".ljust(25) + "#{album.artist_id}".ljust(5)

end



# test = album_repository.all.map do |album| album.id.to_i
# end

# test2 = test.sort

# test2.all.each do |album|
#   puts "#{album.id}".ljust(4) + "- #{album.title}".ljust(25) + "#{album.artist_id}".ljust(5)
# end

# album_repository.all.each do |album|
# p album


