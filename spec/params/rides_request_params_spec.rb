# frozen_string_literal: true

require 'sinatra_helper'

RSpec.describe "rides finish params" do

  let(:contract) { RideFinishContract.new }

  describe '#id' do
    it 'is_required' do
      _call = contract.call(lat: 5.0000, lng: -75.0000)
      expect( _call.errors.to_h[:id].size ).to eq(1)
    end
  end

  describe '#lat' do
    it 'is_required' do
      _call = contract.call(id: 1, lng: -75.0000)
      expect( _call.errors.to_h[:lat].size ).to eq(1)
    end
  end

  describe '#lng' do
    it 'is_required' do
      _call = contract.call(id: 1, lat: 5.0000)
      expect( _call.errors.to_h[:lng].size ).to eq(1)
    end
  end

end
