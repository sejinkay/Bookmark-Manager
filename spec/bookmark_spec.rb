require 'bookmark.rb'

describe Bookmark do
  describe '.all' do
    it 'returns the list of bookmarks' do
      connection = PG.connect :dbname => 'bookmark_manager_test'

      connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.google.co.uk/');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.sanger.dk/');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('https://makers.tech/');")

      bookmarks = Bookmark.all
      expect(bookmarks).to include("https://www.google.co.uk/")
      expect(bookmarks).to include("http://www.sanger.dk/")
      expect(bookmarks).to include("https://makers.tech/")
    end
  end
end
