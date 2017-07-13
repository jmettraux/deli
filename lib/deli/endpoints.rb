
get '/' do

  slim :index
end

get '/new' do

  slim :new
end

post '/new' do

  Deli::Storage.save(env, params) if params[:action] == 'Submit'

  slim :index
end

