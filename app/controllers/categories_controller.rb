class CategoriesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  
  def index
    @categories = current_user.categories.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.new(category_params)

    if @category.save
      redirect_to categories_path, notice: 'Category created successfully'
    else
      flash.now[:alert] = 'Unable to create a category'
      render :new
    end
  end
  private

  def category_params
    permitted_params = params.require(:category).permit(:name, :icon)
    permitted_params
  end
end
