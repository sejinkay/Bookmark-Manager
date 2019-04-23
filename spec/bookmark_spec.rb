require 'bookmark.rb'

describe Bookmark do
  describe '.all' do
    it 'returns the list of bookmarks' do
      bookmarks = Bookmark.all
      expect(bookmarks).to include("https://www.google.co.uk/")
      expect(bookmarks).to include("http://www.sanger.dk/")
      expect(bookmarks).to include("https://makers.tech/")
    end
  end
end
