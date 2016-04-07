# require_relative '../../app/models/user'
require_relative '../helpers'

feature 'User logs in' do

  doubles


  scenario 'takes user to log in page' do
    visit '/'
    click_button 'Log in'
    expect(page).to have_content("Enter your username and password to log in")
  end

end
