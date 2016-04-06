def sign_up
  User.create(name: name,
              username: username,
              email: email,
              password: password)
end

def new_space
  Space.create(name: name,
               description: description,
               price: price)
end

def doubles
  let(:name) { 'Bob' }
  let(:username) { 'bob4lyfe' }
  let(:email) { 'bob@bobworld.com' }
  let(:password) { 'bobiscool1' }

  let(:record) { User.all.first }
end

def space_doubles
  let(:name) { 'property1'}
  let(:description) { 'one bedroom flat'}
  let(:price) { 75 }

  let(:space) { Space.all.first }
end

def add_space
  visit '/spaces/new'
  fill_in :name, with: name
  fill_in :description, with: description
  fill_in :price, with: price
  click_button 'List this space'
end

def register
  visit '/'
  fill_in :name, with: name
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Submit'
end
