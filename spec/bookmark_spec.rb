require 'bookmark.rb'

describe Bookmark do
  describe '.all' do
    it 'returns the list of bookmarks' do
      connection = PG.connect :dbname => 'bookmark_manager_test'

      connection.exec("INSERT INTO bookmarks (title, url) VALUES ('Google', 'https://www.google.co.uk/');")
      connection.exec("INSERT INTO bookmarks (title, url) VALUES ('Pug', 'http://www.sanger.dk/');")
      connection.exec("INSERT INTO bookmarks (title, url) VALUES ('Makers', 'https://makers.tech/');")

      bookmarks = Bookmark.all
      expect(bookmarks.first.title).to eq 'Google'
      expect(bookmarks.first.url).to eq 'https://www.google.co.uk/'
    end
  end
end

describe Bookmark do
  describe '.add_bookmark' do
    it 'adds a new bookmark' do
      bookmark = Bookmark.add_bookmark('Pug', 'http://www.sanger.dk/')
      persisted_data = PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM bookmarks WHERE id = #{bookmark.id};")

      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.title).to eq 'Pug'
      expect(bookmark.url).to eq 'http://www.sanger.dk/'
    end
  end
end
