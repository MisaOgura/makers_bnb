ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/space'
require_relative 'models/user'
require 'json'

class SpaceBnB < Sinatra::Base

  get '/' do
    send_file 'app/public/user/new.html'
  end

  post '/register' do
    User.create(name: params[:name],
                username: params[:username],
                email: params[:email],
                password: params[:password])
    redirect '/spaces/new'

  end

  # get '/welcome' do #placeholder
  #   send_file 'app/public/user/welcome.html'
  # end

  get '/spaces/new' do
    send_file 'app/public/spaces/new.html'
  end

  post '/spaces' do
    Space.create(name: params[:name],
                 description: params[:description],
                 price: params[:price])
    redirect '/spaces/list'
  end

  get '/spaces/list' do
    send_file 'app/public/spaces/list.html'
  end

  get '/spaces/all' do
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
