class Space
  include DataMapper::Resource

  property :id,          Serial
  property :name,        String
  property :description, String
  property :price,       Integer
  property :available,   Boolean, default: true
  property :date,        PgArray

end
