feature 'User signs up' do
  scenario 'when they visit for the first time' do
    sign_up
    expect(User.first.email).to eq('test@test.com')
    expect(page).to have_content('Welcome, jd')
  end

  def sign_up(name = 'Jade', username = 'jd',
              email = 'test@test.com',
              password = 'test',
              password_confirmation = 'test')
    visit 'users/new'
    fill_in :name, with: name
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button('Sign up')
  end

end
