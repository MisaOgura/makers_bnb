require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-postgres-types'

class Space
  include DataMapper::Resource

  property :id,          Serial
  property :name,        String
  property :description, String
  property :price,       Integer
  property :available,   Boolean, default: true
  property :date,        PgArray

end

DataMapper.setup(:default, "postgres://localhost/spacebnb_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_migrate!
