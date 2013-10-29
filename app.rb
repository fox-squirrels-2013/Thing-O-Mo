require 'sinatra'
require 'active_record'
require_relative 'app/models/game'

ActiveRecord::Base.establish_connection(adapter: 'postgresql', database: 'sinatra_skeleton_dev')

get '/' do
	@name = Game.name
  erb :index
end

get '/create' do
	erb :create
end

post '/create' do
	Game.create(:name => ("#{params[:name]}"))
end
