class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password]) #this uses the authenticate method that comes with has_secure_password
      #login user
    else
      flash.now[:danger] = 'Invalid email/password combination' #not the final implementation
      render 'new'
    end
  end

  def destroy
  end

end
