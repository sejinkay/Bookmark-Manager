require 'pg'

class Bookmark

  def self.all
    if ENV['RACK_ENV'] = 'test'
    connection = PG.connect :dbname => 'bookmark_manager_test'
  else
    connection = PG.connect :dbname => 'bookmark_manager'
  end
  
    result = connection.exec "SELECT * FROM bookmarks"
    result.field_values('url')
  end
end
