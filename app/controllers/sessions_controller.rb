class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      flash[:success] = "Welcome to Holmon."
      redirect_back_or root_url
    else
     flash.now[:danger] = "Invalid email or Password."
     render 'new'
    end
  end
  
  def destroy
    sign_out
    redirect_to root_url
  end
end
