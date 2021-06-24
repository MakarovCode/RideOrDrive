class RiderContract < Dry::Validation::Contract
  params do
    required(:points).filled(:integer)
    required(:user_id).filled(:integer)
  end
end
