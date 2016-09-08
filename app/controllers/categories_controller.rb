class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @jobs = @category.jobs.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
     if @category.save
       redirect_to @category
     else
       flash[:error] = 'Preencha o nome da categoria'
       render :new
     end
  end

  private

  def category_params
    params.require(:category).permit(:name)

  end
end
