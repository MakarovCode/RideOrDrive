# frozen_string_literal: true

require 'sinatra_helper'

RSpec.describe Card, type: :model do

  let(:card) { FactoryBot.create(:card) }

  describe '#name' do
    it 'is_required' do
      card.name = nil
      card.valid?
      # expect( user ).not_to be_valid
      expect( card.errors[:name].size ).to eq(1)
    end
  end

  describe '#brand' do
    it 'is_required' do
      card.brand = nil
      card.valid?
      # expect( user ).not_to be_valid
      expect( card.errors[:brand].size ).to eq(1)
    end
  end

  describe '#holder' do
    it 'is_required' do
      card.holder = nil
      card.valid?
      expect( card.errors[:holder].size ).to eq(1)
    end
  end

  describe '#exp_at' do
    it 'is_required' do
      card.exp_at = nil
      card.valid?
      expect( card.errors[:exp_at].size ).to eq(1)
    end
  end

  describe '#user_id' do
    it 'is_required' do
      card.user_id = nil
      card.valid?
      expect( card.errors[:user_id].size ).to eq(1)
    end
  end

end
