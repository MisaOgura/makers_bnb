ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/user'

class SpaceBnB < Sinatra::Base
  get '/' do
    send_file 'app/public/user/new.html'
  end

  post '/register' do
    User.create(name: params[:name],
                username: params[:username],
                email: params[:email],
                password: params[:password])
    redirect '/welcome'

  end

  get '/welcome' do #placeholder
    send_file 'app/public/user/welcome.html'
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
