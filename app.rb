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
    @DB = Sequel.sqlite 'db/development.db'
    require File.expand_path "../models/foo", __FILE__
  end


  # Application routes
  get '/' do
    slim :index
  end

  get '/about' do
    slim :about
  end

  get '/foos' do
    @foos = Foo.all
    slim :"foos/index"
  end

  post '/foos' do
    Foo.create(params[:foo])
    redirect '/foos'
  end

  get '/foos/new' do
    slim :"foos/new"
  end

  get '/foos/:id' do
    @foo = Foo[params[:id]]
    slim :"foos/show"
  end

end
