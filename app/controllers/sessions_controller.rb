class SessionsController < ApplicationController
  def new
  end

  def create
    @admin = Admin.find_by_id(params[:session][:id])
    if @admin
      session[:admin_id] = @admin.id
      session[:admin_username] = @admin.username
      session[:admin_email] = @admin.email        
      redirect_to @admin
    else
      render 'new'
    end
  end

  def destroy
    session.delete(:admin_id)
    render 'new'
  end

  def saved
    session[:admin_id] = @admin.id
  end
end
