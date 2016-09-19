class SessionsController < ApplicationController
  def new

  end

  def create
    admin = Admin.find_by_email(params[:email])
    if admin && admin.authenticate(params[:password])
      session[:admin_id] = admin.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to '/login'
  end
end
