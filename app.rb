require 'sinatra'
require 'active_record'
require_relative 'app/models/game'

ActiveRecord::Base.establish_connection(adapter: 'postgresql', database: 'sinatra_skeleton_dev')

get '/' do
	@name = Game.name
  erb :index
end

get '/new' do
	erb :new
end

post '/create' do
	Game.create(:name => ("#{params[:name].strip}"))
	erb :created_page
end

get '/read' do
	erb :read
end

get '/edit' do
	erb :edit
end

post '/edit_games' do
	game = Game.find_by(name: "#{params[:oname]}") 
	game.update(name: "#{params[:nname]}")
	erb :edited_game
end

get '/delete' do
	erb :delete
end

post '/delete_games' do
	Game.find_by(name: "#{params[:name]}").destroy
	erb :deleted_game
end