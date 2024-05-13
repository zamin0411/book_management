require 'rails_helper'

RSpec.describe Book, type: :model do
  context 'when creating a book' do
    let(:book) { build :book }
    it 'has a valid factory' do
      expect(book).to be_valid
    end

    it 'is invalid without a name' do
      book.name = ''
      expect(book).to_not be_valid
    end

    it 'is invalid without an author' do
      book.author = ''
      expect(book).to_not be_valid
    end

    it 'is invalid without an image' do
      book.image = ''
      expect(book).to_not be_valid
    end

    it 'is invalid without a category' do
      book.category = nil
      expect(book).to_not be_valid
    end

    it 'is invalid with a name longer than 50 characters' do
      book.name = 'a' * 51
      expect(book).to_not be_valid
    end

    it 'is invalid with an author longer than 50 characters' do
      book.author = 'a' * 51
      expect(book).to_not be_valid
    end

    it 'is invalid with a description longer than 500 characters' do
      book.description = 'a' * 501
      expect(book).to_not be_valid
    end

    it 'is invalid with a status other than draft or published' do
      book.status = 'invalid'
      expect(book).to_not be_valid
    end
  end
end
