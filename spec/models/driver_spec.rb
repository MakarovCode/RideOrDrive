# frozen_string_literal: true

require 'sinatra_helper'

RSpec.describe Driver, type: :model do

  let(:driver) { FactoryBot.create(:driver) }

  describe '#current_lan' do
    it 'is_required' do
      driver.current_lat = nil
      driver.valid?
      # expect( user ).not_to be_valid
      expect( driver.errors[:current_lat].size ).to eq(1)
    end
  end

  describe '#current_lng' do
    it 'is_required' do
      driver.current_lng = nil
      driver.valid?
      # expect( user ).not_to be_valid
      expect( driver.errors[:current_lng].size ).to eq(1)
    end
  end

  describe '#user_id' do
    it 'is_required' do
      driver.user_id = nil
      driver.valid?
      expect( driver.errors[:user_id].size ).to eq(1)
    end
  end

  describe '#status' do
    it 'is_required' do
      driver.status = nil
      driver.valid?
      expect( driver.errors[:status].size ).to eq(1)
    end

    it 'is a valid status' do
      driver.status = 2
      driver.valid?
      expect( driver.errors[:status].size ).to eq(1)
    end
  end

end
