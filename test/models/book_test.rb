require 'test_helper'

class BookTest < ActiveSupport::TestCase
  def setup
    @category = categories[:fiction]
    @book = @category.books.build(name: 'Harry Potter', author: 'JK', image: 'https://example.com')
  end

  test 'should be valid' do
    assert @book.valid?
  end

  test 'name should be present' do
    @book.name = ' '
    assert_not @book.valid?
  end

  test 'author should be present' do
    @book.author = ' '
    assert_not @book.valid?
  end

  test 'name should not be too long' do
    @book.name = 'a' * 51
    assert_not @book.valid?
  end

  test 'author should not be too long' do
    @book.author = 'a' * 51
    assert_not @book.valid?
  end
end
