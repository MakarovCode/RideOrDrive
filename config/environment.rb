require 'rubygems'
require 'bundler/setup'
require 'dotenv'
require 'require_all'

require 'sinatra' unless defined?(Sinatra)

Dotenv.load

configure do
  require_all 'app'
end

configure :production, :development do
  enable :logging
end
