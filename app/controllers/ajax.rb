class SpaceBnB < Sinatra::Base

  get '/user/data' do
    user_data = current_user
                { id: user_data.id,
                  name: user_data.name,
                  username: user_data.username,
                  email: user_data.email}.to_json
  end

  get '/spaces/all' do
    space = Space.last
            { id: space.id,
              name: space.name,
              description: space.description,
              price: space.price,
              available: space.available,
              date: space.date
            }.to_json
  end

  get '/spaces/filter' do
    p session[:first_date]
    p session[:last_date]
    filter = {first_date: session[:first_date],
              last_date:  session[:last_date]
            }.to_json
  end

  get '/requests/received' do
    request = Request.last
              {id: request.id,
               space_name: request.space.name,
               confirmation_status: request.confirmed,
               date: request.date,
               denied_status: request.denied
              }.to_json
  end

end
