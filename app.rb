require 'bundler'
Bundler.require


# App
class Bootstrap < Sinatra::Base
  # Configuration
  configure do
    # Set Sinatra variables
    set :app_file, __FILE__
    set :root, File.dirname(__FILE__)
    set :views, 'views'
  end


  # Application routes
  get '/' do
    slim :index
  end

  get '/about' do
    slim :about
  end

end
