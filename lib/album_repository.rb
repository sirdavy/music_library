class AlbumRepository

def all
  query = 'SELECT * FROM albums;'
  records = DatabaseConnection.exec_params(query, [])
end


def find

end

def create
end



end

