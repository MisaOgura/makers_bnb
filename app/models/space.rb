require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'

class Space
  include DataMapper::Resource

  property :id, Serial


end

DataMapper.setup(:default, "postgres://localhost/spacebnb_test")
DataMapper.finalize
DataMapper.auto_migrate!
