class AdminController < ApplicationController
  before_action :authorized?

  private

  def authorized?
    debugger
    return if current_user&.admin?

    flash[:error] = 'You are not authorized to view that page.'
    redirect_to root_path
  end
end
