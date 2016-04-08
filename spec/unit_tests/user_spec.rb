describe User do

  before(:each) do
    @user = User.create(name: "Tina",
                username: "T_Turnip",
                email: "tina@turnip.com",
                password: "t1na1sc00l",
                password_confirmation: "t1na1sc00l")
  end

  it 'can create a new user' do
    expect(User.first.name).to eq "Tina"
  end

  it 'authenticates user sign in when given a valid email and password' do
    authenticated_user = User.authenticate(@user.email, @user.password)
    expect(authenticated_user).to eq @user
  end

  it 'raises error when credentials are invalid' do
    authenticated_user = User.authenticate(@user.email, "wrong")
    expect(authenticated_user).to eq nil
  end

end
