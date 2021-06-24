# frozen_string_literal: true

FactoryBot.define do
  factory :rider do
    points { 100 }

    association :user
  end
end
