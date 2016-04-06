require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'
require 'dm-postgres-types'
require_relative 'models/user'
require_relative 'models/space'

DataMapper.setup(:default, "postgres://localhost/spacebnb_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_migrate!
