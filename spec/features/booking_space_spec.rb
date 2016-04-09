feature "Booking a space" do
  doubles
  space_doubles

  before(:each) do
    register
    add_space
  end

  # scenario 'User can send a booking request on a particular space' do
  #   visit '/spaces'
  #   click_button('Book this space')
  #   visit '/requests'
  #   expect(page.status_code).to eq(200)
  # end
end
