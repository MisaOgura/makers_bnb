describe Renter do
  doubles

  before(:each) do
    register
  end

  it 'can create a new renter' do
    expect(Renter.first.name).to eq(name)
  end

  it 'authenticates user sign in when given a valid email and password' do
    authenticated_user = Renter.authenticate(email, password)
    expect(authenticated_user).to eq Renter.last
  end

  it 'raises error when credentials are invalid' do
    authenticated_user = Renter.authenticate(email, "wrong")
    expect(authenticated_user).to eq nil
  end
end
