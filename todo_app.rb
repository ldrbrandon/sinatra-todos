$LOAD_PATH.unshift(File.expand_path('.'))

require 'sinatra'
require 'sinatra/activerecord'
require 'shotgun'
require 'models/todo'

begin
# This loads environment variables from the .env file
require 'dotenv'
Dotenv.load
rescue LoadError
end


set :database, ENV['DATABASE_URL']

get '/' do
  @todos = Todo.where("completed = 'f'")
  @todones = Todo.where("completed = 't'")
  erb :index
end

post '/' do
  Todo.create(:name => params["todos"])
  redirect '/'
end

post '/complete/*' do
  p to_complete = Todo.find(params[:splat]).first
  p to_complete.completed = 't'
  p to_complete.save
  redirect '/'
end

#######################
#### Hey cricket I couldn't figure out why this wouldn't work
#### I created a method to change the @completed variable
#### but apparently it isn't registering :/ good luck!
