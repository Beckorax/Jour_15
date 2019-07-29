
require 'gossip'

class ApplicationController < Sinatra::Base

  get '/' do
  	erb :index, locals: {gossips: Gossip.all}
  end

 get '/gossips/new/' do
  	erb :new_gossip
  end

# ton super code qui enregistre un gossip en fonction de params
	post '/gossips/new/' do
  Gossip.new(params["gossip_author"], params["gossip_content"]).save
  redirect '/'
	end

  # affiche un potin de manière unique via son id
  get '/gossips/:id' do
    erb :show, locals: {id: params['id'].to_i, gossips: Gossip.find(params['id'].to_i)}
  end

  # permet d'éditer avec le formualaire edit.erb
  get '/gossips/:id/edit' do
    erb :edit, locals: {id: params['id'].to_i, gossips: Gossip.find(params['id'].to_i)}
  end

  # récupère la saisie dans le formualaire pour update le potin
  post '/gossips/edit/' do
    Gossip.update(params['id'].to_i,params["gossip_author"], params["gossip_content"])
    redirect '/'
  end

end