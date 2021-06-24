class DriverContract < Dry::Validation::Contract
  params do
    required(:current_lat).filled(:float)
    required(:current_lng).filled(:float)
    required(:status).filled(:integer)
    required(:user_id).filled(:integer)
  end

  rule(:status) do
    unless Driver::STATUSES.include?(value)
      key.failure('status is not valid')
    end
  end
end
