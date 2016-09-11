class UsersController < ApplicationController

  def create
    @job = Job.find(params[:job_id])
    @user = @job.users.new(user_params)

    if @user.save
      flash[:notice] = 'Candidatura realizada com sucesso!'
      redirect_to @job
    else
      flash[:error] = 'Por favor, preencha todos os campos!'
      redirect_to @job
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :github, :linkedin, :description, :email, :phone)
  end
end
