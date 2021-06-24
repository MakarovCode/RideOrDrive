class PaymentsHandler < AppHandler

  attr_accessor :payment

  def initialize(user)
    super(user)
  end

  def validate(params)
    # Validar contrato para params

    @payment = Payment.find_by_reference params["data"]["transaction"]["reference"]
    unless @payment.nil?
      @payment.translate_status(params["data"]["transaction"]["status"])
      @payment.save
    else
      respond(404, "payment not found -> reference do not match")
    end

  end

end
