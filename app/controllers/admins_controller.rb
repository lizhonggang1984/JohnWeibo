class AdminsController < ApplicationController
  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admins_params)
    if @admin.save
        session[:admin_id] = @admin.id
	redirect_to @admin
    else
      render 'new'
    end
  end

  def allcontent
    @admin = Admin.all
  end

  def index
    @admin = Admin.all
  end

  def show
    @admin = Admin.find(params[:id])
  end
  
  def admins_params
    params.require(:admin).permit(:username, :email)
  end
  
end
