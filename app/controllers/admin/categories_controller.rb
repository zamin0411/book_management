class Admin::CategoriesController < ApplicationController
  # before_action :admin_user
  load_and_authorize_resource

  def index
    q_param = params[:q]
    page = params[:page]
    per_page = params[:per_page] || 10
    @q = Category.ransack q_param
    @categories = @q.result.page(page).per(per_page)
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
    render 'admin/categories/show', locals: { category: @category }
  end

  def create
    # The params method returns an ActionController::Parameters object, which behaves like a hash.
    # The require method returns the value of the key passed as an argument (in this case, :category).
    # The permit method specifies which attributes should be allowed for mass updating.
    @category = Category.new(category_params)
    if @category.save
      # Handle a successful save.
      flash[:info] = 'Category updated successfully!'
      redirect_to admin_categories_url
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
    @categories = Category.all
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      # Handle a successful update.
      flash[:success] = 'Category updated!'
      redirect_to edit_admin_category_path(@category)
    else
      render 'edit'
    end
  end

  def destroy
    Category.find(params[:id]).destroy
    flash[:success] = 'Category deleted'
    redirect_to admin_categories_url
  end

  private

  def category_params
    params.require(:category).permit(:name, :image, :status, :author)
  end

  # Confirms an admin user.
  def admin_user
    redirect_to(root_url) unless current_user&.admin? || current_user&.manager?
  end
end
