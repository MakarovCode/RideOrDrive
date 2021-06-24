class AppRecord < ActiveRecord::Base

  self.abstract_class = true

  validate do |record|
    contract = Object.const_get("#{self.class.name}Contract").new
    DryValidator.new(contract, record).validate
  end
end
