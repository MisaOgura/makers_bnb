require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'

class User
  include DataMapper::Resource

  property :id,       Serial
  property :name,     String
  property :username, String
  property :email,    String
  property :password, String

  def self.authenticate(email, password)
    user = first(email: email)
    if user.password == password
      user
    else
      nil
    end
  end
end
DataMapper.setup(:default, "postgres://localhost/spacebnb_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_migrate!
