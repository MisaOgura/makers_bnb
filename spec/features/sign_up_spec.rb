require_relative '../helpers'
feature 'Sign Up' do
  doubles

  scenario 'directs user to sign up page' do
    visit '/'
    expect(page).to have_content('Welcome! Fill in your details below.')
  end

  scenario 'requires user details' do
    register
    expect(current_path).to eq '/spaces/new'
    # expect(page).to have_content('Thanks, you have been signed up!')
  end

  scenario 'saves user in database' do
    register
    expect(User.count).to be(1)
    expect(record.name).to eq name
  end

  scenario 'user must provide a valid password on sign up' do
    expect{ wrong_pw_conf }.not_to change(User, :count)
    expect(current_path).to eq('/')
  end
end
