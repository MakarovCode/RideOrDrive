class RideRequestContract < Dry::Validation::Contract
  params do
    required(:lat).filled(:float)
    required(:lng).filled(:float)
  end
end
