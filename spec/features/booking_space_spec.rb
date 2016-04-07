feature "Booking a space" do
  doubles
  space_doubles

  before(:each) do
    register
    add_space
  end

  scenario "User can see an available space" do
    expect(current_path).to eq('/spaces')
    within("//div[@class='all_spaces']") do
      expect(page).to have_selector(".space")
    end
  end
end
