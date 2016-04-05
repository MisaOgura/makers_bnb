feature "Adding new space" do
  scenario "User can see name, description and price forms on page" do
    visit '/spaces/new'
    expect(page).to have_field("name")
    expect(page).to have_field("description")
    expect(page).to have_field("price")
    expect(page).to have_button("List this space")
  end

  scenario "User can add a new space with name/desc/price" do
    visit '/spaces/new'
    fill_in(:name, with: "property1")
    fill_in(:description, with: "one bedroom flat")
    fill_in(:price, with: 75)
    expect{ click_button("List this space") }.to change(Space, :count).by(1)
    expect(page).to have_content("Name: property1")
    expect(page).to have_content("Description: one bedroom flat")
    expect(page).to have_content("Price per night: £75")
  end
end
