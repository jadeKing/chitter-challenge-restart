feature 'User signs up' do
  scenario 'when they visit for the first time' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(User.first.email).to eq('test@test.com')
    expect(page).to have_content('Welcome, jd')
  end
end
