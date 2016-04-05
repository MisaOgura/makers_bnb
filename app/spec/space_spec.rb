require '../app/models/space.rb'

describe Space do

  it 'adds a new space to database' do
    expect{ Space.create }.to change(Space, :count).by(1)
  end

  it 'should have a name' do
    Space.create(name: 'space1')
    expect(Space.first.name).to eq('space1')
  end

  it 'should have a short description' do
    Space.create(name: 'space1',
                 description: 'One bedroom flat')
    expect(Space.first.description).to eq('One bedroom flat')
  end
end
