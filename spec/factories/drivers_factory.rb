# frozen_string_literal: true


FactoryBot.define do
  factory :driver do
    sequence(:current_lat) { |i| Driver::DUMMY_POSITIONS[0][0] }
    sequence(:current_lng) { |i| Driver::DUMMY_POSITIONS[0][1] }
    status {0}

    association :user

    factory :driver_near_a do
      sequence(:current_lat) { |i| Driver::DUMMY_POSITIONS[1][0] }
      sequence(:current_lng) { |i| Driver::DUMMY_POSITIONS[1][1] }
      status {0}

      association :user
    end

    factory :driver_near_b do
      sequence(:current_lat) { |i| Driver::DUMMY_POSITIONS[2][0] }
      sequence(:current_lng) { |i| Driver::DUMMY_POSITIONS[2][1] }
      status {0}

      association :user
    end
  end
end
