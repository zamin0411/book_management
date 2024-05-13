require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when creating a user' do
    let(:user) { build :user }

    it 'is valid' do
      expect(user).to be_valid
    end

    it 'is invalid without a name' do
      user.name = nil
      expect(user).to_not be_valid
    end

    it 'is invalid without an email' do
      user.email = nil
      expect(user).to_not be_valid
    end

    it 'is invalid without a password' do
      user.password = nil
      expect(user).to_not be_valid
    end

    it 'is invalid with a duplicate email address' do
      user.save
      user2 = build(:user, email: user.email)
      expect(user2).to_not be_valid
    end

    it 'is invalid with a password that is too short' do
      user.password = 'a' * 5
      user.password_confirmation = 'a' * 5
      expect(user).to_not be_valid
    end
  end
end
