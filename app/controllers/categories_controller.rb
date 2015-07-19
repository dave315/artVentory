class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = "Category Created Successfully."
      redirect_to categories_path
    else
      flash[:notice] = "Category Not Saved."
      render :new
    end
  end

  protected
  def category_params
    params.require(:category).permit(:name, :description, :total_printed)
  end
end
