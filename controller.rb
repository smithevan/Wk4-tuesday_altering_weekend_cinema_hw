require 'sinatra'
require 'sinatra/contrib/all'
require 'pry'

require_relative('./models/film')
also_reload('./models/*')

get '/films' do
  @films = Film.all()
  erb(:index)
end
