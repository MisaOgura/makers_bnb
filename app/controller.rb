ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/space'
require 'json'

class SpaceBnB < Sinatra::Base
  get '/spaces/new' do
    send_file 'app/public/spaces/new.html'
  end

  post '/spaces' do
    Space.create(name: params[:name],
                 description: params[:description],
                 price: params[:price])
    p Space.all
    redirect '/spaces/list'
  end

  get '/spaces/list' do
    send_file 'app/public/spaces/list.html'
  end

  get '/spaces/all' do
    # response.headers['Access-Control-Allow-Origin'] = '*'
    space = Space.first
    { id: space.id,
      name: space.name,
      description: space.description,
      price:space.price
    }.to_json
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
