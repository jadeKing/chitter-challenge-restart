require 'bcrypt'
class User

  include DataMapper::Resource
  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_uniqueness_of :username
  validates_uniqueness_of :email

  property :id, Serial
  property :name, String
  property :username, String, unique: true
  property :email, String, unique: true
  property :password_digest, Text

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
