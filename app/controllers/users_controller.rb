class UsersController < ApplicationController 
  before_action :require_user, except: [:show, :index] 
  before_action :set_user , only: [:edit,:show,:update]

  def index

  end
  def show

  end 

  def new
    @user = User.new
  end
 
  def create
    @user = User.new(users_params) 

    if @user.save
	    flash[:notice] = "You are registered"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end

  end
 
  def edit
 
  end  
 
  def set_user
    @user = User.find_by slug:params[:id]
  end  
  
  def update
   
    if @user.update(users_params)
	    flash[:notice] = "This post is updated "
		  redirect_to user_path(@user)
		else
			render :edit
		end
	end
 
  def users_params
    params.require(:user).permit(:username,:password,:time_zone)
  end
 
end  

