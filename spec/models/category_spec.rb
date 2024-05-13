require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when creating a category' do
    let(:category) { build :category }
    it 'is valid with valid attributes' do
      expect(category).to be_valid
    end

    it 'is invalid without a name' do
      category.name = nil
      expect(category).to_not be_valid
    end

    it 'is invalid with a name that is too long' do
      category.name = 'a' * 26
      expect(category).to_not be_valid
    end
  end
end
