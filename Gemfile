source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby `cat .ruby-version`.strip

gem "sinatra"
gem 'require_all'
gem 'json', '>= 1.8.3'
gem 'dotenv'
gem "sinatra-activerecord"

gem "pg"
gem "rake"
gem "dry-validation"
gem "rabl"

group :test do
  gem 'factory_bot'
  gem 'rspec', :require => 'spec'
end

group :development do
  gem 'shotgun'
end
gem 'wompi'
