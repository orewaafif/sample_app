class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params) #user_params will specify the specific parameters that will be accepted. No more, no less
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  private #keeping it private, not accessible publicly
  #don't forget the right indentation to avoid accidental private methods
    def user_params #the accepted parameters, including :user is always required
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
