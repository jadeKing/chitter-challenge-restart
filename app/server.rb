require 'sinatra'
require 'data_mapper'
require_relative 'modals/post'
require_relative 'modals/user'

require_relative './data_mapper_setup'

enable :sessions
set :session_secret, 'super secret'

get '/' do
  @posts = Post.all
  erb :index
end

get '/users/new' do
  @user = User.new
  erb :'users/new'
end

post '/users' do
  @user = User.create(name: params[:name],
                      username: params[:username],
                      email: params[:email],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation])
  if @user.save
    session[:user_id] = @user.id
    redirect to('/')
  else
    erb :'users/new'
  end
end

helpers do

  def current_user
    @current_user ||= User.get(session[:user_id]) if session[:user_id]
  end

end
