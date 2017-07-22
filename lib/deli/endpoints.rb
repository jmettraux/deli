
get '/' do

  slim :index
end

get '/new' do

  slim :new
end

post '/new' do

  if params[:action] == 'Submit'

    halt 403 unless params[:secret] == File.read('var/.secret').strip

    if Deli::Storage.save(session, params)
      redirect '/'
    else
      slim :new
    end

  else

    redirect '/'
  end
end

