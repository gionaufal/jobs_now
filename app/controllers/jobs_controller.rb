class JobsController < ApplicationController
  before_action :find_job, only: [:show, :edit, :update]
  def show

  end

  def new
    @job = Job.new
    @companies = Company.all
    @categories = Category.all
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to @job
    else
      @categories = Category.all
      @companies = Company.all
      flash[:error]= 'Não foi possível criar a vaga'
      render :new
    end
  end

  def edit
    @companies = Company.all
    @categories = Category.all
  end

  def update
    if @job.update(job_params)
      redirect_to @job
    else
      @companies = Company.all
      @categories = Category.all
      flash[:error]= 'Não foi possível atualizar a vaga'
      render :edit
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :company_id, :location, :category_id, :description, :featured)
  end

  def find_job
    @job = Job.find(params[:id])
  end

end
