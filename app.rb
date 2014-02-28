require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite:///blog.sqlite3"
set :sessions, true

require './models'


require 'bundler/setup' 
require 'rack-flash'
enable :sessions
use Rack::Flash, :sweep => true



def current_user
  #if someone is signed in
  if session[:user_id]
    User.find(session[:user_id])
  else
    nil
  end
  #return their user object
  #otherwise, return nil
end


get '/' do
  @user = current_user
  erb :sign_in
end

post '/sessions/new' do

  #look up the user in the database
  @user = User.where(email: params[:email]).first
  if @user && @user.password == params[:password]
      flash[:notice] = "You've been signed in successfully."
      session[:user_id] = @user.id
      #then have the app remember that their logged in
  else
    flash[:notice] = "There was a problem signing you in."
  end
  #if they exist, check their password
  


  redirect '/'
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end


get '/users/:id/addresses' do
	@user = User.find(params[:id])
	erb :addresses
end


get '/users/new' do
  erb :signup
end

post '/users/new' do
  User.create(params[:user])
end

