
# app.rb
require "sinatra"
require "bundler/setup"
Bundler.require(:default)
require_relative './environment'

set :database, File.dirname(__FILE__), "config/database.yml"
