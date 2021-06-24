# frozen_string_literal: true

require 'sinatra_helper'

RSpec.describe Rider, type: :model do

  let(:rider) { FactoryBot.create(:rider) }

  describe '#points' do
    it 'is_required' do
      rider.points = nil
      rider.valid?
      # expect( user ).not_to be_valid
      expect( rider.errors[:points].size ).to eq(1)
    end
  end

  describe '#user_id' do
    it 'is_required' do
      rider.user_id = nil
      rider.valid?
      expect( rider.errors[:user_id].size ).to eq(1)
    end
  end

end
