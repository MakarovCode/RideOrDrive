class User < AppRecord

  has_one :rider#, foreign_key: "user_id"
  has_one :driver#, foreign_key: "user_id"

  has_many :cards
  has_many :payments

  def secure_uuid_and_tokens
    self.uuid          = SecureRandom.uuid
    self.auth_token    = SecureRandom.hex(20)
    self.refresh_token = SecureRandom.hex(20)
    self.access_token  = SecureRandom.hex(20)
    self.access_token_expired_at  = Time.now + 1.hour
  end

end
