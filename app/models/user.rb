require 'data_mapper'
require 'dm-postgres-adapter'

class User
  include DataMapper::Resource

  property :id,       Serial
  property :name,     String
  property :username, String
  property :email,    String
  property :password, Text
end

DataMapper.setup(:default, "postgres://localhost/spacebnb_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_migrate!