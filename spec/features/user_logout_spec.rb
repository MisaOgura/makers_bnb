feature "user logout" do

  doubles

  before(:each) do
    register
    visit '/welcome'
  end

  scenario 'logging out ends the user\'s session' do
    click_button('Log out')
    expect(page).to have_content('Log in')
    expect(page).not_to have_content("Hey, #{name}")
    expect(current_path).to eq('/')
  end


end
