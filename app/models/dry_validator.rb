class DryValidator# < ActiveModel::Validator
  def initialize(contract, record)
    @contract = contract
    @record = record
  end

  def validate
    contr = @contract.call(@record.as_json)
    contr.errors.to_h.each do |attr, messages|
      messages.each do |message|
        @record.errors.add attr, message
      end
    end
  end

end
