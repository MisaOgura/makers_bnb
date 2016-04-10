class SpaceBnB < Sinatra::Base

  get '/requests' do
    send_file 'app/public/requests/requests.html'
  end

  post '/requests/new' do
    p params[:space_id]
    space = Space.get(params[:space_id])
    dates = params[:request_book].split(', ').each {|date| date.sub!(" ", "") }.uniq
    renter = current_renter
    request = renter.requests.new(date: dates)
    request.user_id = space.user.id
    request.space_id = space.id
    request.save
    redirect '/requests'
  end

  post '/requests/confirm' do
    request = Request.get(params[:request_id])
    request.update(confirmed: true)
    request.space.update(available: false)
    redirect '/requests'
  end

  post '/requests/deny' do
    request = Request.get(params[:request_id])
    request.update(denied: true)
    redirect '/requests'
  end

end
