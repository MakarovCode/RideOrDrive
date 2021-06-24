# frozen_string_literal: true

FactoryBot.define do
  factory :payment do
    value { 0.0 }
    status { 0 }

    association :user
    association :ride
  end
end
