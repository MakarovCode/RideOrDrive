# frozen_string_literal: true

require 'sinatra_helper'

RSpec.describe Ride, type: :model do

  let(:ride) { FactoryBot.create(:ride) }

  describe '#rider_id' do
    it 'is_required' do
      ride.rider_id = nil
      ride.valid?
      # expect( user ).not_to be_valid
      expect( ride.errors[:rider_id].size ).to eq(1)
    end
  end

  describe '#start_at_lat' do
    it 'is_required' do
      ride.start_at_lat = nil
      ride.valid?
      expect( ride.errors[:start_at_lat].size ).to eq(1)
    end
  end

  describe '#start_at_lng' do
    it 'is_required' do
      ride.start_at_lng = nil
      ride.valid?
      expect( ride.errors[:start_at_lng].size ).to eq(1)
    end
  end

  describe '#started_at' do
    it 'is_required' do
      ride.started_at = nil
      ride.valid?
      expect( ride.errors[:started_at].size ).to eq(1)
    end
  end

  describe '#status' do
    it 'is_required' do
      ride.status = nil
      ride.valid?
      expect( ride.errors[:status].size ).to eq(1)
    end

    it 'is a valid status' do
      ride.status = 5
      ride.valid?
      expect( ride.errors[:status].size ).to eq(1)
    end
  end
end
