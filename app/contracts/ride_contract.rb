class RideContract < Dry::Validation::Contract
  params do
    required(:rider_id).filled(:integer)
    required(:start_at_lat).filled(:float)
    required(:start_at_lng).filled(:float)
    required(:started_at).filled(:date)
    required(:status).value(:integer)
  end

  rule(:status) do
    unless Ride::STATUSES.include?(value)
      key.failure('status is not valid')
    end
  end
end
