# frozen_string_literal: true

require 'sinatra_helper'

RSpec.describe CardsHandler do
  let(:user) { FactoryBot.create(:user_as_rider) }
  let(:rides_handler) { RidesHandler.new(user) }

  describe "request" do

    it "ride created" do
      FactoryBot.create(:driver_near_a)
      rides_handler.request({lat: Driver::DUMMY_POSITIONS[0][0], lng: Driver::DUMMY_POSITIONS[0][1]})
      expect(rides_handler.response[:status]).to eq(200)
    end

    it "invalid contract" do
      rides_handler.request({"lat" => "NO"})
      expect(rides_handler.response[:status]).to eq(411)
    end
  end

  describe "finish" do

    let(:ride) { FactoryBot.create(:ride) }
    let(:card) { FactoryBot.create(:card) }
    let(:cards_handler) { CardsHandler.new(user) }

    it "ride finished" do
      cards_handler.add({"card_status" => "APPROVED"})
      FactoryBot.create(:driver_near_a)
      rides_handler.finish({id: "#{ride.id}", lat: Driver::DUMMY_POSITIONS[0][0], lng: Driver::DUMMY_POSITIONS[0][1]})
      expect(rides_handler.response[:message]).to eq(200)
    end

    it "invalid contract" do
      rides_handler.request({"lat" => "NO"})
      expect(rides_handler.response[:status]).to eq(411)
    end
  end

end
