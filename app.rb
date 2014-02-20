require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite:///blog.sqlite3"

get '/' do
  "Hello World"
end
