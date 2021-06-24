class CardsHandler < AppHandler

  attr_accessor :card

  def initialize(user)
    super(user)
  end

  def add(params)
    # Validar contrato para params
    wompi_login = Wompi::RApi::Login.new
    wompi_login.get_acceptance_token

    wompi_card = Wompi::RApi::PaymentMethod.new(wompi_login)
    wompi_card.as_dummy_card(params["card_status"])
    wompi_card.create

    if wompi_card.success?
      @card = @user.cards.new name: wompi_card.name, brand: wompi_card.brand, holder: wompi_card.holder, exp_at: "#{wompi_card.exp_month}/#{wompi_card.exp_year}", token: wompi_card.id

      if @card.save
        respond(200, "payment method created")
      else
        respond(411, "error creating payment method -> #{@card.errors.full_messages.to_sentence}")
      end
    else
      respond(411, "error creating payment method -> #{wompi_card.error}")
    end
  end

end
