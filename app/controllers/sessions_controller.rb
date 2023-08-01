class SessionsController < ApplicationController
  def new; end

  # user signing in 
  def create
    @user = User.find_by(email: params[ :email])
  
    if @user.present? && @user.authenticate(params[ :password])
      session[ :user_id] = @user.id
      base_url = "/users/:user_id/articles/main"
      iD = @user.id
      user_specific_url = base_url.sub(':user_id', iD.to_s)
      redirect_to user_specific_url, notice: 'Logged In Successfully'
    else  
      flash.now[:alert] = 'Invalid email or password'
      render :new
    end    
  end
  
  # log out user
  def destroy 
    session[:user_id] = nil
    redirect_to root_path , notice: 'Logged Out Successfully'                           
  end   

end
