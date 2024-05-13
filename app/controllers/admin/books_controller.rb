class Admin::BooksController < ApplicationController
  # before_action :admin_user
  load_and_authorize_resource

  def index
    q_param = params[:q]
    page = params[:page]
    per_page = params[:per_page] || 10
    @q = Book.ransack q_param
    @books = @q.result.includes(:category).page(page).per(per_page)
  end

  def search
    index
    render :index
  end

  def new
    @book = Book.new
    @categories = Category.all
  end

  def show
    @book = Book.find(params[:id])
    render 'admin/books/show', locals: { book: @book }
  end

  def create
    # The params method returns an ActionController::Parameters object, which behaves like a hash.
    # The require method returns the value of the key passed as an argument (in this case, :book).
    # The permit method specifies which attributes should be allowed for mass updating.
    @book = Book.new(book_params)
    debugger
    if @book.save
      # Handle a successful save.
      flash[:info] = 'Book created successfully'
      redirect_to [:admin, @book]
    else
      @categories = Category.all
      render 'new'
    end
  end

  def edit
    @book = Book.find(params[:id])
    @categories = Category.all
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      # Handle a successful update.
      flash[:success] = 'Book updated!'
      redirect_to edit_admin_book_path(@book)
    else
      render 'edit'
    end
  end

  def destroy
    Book.find(params[:id]).destroy
    flash[:success] = 'Book deleted'
    redirect_to admin_books_url
  end

  private

  def book_params
    params.require(:book).permit(:name, :image, :status, :author, :category_id, :description, :content)
  end

  # Confirms an admin user.
  def admin_user
    redirect_to(root_url) unless current_user&.admin?
  end
end
