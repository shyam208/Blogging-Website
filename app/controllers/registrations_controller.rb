class RegistrationsController < ApplicationController
  
  #build new user
  def new
    @user = User.new 
  end
  
  # create and save user
  def create 
    @user = User.new(user_params)
    
    if @user.save
      WelcomeMailer.with(user: @user).welcome_email.deliver_now
      session[:user_id] = @user.id 
      redirect_to root_path, notice: 'Account Created Successfully'
    else  
      render :new
    end  
  end 
  
  private 

  def user_params 
    params.require(:user).permit(:email, :password, :password_confirmation)
  end  

end
