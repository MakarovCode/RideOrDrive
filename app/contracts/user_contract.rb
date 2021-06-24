class UserContract < Dry::Validation::Contract
  json do
    required(:uuid).filled(:string)
    required(:auth_token).filled(:string)
    required(:refresh_token).filled(:string)
    required(:access_token).filled(:string)
    required(:name).filled(:string)
    required(:email).filled(:string)
  end

  rule(:email) do
    unless /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.match?(value)
      key.failure('has invalid format')
    end
  end
end
