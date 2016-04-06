require_relative '../app/models/user'
require_relative 'helpers'

describe User do

  doubles

  before do
    sign_up
  end

  it 'adds a user to the database' do
    expect{ User.create }.to change{ User.count }.by(1)
  end

  it 'adds name to user record' do
    expect(record.name).to eq(name)
  end

  it 'adds username to user record' do
    expect(record.username).to eq(username)
  end

  it 'adds email to user record' do
    expect(record.email).to eq(email)
  end

  it 'adds a password to user record' do
    expect(record.password).to eq(password)
  end

end
