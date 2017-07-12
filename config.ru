
require 'sinatra'
#require 'slim'

$: << 'lib'
require 'deli'


configure do

  set :show_exceptions, true

  set :root, File.dirname(__FILE__)

  set :static, true
  set :public_folder, 'public'

  set :views, 'app/views'

  #set :slim, pretty: true, indent: ''

  set :protection, :except => [ :json_csrf ]

  use Rack::Session::Pool,
    expire_after: 4 * 3600, # 4 hours
    key: "deli_#{Time.now.to_f}",
    same_site: :strict
end

run Sinatra::Application

