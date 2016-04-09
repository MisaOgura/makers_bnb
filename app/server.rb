class SpaceBnB < Sinatra::Base
  enable :sessions
  use Rack::MethodOverride

  helpers do
    def current_user
      current_user ||= User.get(session[:user_id])
    end

    def current_renter
      current_renter ||= Renter.get(session[:user_id])
    end
  end
end
