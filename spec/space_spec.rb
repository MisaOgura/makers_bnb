describe Space, driver: :selenium do

  before(:each) do
    Space.create(name: 'space1',
                 description: 'One bedroom flat',
                 price: 75)
  end

  it 'adds a new space to database' do
    expect(Space.all.count).to eq(1)
  end

  it 'should have a name' do
    expect(Space.first.name).to eq('space1')
  end

  it 'should have a short description' do
    expect(Space.first.description).to eq('One bedroom flat')
  end

  it 'should have a price' do
    expect(Space.first.price).to eq(75)
  end
end
