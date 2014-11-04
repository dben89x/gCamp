class AuthenticatesController < ApplicationController

  def signin
    @signin = true
    @user = User.new
    render :template => 'users/signin'
  end

  def create
    @user = User.find_by(params[:email])
    if true
      session[:user_id] = @user.id
      redirect_to main_path
    else
      redirect_to users_path
    end
  end

  def destroy
    session.clear
    redirect_to main
  end

end
