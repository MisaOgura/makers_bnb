feature "Adding new space" do
  scenario "User can see name, description and price forms on page" do
    visit '/space/new'
    expect(page).to have_field("name")
    expect(page).to have_field("description")
    expect(page).to have_field("price")
    expect(page).to have_button("List this space")
  end
end
