class User
  include DataMapper::Resource

  property :id,       Serial
  property :name,     String
  property :username, String
  property :email,    String
  property :password, String

  has n, :spaces

  def self.authenticate(email, password)
    user = first(email: email)
    if user.password == password
      user
    else
      nil
    end
  end
end
