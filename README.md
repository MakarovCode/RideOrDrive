# RideOrDrive Code Challenge

This is a ruby code challenge

Task:
* Create a JSON RESTful API
* Rider
  * Create payment method (Using Wompi API)
  * Request Ride
* Driver
  * Finish ride and charge rider

## Tech Stack
* Ruby
* PostgreSQL
* Validation oauth2
* Gems
  * Sinatra -> DLS
  * Active Record -> ORM
  * Dry-Validation -> Validation / Contracts
  * Rspec -> Unit / Integration Tests
  * FactoryBot -> Unit / Integration Tests
  * Rabl -> For JSON responses
  * Wompi -> I develop my own  [Wompi gem](https://github.com/MakarovCode/wompi)

## The File Structure
* Files to check
  * app/controllers/app_controller.rb
    * Sinatra modular routing / controller
  * lib/*.rb
    * Logic layer
  * models/*.rb
    * ActiveRecord models (just like RoR)
    * **Important**: I integrated DryValidation with ActiveRecord in models/dry_validation.rb is a CustomValidator for ActiveRecord using Dry Contracts
  * contracts/*.rb
    * Dry contracts for both models and some params at logic layer handlers

## The JSON API
* /api/v1/users/token/:refresh_token
  * Refresh the oauth2 access token
* /api/v1/riders/cards
  * Create Dummy Wompi Card
* /api/v1/riders/rides
  * Rider request new ride
* /api/v1/drivers/rides/:id/finish
  * Driver finish a ride and charge the rider
* /wompi_webhook
  * Webhook for requests

##. Install

1. Install Ruby
```sh
$ rvm install 2.7.1
$ rbenv install 2.7.1
```

2. Run bundle
```sh
$ bundle
```

3. Run rake db
```sh
$ bundle exec rake db:create db:migrate db:seed
$ bundle exec rake db:create db:migrate APP_ENV=test
```

6. Run specs

```sh
$ bundle exec rake spec
```

7. Start the server

```sh
$ shotgun config.ru
```
