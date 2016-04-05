ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/space'

class SpaceBnB < Sinatra::Base
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
    send_file 'public/spaces/list.html'
  end

  get '/spaces/all' do
    # response.headers['Access-Control-Allow-Origin'] = '*'
    allspaces = Space.first.name
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
