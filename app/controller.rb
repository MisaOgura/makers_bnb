ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'json'

class SpaceBnB < Sinatra::Base
  enable :sessions
  use Rack::MethodOverride

  get '/' do
    send_file 'app/public/user/new.html'
    # @user = User.new
  end

  get '/welcome' do #placeholder
    send_file 'app/public/user/welcome.html'
  end

  get '/log-in' do
    send_file 'app/public/user/login.html'
  end

  post '/log-in' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/welcome'
    else
      # flash error
      redirect '/log-in'
    end
  end

  delete '/log-out' do
    session[:user_id] = nil
    redirect '/'
  end

  post '/register' do
    user = Renter.create(name: params[:name],
                username: params[:username],
                email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])

    user = User.create(name: params[:name],
                username: params[:username],
                email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect '/spaces'
    else
      redirect '/'
    end
  end

  get '/user/data' do
    user_data = User.first
                { id: user_data.id,
                  name: user_data.name,
                  username: user_data.username,
                  email: user_data.email}.to_json
  end

  get '/spaces/new' do
    send_file 'app/public/spaces/new.html'
  end

  get '/spaces' do
    send_file 'app/public/spaces/index.html'
  end

  post '/spaces/new' do
    user = current_user
    user.spaces.create(name: params[:name],
                description: params[:description],
                price: params[:price],
                date: [params[:start_date], params[:end_date]])
    redirect '/spaces'
  end

  get '/spaces/list' do
    send_file 'app/public/spaces/list.html'
  end

  get '/spaces/all' do
    space = Space.last
            { id: space.id,
              name: space.name,
              description: space.description,
              price: space.price,
              date: space.date
            }.to_json
  end

  post '/toggle' do
    space = Space.last
    space.update(available: false)
    space.update(date: [])
    redirect '/spaces/list'
  end

  post '/space/book' do
    space = Space.get(params[:book])
    redirect '/space/book'
  end

  get '/space/book' do
    send_file 'app/public/spaces/booking.html'
  end

  get '/requests' do
  end

  post '/requests/new' do
    p user = current_user
    p renter = current_renter
    space = Space.get(params[:space_id])
    dates = params[:request_book].split(', ').each {|date| date.sub!(" ", "") }.uniq
    redirect '/requests'
  end

  helpers do
    def current_user
      current_user ||= User.get(session[:user_id])
    end

    def current_renter
      current_renter ||= Renter.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
