
get '/' do

  last_modified Deli::Storage.mtime
  slim :index
end

options '/' do

  session[:origin] = env['HTTP_ORIGIN']
p [ :options, session ]
  response['Access-Control-Allow-Origin'] = session[:origin]
  response['Access-Control-Allow-Methods'] = 'POST'
  response['Access-Control-Allow-Headers'] = 'Accept, Content-Type'
  #response['Access-Control-Max-Age'] = '1728000'

  ''
end

post '/' do

p [ :post, session ]
  session[:mark] = JSON.load(request.body.read)
  response['Access-Control-Allow-Origin'] = session[:origin]

  ''
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

