require 'sinatra/base'

class SpaceBnB < Sinatra::Base
  get '/' do
    'Hello SpaceBnB!'
  end

  get '/spaces/new' do
    redirect 'spaces_new.html'
  end

  post '/spaces' do
    Space.create(name: params[:name],
                 description: params[:description],
                 price: params[:price])
    redirect '/spaces/list'
  end

  get '/spaces/list' do
    redirect 'spaces_list.html'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
