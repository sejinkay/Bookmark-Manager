require 'pg'

class Bookmark

  def self.all
    connection = PG.connect :dbname => 'bookmark_manager', :user => 'student'
    result = connection.exec "SELECT * FROM bookmarks"
    # [
    #   "https://www.google.co.uk/",
    #   "http://www.sanger.dk/",
    #   "https://makers.tech/"
    # ]
  end
end
