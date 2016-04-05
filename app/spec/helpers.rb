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

def register
  visit '/'
  fill_in :name, with: name
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Submit'
end
