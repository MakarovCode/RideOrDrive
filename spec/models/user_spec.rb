# frozen_string_literal: true

require 'sinatra_helper'

RSpec.describe User, type: :model do

  let(:user) { FactoryBot.create(:user) }

  describe '#uuid' do
    it 'is_required' do
      user.uuid = nil
      user.valid?
      # expect( user ).not_to be_valid
      expect( user.errors[:uuid].size ).to eq(1)
    end
  end

  describe '#auth_token' do
    it 'is_required' do
      user.auth_token = nil
      user.valid?
      expect( user.errors[:auth_token].size ).to eq(1)
    end
  end

  describe '#refresh_token' do
    it 'is_required' do
      user.refresh_token = nil
      user.valid?
      expect( user.errors[:refresh_token].size ).to eq(1)
    end
  end

  describe '#access_token' do
    it 'is_required' do
      user.access_token = nil
      user.valid?
      expect( user.errors[:access_token].size ).to eq(1)
    end
  end

  describe '#name' do
    it 'is_required' do
      user.name = nil
      user.valid?
      expect( user.errors[:name].size ).to eq(1)
    end
  end

  describe '#email' do
    it 'is_required' do
      user.email = nil
      user.valid?
      expect( user.errors[:email].size ).to eq(1)
    end

    it 'valid format not @' do
      user.email = "exampletest.com"
      user.valid?
      expect( user.errors[:email].size ).to eq(1)
    end

    it 'valid format not dot' do
      user.email = "example@test"
      user.valid?
      expect( user.errors[:email].size ).to eq(1)
    end

    it 'valid format not name' do
      user.email = "@test.com"
      user.valid?
      expect( user.errors[:email].size ).to eq(1)
    end

    it 'valid format good' do
      user.email = "name@test.com"
      user.valid?
      expect( user.errors[:email].size ).to eq(0)
    end
  end

end
