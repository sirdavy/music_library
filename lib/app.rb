require_relative 'album_repository' #'./lib/album_repository'
require_relative 'artist_repository' #'./lib/artist_repository'
require 'database_connection'

class Application

  # The Application class initializer
  # takes four arguments:
  #  * The database name to call `DatabaseConnection.connect`
  #  * the Kernel object as `io` (so we can mock the IO in our tests)
  #  * the AlbumRepository object (or a double of it)
  #  * the ArtistRepository object (or a double of it)
  def initialize(database_name, io, album_repository, artist_repository)
    DatabaseConnection.connect(database_name)
    @io = io
    @album_repository = album_repository
    @artist_repository = artist_repository
  end

  def run
    @io.puts "Welcome to the music library manager!

      What would you like to do?
       1 - List all albums
       2 - List all artists
      
      Enter your choice:"
    user_input = @io.gets.chomp 
    if user_input == "1"
      @io.puts "Here is the list of albums:
      * 1 - Doolittle
      * 2 - Surfer Rosa
      * 3 - Waterloo
      * 4 - Super Trouper
      * 5 - Bossanova
      * 6 - Lover
      * 7 - Folklore
      * 8 - I Put a Spell on You
      * 9 - Baltimore
      * 10 -	Here Comes the Sun
      * 11 - Fodder on My Wings
      * 12 -	Ring Ring"
    elsif user_input == "2"
      @io.puts "Here is the list of artists:  
      * 1 Pixies         - Rock
      * 2 ABBA           - Pop
      * 3 Taylor Swift   - Pop
      * 4 Nina Simone    - Pop
      * 5 Massive Attack - Alternative
      * 6 Steely Dan     - Yacht Rock"
    else
      @io.puts "That is not a valid input. Try again"
    end
    # "Runs" the terminal application
    # so it can ask the user to enter some input
    # and then decide to run the appropriate action
    # or behaviour.

    # Use `@io.puts` or `@io.gets` to
    # write output and ask for user input.
  end
  
end


# Welcome to the music library manager!

# What would you like to do?
#  1 - List all albums
#  2 - List all artists

# Enter your choice: 1
# [ENTER]

# Here is the list of albums:
#  * 1 - Doolittle
#  * 2 - Surfer Rosa
#  * 3 - Waterloo
#  * 4 - Super Trouper
#  * 5 - Bossanova
#  * 6 - Lover
#  * 7 - Folklore
#  * 8 - I Put a Spell on You
#  * 9 - Baltimore
#  * 10 -	Here Comes the Sun
#  * 11 - Fodder on My Wings
#  * 12 -	Ring Ring





# Don't worry too much about this if statement. It is basically saying "only
# run the following code if this is the main file being run, instead of having
# been required or loaded by another file.
# If you want to learn more about __FILE__ and $0, see here: https://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Variables_and_Constants#Pre-defined_Variables
if __FILE__ == $0
  app = Application.new(
    'music_library',
    Kernel,
    AlbumRepository.new,
    ArtistRepository.new
  )
  app.run
end




##################################################################################
# DatabaseConnection.connect('music_library')

# album_repository = AlbumRepository.new

# album = album_repository.find(3)

# # test = album_repository.all.sort_by { |hash| hash.id.to_i } #sorts returned array by descending id
# # test.each do |album|
#   puts "#{album.id}".ljust(3) + "- #{album.title}".ljust(25) + "#{album.artist_id}".ljust(5)

# # end



# # test = album_repository.all.map do |album| album.id.to_i
# # end

# # test2 = test.sort

# # test2.all.each do |album|
# #   puts "#{album.id}".ljust(4) + "- #{album.title}".ljust(25) + "#{album.artist_id}".ljust(5)
# # end

# # album_repository.all.each do |album|
# # p album


