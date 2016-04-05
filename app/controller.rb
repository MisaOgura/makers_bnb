require 'sinatra/base'

class SpaceBnB < Sinatra::Base
  get '/' do
    send_file 'public/spaces/new.html'
  end

  get '/spaces/new' do
    send_file 'public/spaces/new.html'
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
