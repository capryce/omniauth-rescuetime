require 'bundler/setup'
require 'sinatra/base'
require 'omniauth-rescuetime'

class App < Sinatra::Base
  get '/auth/:provider/callback' do
    <<-HTML
    <html>
    <head>
      <title>Rescue Time Oauth2</title>
    </head>
    <body>
      <h3>Authorized</h3>
      <p>Token: #{request.env['omniauth.auth']['credentials']['token']}</p>
    </body>
    </html>
    HTML
  end

  get '/auth/failure' do
    <<-HTML
    <html>
    <head>
      <title>Rescue Time Oauth2</title>
    </head>
    <body>
      <h3>Failed Authorization</h3>
      <p>Message: #{params[:message]}</p>
    </body>
    </html>
    HTML
  end
end

use Rack::Session::Cookie

use OmniAuth::Builder do
  provider :rescuetime, ENV['RESCUETIME_IDENTIFIER'], ENV['RESCUETIME_SECRET']
end

run App.new
