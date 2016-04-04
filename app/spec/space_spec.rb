require '../app/models/space.rb'

describe Space do

  it 'adds a new space to database' do
    expect{ Space.create }.to change(Space, :count).by(1)
  end
end
