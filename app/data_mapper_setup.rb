require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'
require 'dm-postgres-types'
require 'bcrypt'

require_relative 'models/user'
require_relative 'models/renter'
require_relative 'models/space'
require_relative 'models/request'

DataMapper.setup(:default, "postgres://localhost/spacebnb_#{ENV['RACK_ENV']}")
DataMapper.finalize
if ENV['RACK_ENV'] == 'test'
  DataMapper.auto_migrate!
end
