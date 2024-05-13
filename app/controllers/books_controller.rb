class BooksController < ApplicationController
  def index
    q_param = params[:q]
    page = params[:page]
    per_page = params[:per_page] || 9
    @q = Book.where(status: :published).ransack q_param
    @books = @q.result.page(page).per(per_page)
  end

  def new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    render 'show'
  end
end
