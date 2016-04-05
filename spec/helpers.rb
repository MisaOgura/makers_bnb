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

def add_space
  visit '/spaces/new'
  fill_in(:name, with: "property1")
  fill_in(:description, with: "one bedroom flat")
  fill_in(:price, with: 75)
  click_button("List this space")
end
