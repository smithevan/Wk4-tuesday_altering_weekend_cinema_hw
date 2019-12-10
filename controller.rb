require 'sinatra'
require 'sinatra/contrib/all'
require 'pry'

require_relative('./models/film')
also_reload('./models/*')

get '/index' do
  @films = Film.all()
  erb(:index)
end
