require 'sinatra/base'

class Bookmark_Manager < Sinatra::Base

  get '/' do
    "Hello, Bookmark Manager!"
  end

end
