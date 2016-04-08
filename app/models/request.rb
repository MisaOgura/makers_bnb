class Request
  include DataMapper::Resource

  property :id, Serial
  property :user_id, Integer, required: true
  property :renter_id, Integer, required: true
  property :space_id, Integer, required: true
  property :date, PgArray, required: true
  property :confirmed, Boolean, default: false

end
