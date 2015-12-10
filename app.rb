require 'sinatra'
require_relative 'config/application'
require 'faker'
require 'pry'
require 'json'

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
  @meetup = Meetup.where(id: params[:id])[0]
  @members = @meetup.users
  erb :'meetups/show'
end

post '/meetups' do
  title = params[:title]
  details = params[:details]
  tags = params[:tags]

  Meetup.create(title: title, details: details, tags: tags)

  redirect '/meetups'
end

post '/meetups/:id' do
  # Membership.create(meetup_id: meetup_id, user_id: user_id )
  erb :'meetups/show'
end

post '/meetups_join.json' do
  content_type :json
  @meetup = Meetup.find(params[:meetup_id])
  @user = User.find(session[:user_id])
  @meetup.users << @user
  { user_id: @user.id }.to_json
end
