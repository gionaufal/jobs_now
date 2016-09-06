class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @jobs = @category.jobs.all
  end
end
