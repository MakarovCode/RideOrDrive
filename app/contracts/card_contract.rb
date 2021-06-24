class CardContract < Dry::Validation::Contract
  params do
    required(:name).filled(:string)
    required(:brand).filled(:string)
    required(:holder).filled(:string)
    required(:exp_at).filled(:string)
    required(:user_id).filled(:integer)
  end
end
