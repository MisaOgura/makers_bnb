feature "Booking a space" do
  doubles
  space_doubles

  before(:each) do
    register
    add_space
  end

  # scenario "User can see an available space" do
  #   expect(current_path).to eq('/spaces')
  #   within("//div[@class='all_spaces']") do
  #     expect(page).to have_selector(".space")
  #   end
  # end

  scenario 'User can send a booking request on a particular space' do
    click_button('Book this space')
    visit '/requests'
    expect(page.status_code).to eq(200)
    # expect(page).to have_content('Request 1')
  end
end
