require 'bundler/setup'
require 'rack/coffee'
require 'sass/plugin/rack'
require 'compass'

root = File.expand_path "../", __FILE__

use Rack::Coffee, {
  :root => "#{root}/public",
  :urls => '/javascripts'
}

Compass.add_project_configuration(File.join(root, 'config.rb'))
Compass.configure_sass_plugin!
use Sass::Plugin::Rack    # Compile Sass on the fly

require './app'
run Bootstrap
