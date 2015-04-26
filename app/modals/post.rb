class Post

  include DataMapper::Resource

  property :id, Serial
  property :message, Text
  property :user_id, Integer
  property :created_at, DateTime

end
