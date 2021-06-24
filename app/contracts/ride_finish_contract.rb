class RideFinishContract < Dry::Validation::Contract
  params do
    required(:id).filled(:string)
    required(:lat).filled(:float)
    required(:lng).filled(:float)
  end
end
