feature 'Editing space', js: true, driver: :poltergeist do
  doubles
  space_doubles

  before do
    register
    add_space
  end

  scenario 'Space-owner can toggle availability' do
    visit '/spaces/list'
    click_button('Unavailable')
    expect(space.available).to eq(false)
    expect(space.date).to eq([])
  end
end
