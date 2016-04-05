require_relative '../helpers'
feature 'Sign Up' do
  doubles

  scenario 'directs user to sign up page' do
    visit '/'
    expect(page).to have_content('Welcome! Fill in your details below.')
  end

  scenario 'requires user details' do
    visit '/'
    fill_in :name, with: name
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Submit'
    expect(page).to have_content('Thanks, you have been signed up!')
  end
end
