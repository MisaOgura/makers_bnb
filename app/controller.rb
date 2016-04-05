require 'sinatra/base'

class SpaceBnB < Sinatra::Base
  get '/' do
    'Hello SpaceBnB!'
  end

  get '/space/new' do
    redirect 'space_new.html'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
