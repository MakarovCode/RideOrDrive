# frozen_string_literal: true

require 'sinatra_helper'

RSpec.describe Payment, type: :model do

  let(:payment) { FactoryBot.create(:payment) }

  describe '#value' do
    it 'is_required' do
      payment.value = nil
      payment.valid?
      # expect( user ).not_to be_valid
      expect( payment.errors[:value].size ).to eq(1)
    end
  end

  describe '#status' do
    it 'is_required' do
      payment.status = nil
      payment.valid?
      expect( payment.errors[:status].size ).to eq(1)
    end

    it 'is a valid status' do
      payment.status = 1
      payment.valid?
      expect( payment.errors[:status].size ).to eq(1)
    end
  end

  describe '#user_id' do
    it 'is_required' do
      payment.user_id = nil
      payment.valid?
      expect( payment.errors[:user_id].size ).to eq(1)
    end
  end

end
