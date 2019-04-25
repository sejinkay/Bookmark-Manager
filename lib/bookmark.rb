require 'pg'

class Bookmark

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect :dbname => 'bookmark_manager_test'
    else
      connection = PG.connect :dbname => 'bookmark_manager'
    end

    result = connection.exec "SELECT * FROM bookmarks"
    result.field_values('url')
  end

  def self.add_bookmark(address)
    @address = address
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect :dbname => 'bookmark_manager_test'
    else
      connection = PG.connect :dbname => 'bookmark_manager'
    end

    connection.exec("INSERT INTO bookmarks (url) VALUES ('#{@address}');")
  end
end
