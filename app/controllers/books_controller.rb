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

  def create
    # The params method returns an ActionController::Parameters object, which behaves like a hash.
    # The require method returns the value of the key passed as an argument (in this case, :book).
    # The permit method specifies which attributes should be allowed for mass updating.
    @book = Book.new(book_params)
    if @book.save
      # Handle a successful save.
      flash[:info] = 'Please check your email to activate your account.'
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      # Handle a successful update.
      flash[:success] = 'Profile updated!'
      redirect_to @book
    else
      render 'edit'
    end
  end

  def destroy
    Book.find(params[:id]).destroy
    flash[:success] = 'Book deleted'
    redirect_to books_url
  end

  private

  def book_params
    params.require(:book).permit(:name, :image, :status)
  end
end
