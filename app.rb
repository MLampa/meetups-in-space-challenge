require 'sinatra'
require_relative 'config/application'
require 'faker'
require 'pry'

helpers do
  def current_user
    user_id = session[:user_id]
    @current_user ||= User.find(user_id) if user_id.present?
  end
end

get '/' do
  redirect '/meetups'
end

get '/auth/github/callback' do
  user = User.find_or_create_from_omniauth(env['omniauth.auth'])
  session[:user_id] = user.id
  flash[:notice] = "You're now signed in as #{user.username}!"

  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

  redirect '/'
end

get '/meetups' do
  @meetups = Meetup.order(title: :desc)
  erb :'meetups/index'
end

get '/meetups/:id' do
  @meetup = Meetup.where(id: params[:id])
  erb :'meetups/show'
end
