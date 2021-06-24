class AppController < Sinatra::Base
  configure do
    set :views, "app/views"
  end

  before do
    @users_handler = UsersHandler.new
    @users_handler.simple_authenticate(headers['user_uuid'], headers['auth_token'])
    unless @users_handler.valid?
      @handler = @users_handler
      rabl :"/api/v1/base/index", format: "json"
      return
    end
  end

  set(:auth) do |*roles|
    condition do
      unless @users_handler.in_role?(roles)
        @handler = @users_handler
        rabl :"/api/v1/base/index", format: "json"
        return
      end
    end
  end

  set(:oauth2) do |oauth2|
    condition do
      if oauth2 == :true
        @users_handler.oauth2_authenticate(param[:access_token])
        unless @users_handler.valid?
          @handler = @users_handler
          rabl :"/api/v1/base/index", format: "json"
          return
        end
      end
    end
  end

  get '/' do
    User.all.count.to_s
  end

  post '/wompi_webhook' do
    @handler = PaymentHandler.new(params)
    @handler.validate(params)

    render status: @users_handler.response[:status], json: @users_handler.response
  end

  post '/api/v1/users/token/:refresh_token', auth: [:rider, :driver] do |refresh_token|
    @users_handler.refresh_tokens(refresh_token)

    rabl :"/api/v1/base/index", format: "json"
  end

  post '/api/v1/riders/cards', auth: [:rider], oauth2: :true do
    @handler = CardsHandler.new(@users_handler.user)
    @handler.add(params)

    rabl :"/api/v1/base/index", format: "json"
  end

  post '/api/v1/riders/rides', auth: [:rider], oauth2: :true do
    @handler = RidesHandler.new(@users_handler.user)
    @handler.request(params)

    rabl :"/api/v1/base/index", format: "json"
  end


  post '/api/v1/drivers/rides/:id/finish', auth: [:driver], oauth2: :true do

    rides_handler = RidesHandler.new
    @res = rides_handler.finish(params)

    rabl :"/api/v1/base/index", format: "json"
  end
end
