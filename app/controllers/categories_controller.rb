class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "#{@category.name} category added!"
      redirect_to category_path(@category)
    else
      flash[:fail] = "You must enter a unique Category!"
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    redirect_to category_path(@category)
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    redirect_to categories_path
  end



  private
  def category_params
    params.require(:category).permit(:name)
  end
end