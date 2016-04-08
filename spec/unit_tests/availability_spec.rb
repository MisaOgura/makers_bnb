describe Space do
  doubles
  space_doubles
  filter_doubles

  before do
    register
    add_space

  end

  it 'is available by default on creation' do
    expect(space.available).to eq true
  end

  it 'allows user to set start/end date' do
    expect(space.date).to eq([start_date, end_date])
  end
end
