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

describe Bookmark do
  describe '.add_bookmark' do
    it 'adds a new bookmark' do
      connection = PG.connect :dbname => 'bookmark_manager_test'

      Bookmark.add_bookmark("https://www.google.co.uk/")
      Bookmark.add_bookmark("http://www.sanger.dk/")
      Bookmark.add_bookmark("https://makers.tech/")

      bookmarks = Bookmark.all
      expect(bookmarks).to include("https://www.google.co.uk/")
      expect(bookmarks).to include("http://www.sanger.dk/")
      expect(bookmarks).to include("https://makers.tech/")
    end
  end
end
