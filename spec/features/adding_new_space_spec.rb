require_relative '../helpers'

feature "Adding new space" do

  scenario "User can add a new space with name/desc/price", js: true do
    add_space
    expect(Space.all.count).to eq(1)
    expect(page).to have_content("Name: property1")
    expect(page).to have_content("Description: one bedroom flat")
    expect(page).to have_content("Price per night: £75")
  end
end
