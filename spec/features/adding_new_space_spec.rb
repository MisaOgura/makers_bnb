feature "Adding new space" do
  doubles
  space_doubles

  before do
    register
    add_space
  end

  scenario "User can add a new space with name/desc/price" do
    expect(Space.all.count).to eq(1)
    expect(page.status_code).to eq(200)
  end
end
