class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]


  def edit
  	@category = Category.find(params[:id])
  end

  def index
  	@categories = Category.all
  end

  def new
  	@category = Category.new
  end

  def show
  	@category = Category.find(params[:id])
  end

  def create
  	@category = Category.new(category_params)
  	@category.save
  	respond_to do |format|
  		format.html {redirect_to @category, notice: 'Category was successfully created.' }
    end
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    respond_to do |format|
      format.html { redirect_to @category, notice: 'Category was successfully updated.' }
    end
  end

  def destroy
  	@category = Category.find(params[:id])
  	@category.destroy
  	respond_to do |format|
    	format.html { redirect_to categories_path, notice: 'Category was successfully destroyed.' }
    end
  end

 private
  def category_params
  	params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end

end
