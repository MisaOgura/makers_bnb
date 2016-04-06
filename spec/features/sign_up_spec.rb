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

  scenario 'Cannot sign up without an email address' do
    expect{ no_email }.not_to change(User, :count)
  end

  scenario 'Cannot sign up without username' do
    expect{ no_username }.not_to change(User, :count)
  end

  scenario 'Cannot sign up without name' do
    expect{ no_name }.not_to change(User, :count)
  end

  scenario 'Cannot sign up without an invalid email address' do
    expect{ wrong_email_format }.not_to change(User, :count)
  end

  scenario 'Cannot sign up with an existing email address' do
    sign_up
    expect{ sign_up }.not_to change(User, :count)
  end

  scenario 'Cannot sign up with existing username' do
    sign_up
    expect{ duplicate_username }.not_to change(User, :count)
  end

end
