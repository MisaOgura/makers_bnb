feature 'Editing space' do
  space_doubles

  scenario 'Space-owner can tggle availability' do
    add_space
    click_button('Unavailable')
    expect(space.available).to eq(false)
    expect(space.date).to eq([])
  end
end
