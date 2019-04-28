require 'sinatra/base'
require_relative 'lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/' do
    erb(:'welcome')
  end

  post '/add' do
    erb(:'bookmarks/add')
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:'bookmarks/index')
  end

  post '/bookmarks' do
    Bookmark.add_bookmark(params[:title], params[:address])
    redirect to '/bookmarks'
  end

  run! if app_file == $0
end
