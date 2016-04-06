ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/space'
require_relative 'models/user'
require 'json'

class SpaceBnB < Sinatra::Base
  enable :sessions

  get '/' do
    send_file 'app/public/user/new.html'
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
      redirect 'app/public/user/login.html'
    end
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
    p params[:start_date], params[:end_date]
    Space.create(name: params[:name],
                 description: params[:description],
                 price: params[:price],
                 date: [params[:start_date], params[:end_date]])
    p Space.first.date
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

  # start the server if ruby file executed directly
>>>>>>> master
  run! if app_file == $0
end
