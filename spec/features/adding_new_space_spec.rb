feature "Adding new space", js: true, driver: :poltergeist do
  space_doubles

  scenario "User can add a new space with name/desc/price" do
    add_space
    expect(Space.all.count).to eq(1)
    expect(page.status_code).to eq(200)
  end
end
