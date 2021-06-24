# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    uuid {SecureRandom.uuid}
    auth_token {SecureRandom.uuid}
    refresh_token {SecureRandom.uuid}
    access_token {SecureRandom.uuid}
    access_token_expired_at {Time.now + 1.hour}
    name { "Cool Rider" }
    email { "coolrider@examplerideordrive.com" }

    factory :user_as_rider do

      rider do
        association(:rider)
      end
    end

    factory :user_as_driver do

      rider do
        association(:driver)
      end
    end
  end
end
