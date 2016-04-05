feature 'Sign Up' do
  scenario 'directs user to sign up page' do
    visit '/'
    click_button 'Sign Up'
    expect(page).to have_content('Welcome! Fill in your details below.')
  end
end
