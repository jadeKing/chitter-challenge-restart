feature 'list all posts' do
  before(:each) do
    Post.create(message: 'My first post',
                user_id: 1)
  end

  scenario 'when on the homepage' do
    visit '/'
    expect(page).to have_content('My first post')
  end
end
