def sign_up
  User.create(name: name,
              username: username,
              email: email,
              password: password,
              password_confirmation: password_confirmation)
end

def log_in
  visit '/log-in'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button('Log in')
end

def new_space
  Space.create(name: name,
               description: description,
               price: price,
               date: [start_date, end_date])
end

def doubles
  let(:name) { 'Bob' }
  let(:username) { 'bob4lyfe' }
  let(:email) { 'bob@bobworld.com' }
  let(:password) { 'bobiscool1' }
  let(:password_confirmation) { 'bobiscool1' }

  let(:record) { User.first }
end

def space_doubles
  let(:name) { 'property1'}
  let(:description) { 'one bedroom flat'}
  let(:price) { 75 }
  let(:available) { true }
  let(:start_date) { '10/04/2016' }
  let(:end_date) { '15/04/2016' }

  let(:space) { Space.all.first }
end

def add_space
  visit '/spaces/new'
  fill_in :name, with: name
  fill_in :description, with: description
  fill_in :price, with: price
  fill_in :start_date, with: start_date
  fill_in :end_date, with: end_date
  click_button 'List this space'
end

def register
  visit '/'
  fill_in :name, with: name
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Submit'
end

def wrong_pw_conf
  visit '/'
  fill_in :name, with: name
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: "wrong"
  click_button 'Submit'
end

def wrong_email_format
  visit '/'
  fill_in :name, with: name
  fill_in :username, with: username
  fill_in :email, with: "email@email"
  fill_in :password, with: password
  fill_in :password_confirmation, with: password
  click_button 'Submit'
end

def duplicate_username
  visit '/'
  fill_in :name, with: name
  fill_in :username, with: username
  fill_in :email, with: "email@email.com"
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Submit'
end

def no_email
  visit '/'
  fill_in :name, with: name
  fill_in :username, with: username
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Submit'
end

def no_username
  visit '/'
  fill_in :name, with: name
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Submit'
end

def no_name
  visit '/'
  fill_in :email, with: email
  fill_in :username, with: username
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Submit'
end

def register_and_add_space
  register
  add_space
end

def request_no_user
  Request.create(date: ["12/04/2015", "14/04/2015"])
end

def request_no_space
  register
  Request.create(date: ["12/04/2015", "14/04/2015"])
end

def request_no_dates
  register_and_add_space
  space.requests.create(date: nil)
end

def request_no_renter
  register_and_add_space
  space.requests.create(date: ["12/04/2015", "14/04/2015"])
end

def correct_request
  register_and_add_space
  Renter.last
  request = Renter.last.requests.new(date: ["12/04/2015", "14/04/2015"])
  request.space_id = space.id
  request.user_id = space.user.id
  request.save
end
