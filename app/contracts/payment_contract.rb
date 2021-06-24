class PaymentContract < Dry::Validation::Contract
  params do
    required(:value).filled(:float)
    required(:status).filled(:integer)
    required(:user_id).filled(:integer)
  end

  rule(:status) do
    unless Payment::STATUSES.include?(value)
      key.failure('status is not valid')
    end
  end
end
