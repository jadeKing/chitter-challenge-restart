describe User do
  it 'gets added to the database' do
    described_class.create(name: 'Jade',
                           username: 'jd',
                           email: 'test@test.com',
                           password: 'test',
                           password_confirmation: 'test')
    expect(described_class.count).to eq(1)
  end
end
