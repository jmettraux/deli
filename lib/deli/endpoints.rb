
get '/' do

  last_modified(Deli::Storage.mtime) unless session['_flash_success']
  slim :index
end

get '/new' do

  params[:ohref] = params[:href]
  params[:href] = Deli.sanitize(params[:href])

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

