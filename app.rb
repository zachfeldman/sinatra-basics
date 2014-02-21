require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite:///blog.sqlite3"

require './models'

get '/' do
  "Hello World"
end
