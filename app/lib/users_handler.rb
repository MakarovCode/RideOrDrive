class UsersHandler < AppHandler
  def initialize()
    super()
  end

  def simple_authenticate(uuid, auth_token)
    @user = User.find_by_uuid_and_auth_token(uuid, auth_token)
    unless @user.nil?
      respond(200, message: "user authenticated -> simple")
    else
      respond(422, message: "invalid credentials -> wrong uuid or auth_token")
    end
  end

  def oauth2_authenticate(access_token)
    if @user.access_token == access_token
      if @user.access_token_expired_at >= Time.now
        respond(200, message: "user authenticated -> oauth2")
      else
        respond(422, message: "invalid credentials -> expired access_token")
      end
    else
      respond(422, message: "invalid credentials -> wrong access_token")
    end
  end

  def refresh_tokens(refresh_token)
    if @user.refresh_token == refresh_token
      @user.access_token = SecureRandom.hex(20)
      @user.access_token_expired_at = Time.now + 1.hour
      respond(200, message: "user authenticated -> access_token updated")
    else
      respond(422, message: "invalid credentials -> wrong refresh_token")
    end
  end

  def in_role?(role)
    unless roles.include? @user.role
      respond(422, message: "not authorized -> role do not match the action")
    end

    return true

  end
end
