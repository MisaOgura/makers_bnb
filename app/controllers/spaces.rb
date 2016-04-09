class SpaceBnB < Sinatra::Base

  get '/spaces/new' do
    send_file 'app/public/spaces/new.html'
  end

  get '/spaces' do
    send_file 'app/public/spaces/index.html'
  end

  post '/spaces/new' do
    user = current_user
    user.spaces.create(name: params[:space_name],
                description: params[:description],
                price: params[:price],
                date: [params[:start_date], params[:end_date]])
    redirect '/spaces'
  end

  get '/spaces/list' do
    send_file 'app/public/spaces/list.html'
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


  get '/spaces/filter-list' do
    send_file 'app/public/spaces/filter-list.html'
  end

  post '/spaces/filterdates' do
    session[:first_date] = params[:first_date]
    session[:last_date]  = params[:last_date]

    redirect '/spaces/filter-list'
  end

end
