require 'sinatra'
require 'data_mapper'
require_relative './modals/post'
require_relative './data_mapper_setup'

get '/' do
  @posts = Post.all
  erb :index
end
