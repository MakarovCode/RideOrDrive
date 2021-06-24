# frozen_string_literal: true

FactoryBot.define do
  factory :card do
    token { "ABCD" }
    name { "rider-4242" }
    brand { "VISA" }
    holder { "COOL DRIVER" }
    exp_at { "12/25" }

    association :user
  end
end
