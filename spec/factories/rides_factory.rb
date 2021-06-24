# frozen_string_literal: true

FactoryBot.define do
  factory :ride do
    start_at_lat { Ride::DUMMY_POSITIONS[0][0] }
    start_at_lng { Ride::DUMMY_POSITIONS[0][1] }
    end_at_lat { Ride::DUMMY_POSITIONS[1][0] }
    end_at_lng { Ride::DUMMY_POSITIONS[1][1] }
    started_at { Time.now }
    ended_at { Time.now + 10.minutes }
    cost { 0.0 }
    distance { 0.0 }
    duration { 0.0 }
    status { 0 }

    association :rider
    association :driver
  end
end
