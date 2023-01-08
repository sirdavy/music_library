require 'app'

RSpec.describe Application do 
  it 'gives the user a list of albums when they input 1' do
    io = double :io
    test1 = Application.new('music_library', io, AlbumRepository.new, ArtistRepository.new )
    expect(io).to receive(:puts).with("Welcome to the music library manager!

      What would you like to do?
       1 - List all albums
       2 - List all artists
      
      Enter your choice:")
    expect(io).to receive(:gets).and_return("1")
    expect(io).to receive(:puts).with("Here is the list of albums:
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
      * 12 -	Ring Ring")
    test1.run
  end

 
  it 'gives the user a list of artists when they input 2' do
    io = double :io
    test1 = Application.new('music_library', io, AlbumRepository.new, ArtistRepository.new )
    expect(io).to receive(:puts).with("Welcome to the music library manager!

      What would you like to do?
       1 - List all albums
       2 - List all artists
      
      Enter your choice:")
    expect(io).to receive(:gets).and_return("2")
    expect(io).to receive(:puts).with("Here is the list of artists:  
      * 1 Pixies         - Rock
      * 2 ABBA           - Pop
      * 3 Taylor Swift   - Pop
      * 4 Nina Simone    - Pop
      * 5 Massive Attack - Alternative
      * 6 Steely Dan     - Yacht Rock")
    test1.run
  end

  it 'gives the user an error and restarts' do
    io = double :io
    test1 = Application.new('music_library', io, AlbumRepository.new, ArtistRepository.new )
    expect(io).to receive(:puts).with("Welcome to the music library manager!

      What would you like to do?
       1 - List all albums
       2 - List all artists
      
      Enter your choice:")
    expect(io).to receive(:gets).and_return("3")
    expect(io).to receive(:puts).with("That is not a valid input. Try again")
    test1.run
  end


end
  # expect(io).to receive(:puts).with("Welcome to the music library manager!

  # What would you like to do?
  #  1 - List all albums
  #  2 - List all artists
  # Enter your choice:")
  # expect(io).to receive(:gets).and_return("1")
  # expect(io).to receive(:puts).with("bananas")
#   end
# end
