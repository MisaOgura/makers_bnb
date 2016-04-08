ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'json'

class SpaceBnB < Sinatra::Base
  enable :sessions
  use Rack::MethodOverride

  get '/' do
    send_file 'app/public/user/new.html'
    @user = User.new
  end

  get '/welcome' do
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
      redirect 'app/public/user/login.html'
    end
  end

  delete '/log-out' do
    session[:user_id] = nil
    redirect '/'
  end

  post '/register' do
    @user = User.new(name: params[:name],
                username: params[:username],
                email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/spaces/new'
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


  post '/spaces' do
    user = User.first
    user.spaces.create(name: params[:space_name],
                       description: params[:description],
                       price: params[:price],
                       date: [params[:start_date], params[:end_date]])
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
              price: space.price,
              date: space.date
            }.to_json
  end

  post '/toggle' do
    space = Space.first
    space.update(available: false)
    space.update(date: [])
    redirect '/spaces/list'
  end

  get '/spaces/filter-list' do
    send_file 'app/public/spaces/filter-list.html'
  end

  post '/spaces/filterdates' do
    session[:first_date] = params[:first_date]
    session[:last_date]  = params[:last_date]

    redirect '/spaces/filter-list'
  end

  get '/spaces/filter' do
    filter = {first_date: session[:first_date],
              last_date:  session[:last_date]
            }.to_json
  end

  helpers do
    def current_user
      current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
