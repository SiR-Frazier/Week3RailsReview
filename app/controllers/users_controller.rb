class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)

    if user.password.length < 8
       redirect_to "/sign_up"
       flash[:alert] = "Password must be 8 characters"
       return
    end
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
      flash[:notice] = "Thank you for signing up!"
    else
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
