class UsersController < ApplicationController

  
 
 def show

 @user = User.find_by slug: params[:id]
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
      @user = User.find_by slug: params[:id]
 end 
 
 def update
      @user = User.find_by slug: params[:id]
 end
 
 
 def users_params
    params.require(:user).permit(:username,:password)
 end
 
end  

