describe Space do
  doubles
  space_doubles

  let(:first_date) { "11/04/2016" }
  let(:last_date) { "12/04/2016" }

  before do
    sign_up
    add_space
  end

  it 'is available by default on creation' do
    expect(space.available).to eq true
  end

  it 'allows user to set start/end date' do
    expect(space.date).to eq([start_date, end_date])
  end

  it 'does return available spaces' do
    fill_in :first_date, with: first_date
    fill_in :last_date, with: last_date
    click_button 'Find spaces'
    expect(page).to have_content(space_name)
  end
end
