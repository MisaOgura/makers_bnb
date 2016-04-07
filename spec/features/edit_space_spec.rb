feature 'Editing space' do
  doubles
  space_doubles

  before do
    register
    add_space
  end

  scenario 'Space-owner can toggle availability' do
    click_button('Unavailable')
    expect(space.available).to eq(false)
    expect(space.date).to eq([])
  end
end
