class Request
  include DataMapper::Resource

  property :id, Serial
  property :date, PgArray, required: true
  property :confirmed, Boolean, default: false
  property :denied, Boolean, default: false

  belongs_to :space
  belongs_to :renter

end
