describe Space do
  space_doubles

  before do
    new_space
  end

  it 'is available by default on creation' do
    expect(space.available).to eq true
  end

  it 'allows user to set start/end date' do
    p space.date
    expect(space.date).to eq([start_date, end_date])
  end
end
