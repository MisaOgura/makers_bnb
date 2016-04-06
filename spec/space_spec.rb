describe Space, driver: :selenium do

  space_doubles

  before do
    new_space
  end

  it 'adds a new space to database' do
    expect(Space.all.count).to eq(1)
  end

  it 'should have a name' do
    expect(space.name).to eq name
  end

  it 'should have a short description' do
    expect(space.description).to eq description
  end

  it 'should have a price' do
    expect(space.price).to eq price
  end
end
