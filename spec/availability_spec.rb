describe Space do
  space_doubles

  before do
    new_space
  end

  it 'is available by default on creation' do
    expect(space.available).to eq true
  end
end
