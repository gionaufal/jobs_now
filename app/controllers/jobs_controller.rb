
class JobsController < ApplicationController
  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
    @companies = Company.all
  end

  def create
    @job = Job.new(job_params)
    @companies = Company.all
    if @job.save
      redirect_to @job
    else
      flash[:error]= 'Não foi possível criar a vaga'
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
    @companies = Company.all
  end

  def update
    @job = Job.find(params[:id])
    @companies = Company.all
    if @job.update(job_params)
      redirect_to @job
    else
      flash[:error]= 'Não foi possível atualizar a vaga'
      render :edit
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :company_id, :location, :category, :description, :featured)
  end

end
