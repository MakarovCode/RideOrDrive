# frozen_string_literal: true

require 'sinatra_helper'

RSpec.describe UsersHandler do
  let(:user) { FactoryBot.create(:user) }
  let(:users_handler) { UsersHandler.new }

  describe "simple_authenticate" do

    it "valid keys" do
      users_handler.simple_authenticate(user.uuid, user.auth_token)
      expect(users_handler.response[:status]).to eq(200)
    end

    it "invalid keys" do
      users_handler.simple_authenticate("WRONG", "KEYS")
      expect(users_handler.response[:status]).to eq(422)
    end
  end

  describe "oauth2_authenticate" do

    it "valid access token" do
      user.access_token_expired_at = Time.now
      users_handler.simple_authenticate(user.uuid, user.auth_token)
      users_handler.oauth2_authenticate(user.access_token)
      expect(users_handler.response[:status]).to eq(200)
    end

    it "expired access token" do
      users_handler.simple_authenticate(user.uuid, user.auth_token)
      users_handler.user.access_token_expired_at = Time.now - 2.hours
      users_handler.oauth2_authenticate(user.access_token)
      expect(users_handler.response[:status]).to eq(422)
    end

    it "invalid access token" do
      user.access_token = "ABCD"
      users_handler.simple_authenticate(user.uuid, user.auth_token)
      users_handler.oauth2_authenticate(user.access_token)
      expect(users_handler.response[:status]).to eq(422)
    end
  end

  describe "refresh_tokens" do

    it "valid refresh token" do
      users_handler.simple_authenticate(user.uuid, user.auth_token)
      users_handler.refresh_tokens(user.refresh_token)
      expect(users_handler.response[:status]).to eq(200)
    end

    it "invalid refresh token" do
      users_handler.simple_authenticate(user.uuid, user.auth_token)
      users_handler.refresh_tokens("ABCD")
      expect(users_handler.response[:status]).to eq(422)
    end
  end
end
