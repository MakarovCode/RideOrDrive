# frozen_string_literal: true

require 'sinatra_helper'

RSpec.describe "rides request params" do

  let(:contract) { RideRequestContract.new }

  describe '#lat' do
    it 'is_required' do
      _call = contract.call(id: 1, lng: -75.0000)
      expect( _call.errors.to_h[:lat].size ).to eq(1)
    end
  end

  describe '#lng' do
    it 'is_required' do
      _call = contract.call(id: nil, lat: 5.0000)
      expect( _call.errors.to_h[:lng].size ).to eq(1)
    end
  end

end
