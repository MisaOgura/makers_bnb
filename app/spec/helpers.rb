def sign_up
  User.create(name: name,
              username: username,
              email: email,
              password: password)
end

def doubles
  let(:name) { "Bob" }
  let(:username) { "bob4lyfe" }
  let(:email) { "bob@bobworld.com" }
  let(:password) { "bobiscool1" }

  let(:record) { User.all.first }
end
