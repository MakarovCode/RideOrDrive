# app.rb
require "sinatra"
require "bundler/setup"
if test?
  Bundler.require(:default)
else
  Bundler.require(:default, development? ? :development : :production)
end
require_relative './environment'
require_relative './development' if development?
require_relative './production' if production?

set :database, File.dirname(__FILE__), "config/database.yml"

Rabl.register!
Rabl.configure do |config|
  config.include_json_root = true
  config.include_child_root = true
end
