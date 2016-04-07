feature 'Editing space' do
  doubles
  space_doubles

  before do
    sign_up
    add_space
  end

  scenario 'Space-owner can tggle availability' do
    click_button('Unavailable')
    expect(space.available).to eq(false)
    expect(space.date).to eq([])
  end
end
