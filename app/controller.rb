require 'sinatra/base'

class SpaceBnB < Sinatra::Base
  get '/' do
    send_file 'public/user/new.html'
  end

  post '/register' do
    redirect '/welcome'
  end

  get '/welcome' do
    send_file 'public/user/welcome.html'
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
