class RidesHandler < AppHandler

  attr_accessor :ride, :payment

  def initialize(user)
    super(user)
  end

  def request(params)
    # Validar contrato para para
    return unless validate_contract(RideRequestContract.new, params)
    @ride = Ride.new start_at_lat: params[:lat], start_at_lng: params[:lng], started_at: Time.now, status: Ride::PENDING, rider_id: @user.rider.id

    if @ride.save
      if check_and_assing_driver(params[:lat], params[:lng])
        respond(200, "ride requested -> driver assigned")
      else
        respond(403, "ride requested -> driver not found")
      end
    else
      respond(403, "ride requested -> #{@ride.errors.full_messages.to_sentence}")
    end
  end

  def finish(params)
    return unless validate_contract(RideFinishContract.new, params)
    @ride = Ride.find params[:id]
    @ride.end_at_lat = params[:lat]
    @ride.end_at_lng = params[:lng]
    @ride.ended_at = Time.now
    @ride.status = Ride::FINISHED
    @ride.save
    finish_and_calculate_cost

    respond(200, "ride finished")
  end

  private

  def check_and_assing_driver(lat, lng)
    driver = Driver.search_by(lat, lng)
    if driver.any?
      @ride.driver_id = driver[0].id
      @ride.status = Ride::IN_PROGRESS
      @ride.save
      true
    else
      @ride.status = Ride::CANCELLED
      @ride.save
      false
    end
  end

  def finish_and_calculate_cost
    cost = 3500
    cost += (@ride.distance_traveled * 1000) + (@ride.time_elapsed * 200)
    @ride.update_attribute :cost, cost

    charge_with_wompi
  end

  def charge_with_wompi
    create_payment_record

    wompi_login = Wompi::RApi::Login.new
    wompi_login.get_acceptance_token

    wompi_card = Wompi::RApi::PaymentMethod.new(wompi_login)
    wompi_card.as_card_with_known_id(@ride.rider.user.cards[0].token)

    wompi_source = Wompi::RApi::PaymentSource.new(wompi_login)
    wompi_source.create(wompi_card, @ride.rider.user.email)

    wompi_trans = Wompi::RApi::Transaction.new(wompi_login)
    wompi_trans.prepare(@ride.cost*100, "COP", @ride.rider.user.email, wompi_source, 1, @ride.payment_id)
    wompi_trans.create

  end

  def create_payment_record
    @payment = @ride.rider.user.payments.create value: @ride.cost * 100, status: Payment::PENDING, ride_id: @ride.id
  end

  private

  def validate_contract(contract, params)
    _call = contract.call(params)

    if _call.errors.to_h.any?
      full_message = "ride action failed - "
      _call.errors.to_h.each do |attr, messages|
        full_message = messages.join(" - ")
      end
      respond(411, full_message)
      false
    else
      true
    end
  end

end
