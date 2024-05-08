class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    redirect_to root_url

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
