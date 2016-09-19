class CompaniesController < ApplicationController
  before_action :authorize, only: [:new, :create, :edit, :update]

  def show
    find_company
    @jobs = @company.jobs.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to @company
    else
      flash[:error] = 'Preencha todos os campos'
      render :new
    end
  end

  def edit
    find_company
  end

  def update
    find_company
    if @company.update(company_params)
      redirect_to @company
    else
      flash[:error] = 'Preencha todos os campos'
      render :edit
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :mail, :phone, :location)
  end

  def find_company
    @company = Company.find(params[:id])
  end

end
