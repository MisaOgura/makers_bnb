describe Renter do

  before(:each) do
    @renter = Renter.create(name: "Yas",
                            username: 'YasNotJas',
                            email: 'yasmin@green.com',
                            password: 'vertically challenged',
                            password_confirmation: 'vertically challenged')
  end

  it 'can create a new renter' do
    expect(Renter.first.name).to eq('Yas')
  end

  it 'authenticates user sign in when given a valid email and password' do
    authenticated_user = Renter.authenticate(@renter.email, @renter.password)
    expect(authenticated_user).to eq @renter
  end

  it 'raises error when credentials are invalid' do
    authenticated_user = Renter.authenticate(@renter.email, "wrong")
    expect(authenticated_user).to eq nil
  end
end
