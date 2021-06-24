# frozen_string_literal: true

require 'sinatra_helper'

RSpec.describe CardsHandler do
  let(:user) { FactoryBot.create(:user) }
  let(:cards_handler) { CardsHandler.new(user) }

  describe "add" do

    it "success" do
      cards_handler.add({"card_status" => "APPROVED"})
      expect(cards_handler.response[:status]).to eq(200)
    end

    # it "failure" do
    #   cards_handler.add({"card_status" => "DECLINED"})
    #   expect(users_handler.response[:status]).to eq(422)
    # end
  end

end
