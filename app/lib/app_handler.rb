class AppHandler
  attr_accessor :response, :user

  def initialize(user=nil)
    @user = user unless user.nil?
    @response = { status: nil, message: "" }
  end

  def valid?
    @response == 200
  end

  private

  def respond(status, message, data=nil)
    @response = {
      status: status, message: message, data: data
    }
  end

end
