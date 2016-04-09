ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'json'

class SpaceBnB < Sinatra::Base
  require_relative 'server'
  require_relative 'controllers/users'
  require_relative 'controllers/spaces'
  require_relative 'controllers/requests'

  get '/' do
    send_file 'app/public/user/new.html'
  end
end
