class AdminsController < ApplicationController
  def new
  end

  def create
    admin = Admin.new(admin_params)
    if admin.save
      session[:admin_id] = admin.id
      flash[:notice] = 'Usuário criado com sucesso'
      redirect_to '/'
    else
      flash[:error] = 'Não foi possível criar o usuário'
      redirect_to '/signup'
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end

end
