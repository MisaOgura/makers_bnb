class SpaceBnB < Sinatra::Base

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
  
end
